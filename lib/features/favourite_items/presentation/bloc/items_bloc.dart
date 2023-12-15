import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/entities/items_entity.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/usecase/items_use_case.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final ItemsUseCase useCase;

  ItemsBloc(this.useCase) : super(ItemsInitial()) {
    on<GetItemsEvent>(_onGetItemsEvent);
  }

  Future<void> _onGetItemsEvent(GetItemsEvent event, Emitter<ItemsState> emit) async {
    emit(ItemsLoading());
    try {
      final items = await useCase.call();
      emit(ItemsLoaded(items: items));
    } catch (e) {
      emit(ItemsError(errorText: e.toString()));
    }
  }
}
