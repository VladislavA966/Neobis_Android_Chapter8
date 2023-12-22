import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/domain/use_cases/confirm_phone_usecase.dart';
import 'package:neobis_android_chapter8/core/data/local_data_source.dart/local_data_source.dart';

part 'confirm_phone_event.dart';
part 'confirm_phone_state.dart';

class ConfirmPhoneBloc extends Bloc<ConfirmPhoneEvent, ConfirmPhoneState> {
  final LocalDataSource localDataSource;
  final ConfirmPhoneUseCase useCase;

  ConfirmPhoneBloc({
    required this.useCase,
    required this.localDataSource,
  }) : super(ConfirmPhoneInitial()) {
    on<SendCodeEvent>(_onSendCodeEvent);
    on<SendPhoneEvent>(_onSendPhoneEvent);
  }

  Future<void> _onSendCodeEvent(
    SendCodeEvent event,
    Emitter<ConfirmPhoneState> emit,
  ) async {
    emit(ConfirmPhoneLoading());
    try {
      final userName = await localDataSource.getUsername();
      if (userName!.isNotEmpty) {
        await useCase.sendCode(userName, event.phone, event.code);
        emit(ConfirmPhoneLoaded());
      } else {
        emit(ConfirmPhoneError(errorText: 'Имя пользователя не найдено'));
      }
    } on Exception catch (e) {
      emit(ConfirmPhoneError(errorText: e.toString()));
    }
  }

  Future<void> _onSendPhoneEvent(
    SendPhoneEvent event,
    Emitter<ConfirmPhoneState> emit,
  ) async {
    emit(ConfirmPhoneLoading());
    try {
      final userName = await localDataSource.getUsername();
      if (userName!.isNotEmpty) {
        await useCase.sendPhone(userName, event.phone);
        emit(ConfirmPhoneLoaded());
      } else {
        emit(ConfirmPhoneError(errorText: 'Имя пользователя не найдено'));
      }
    } on Exception catch (e) {
      emit(ConfirmPhoneError(errorText: e.toString()));
    }
  }
}
