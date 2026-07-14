part of 'favorites_cubit.dart';

sealed class FavoritesCubitEvent {}

final class FavoritesActionFailedEvent implements FavoritesCubitEvent {
  const FavoritesActionFailedEvent();
}

final class FavoritesExportedEvent implements FavoritesCubitEvent {
  const FavoritesExportedEvent(this.path);

  final String path;
}
