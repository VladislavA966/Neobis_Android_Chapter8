import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/entities/items_entity.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/usecase/items_use_case.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final ItemsUseCase useCase;

  ItemsBloc(this.useCase) : super(ItemsInitial()) {
    on<GetAllItemsEvent>(_onGetItemsEvent);
    on<GetLikedItemsEvent>(_onGetLikedItemsEvent);
    on<GetMyItemsEvent>(_onGetMyItemsEvent);
  }

  Future<void> _onGetItemsEvent(GetAllItemsEvent event, Emitter<ItemsState> emit) async {
    emit(ItemsLoading());
    try {
      final model = await useCase.getAllProducts();
      emit(ItemsLoaded(model: model));
    } catch (e) {
      emit(ItemsError(errorText: e.toString()));
    }
  }

  Future<void> _onGetLikedItemsEvent(GetLikedItemsEvent event, Emitter<ItemsState> emit) async {
    emit(ItemsLoading());
    try {
      final model = await useCase.getLikedItems();
      emit(ItemsLoaded(model: model));
    } catch (e) {
      emit(ItemsError(errorText: e.toString()));
    }
  }

  Future<void> _onGetMyItemsEvent(GetMyItemsEvent event, Emitter<ItemsState> emit) async {
    emit(ItemsLoading());
    try {
      final model = await useCase.getMyItems();
      emit(ItemsLoaded(model: model));
    } catch (e) {
      emit(ItemsError(errorText: e.toString()));
    }
  }
}
