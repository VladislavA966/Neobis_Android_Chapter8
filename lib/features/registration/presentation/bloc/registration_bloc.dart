import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_android_chapter8/features/registration/domain/usecases/registration_use_case.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationUseCase useCase;
  RegistrationBloc({required this.useCase}) : super(RegistrationInitial()) {
    on<GetRegistrationEvent>(_onGetRegistration);
  }



  
  Future<void> _onGetRegistration(
      GetRegistrationEvent event, Emitter<RegistrationState> emit) async {
    try {
      await useCase.call(event.userName, event.email, event.password);
      emit(
        RegistrationLoaded(),
      );
    } catch (e) {
      emit(
        RegistrationError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
