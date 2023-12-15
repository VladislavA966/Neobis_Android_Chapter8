part of 'items_bloc.dart';

@immutable
sealed class ItemsEvent {}

class GetItemsEvent extends ItemsEvent {}
