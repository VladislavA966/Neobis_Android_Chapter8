part of 'items_bloc.dart';

@immutable
sealed class ItemsState {}

final class ItemsInitial extends ItemsState {}

final class ItemsLoading extends ItemsState {}

final class ItemsLoaded extends ItemsState {
  final ItemList model;

  ItemsLoaded({required this.model});
}

final class ItemsError extends ItemsState {
  final String errorText;

  ItemsError({required this.errorText});
}
