part of 'favorites_cubit.dart';

sealed class FavoritesCubitEvent {}

final class FavoritesActionFailedEvent implements FavoritesCubitEvent {
  const FavoritesActionFailedEvent();
}
