part of 'items_bloc.dart';

@immutable
sealed class ItemsEvent {}

class GetAllItemsEvent extends ItemsEvent {}

class GetMyItemsEvent extends ItemsEvent {}

class GetLikedItemsEvent extends ItemsEvent {}
