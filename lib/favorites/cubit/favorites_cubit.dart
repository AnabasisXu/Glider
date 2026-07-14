import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:equatable/equatable.dart';
import 'package:glider/common/extensions/bloc_base_extension.dart';
import 'package:glider/common/mixins/data_mixin.dart';
import 'package:glider/common/models/status.dart';
import 'package:glider/settings/models/favorite_export.dart';
import 'package:glider_domain/glider_domain.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:share_plus/share_plus.dart';

part 'favorites_cubit_event.dart';
part 'favorites_state.dart';

class FavoritesCubit extends HydratedCubit<FavoritesState>
    with BlocPresentationMixin<FavoritesState, FavoritesCubitEvent> {
  FavoritesCubit(
    this._itemInteractionRepository,
    this._itemRepository,
  ) : super(const FavoritesState()) {
    _favoriteIdsSubscription =
        _itemInteractionRepository.favoritedStream.listen(
      (itemIds) => safeEmit(
        state.copyWith(
          status: () => Status.success,
          data: () => itemIds,
          exception: () => null,
        ),
      ),
      // ignore: avoid_types_on_closure_parameters
      onError: (Object exception) => safeEmit(
        state.copyWith(
          status: () => Status.failure,
          exception: () => exception,
        ),
      ),
    );
  }

  final ItemInteractionRepository _itemInteractionRepository;
  final ItemRepository _itemRepository;

  /// Number of favorites fetched concurrently when exporting, to bound the
  /// load placed on the Hacker News API for large favorite collections.
  static const int _exportBatchSize = 10;

  late final StreamSubscription<List<int>> _favoriteIdsSubscription;

  Future<void> load() async {
    safeEmit(
      state.copyWith(status: () => Status.loading),
    );
    await _itemInteractionRepository.getFavoritedIds();
  }

  Future<void> exportFavorites() async {
    final ids = await _itemInteractionRepository.favoritedStream.first;
    if (ids.isEmpty) return;

    try {
      final items = <Item>[];
      // Fetch item details in bounded batches to avoid hammering the API.
      for (var start = 0; start < ids.length; start += _exportBatchSize) {
        final batch = ids.sublist(
          start,
          (start + _exportBatchSize).clamp(0, ids.length),
        );
        items.addAll(await Future.wait(batch.map(_itemRepository.getItem)));
      }

      final rows = [
        for (final item in items)
          FavoriteExportRow(
            id: item.id,
            title: item.title,
            url: item.url?.toString(),
            score: item.score,
            author: item.username,
            commentCount: item.descendantCount,
            type: item.type?.name,
          ),
      ];

      await Share.share(
        formatFavoritesAsTsv(rows),
        subject: 'Glider favorites',
      );
    } on Object {
      emitPresentation(const FavoritesActionFailedEvent());
    }
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) =>
      FavoritesState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(FavoritesState state) =>
      state.status == Status.success ? state.toMap() : null;

  @override
  Future<void> close() async {
    await _favoriteIdsSubscription.cancel();
    return super.close();
  }
}
