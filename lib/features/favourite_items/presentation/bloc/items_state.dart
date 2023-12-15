part of 'items_bloc.dart';

@immutable
sealed class ItemsState {}

final class ItemsInitial extends ItemsState {}

final class ItemsLoading extends ItemsState {}

final class ItemsLoaded extends ItemsState {
  final ItemList items;

  ItemsLoaded({required this.items});
}

final class ItemsError extends ItemsState {
  final String errorText;

  ItemsError({required this.errorText});
}
