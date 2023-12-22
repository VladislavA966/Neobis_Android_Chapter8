import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_android_chapter8/core/data/local_data_source.dart/local_data_source.dart';
import 'package:neobis_android_chapter8/features/login/domain/usecases/login_usecase.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LogInUseCase useCase;
  final LocalDataSource localDataSource;

  LogInBloc({required this.useCase, required this.localDataSource})
      : super(LogInInitial()) {
    on<SendLoginData>(_onSendLoginData);
  }

  Future<void> _onSendLoginData(
      SendLoginData event, Emitter<LogInState> emit) async {
    emit(LogInLoading());
    try {
      final responce = await useCase.call(event.logIn, event.password);
      localDataSource.saveUsername(responce.username);
      localDataSource.saveToken(responce.token);
      emit(
        LogInLoaded(),
      );
    } catch (e) {
      emit(LogInError(errorText: e.toString()));
    }
  }
}
