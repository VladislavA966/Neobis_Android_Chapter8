import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'confirm_phone_event.dart';
part 'confirm_phone_state.dart';

class ConfirmPhoneBloc extends Bloc<ConfirmPhoneEvent, ConfirmPhoneState> {
  ConfirmPhoneBloc() : super(ConfirmPhoneInitial()) {
    on<ConfirmPhoneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
