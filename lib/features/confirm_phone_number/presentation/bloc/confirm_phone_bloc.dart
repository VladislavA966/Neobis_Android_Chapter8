import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/domain/use_cases/confirm_phone_usecase.dart';
import 'package:neobis_android_chapter8/features/login/data/data_source/local_data_source.dart';

part 'confirm_phone_event.dart';
part 'confirm_phone_state.dart';

class ConfirmPhoneBloc extends Bloc<ConfirmPhoneEvent, ConfirmPhoneState> {
  final LocalDataSource localDataSource;
  final ConfirmPhoneUseCase useCase;
  ConfirmPhoneBloc(this.useCase, this.localDataSource)
      : super(ConfirmPhoneInitial()) {
    on<SendPhoneEvent>((event, emit) async {
      emit(ConfirmPhoneLoading());
      try {
        final userName = await localDataSource.getUsername() ?? '';
        if (userName != null) {
          await useCase.call(userName, event.phone);
          emit(
            ConfirmPhoneLoaded(),
          );
        } else {
          emit(
            ConfirmPhoneError(errorText: 'Ошибка'),
          );
        }
      } catch (e) {
        emit(
          ConfirmPhoneError(
            errorText: e.toString(),
          ),
        );
      }
    });
  }
}
