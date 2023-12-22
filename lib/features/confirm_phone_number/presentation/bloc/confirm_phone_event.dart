part of 'confirm_phone_bloc.dart';

@immutable
sealed class ConfirmPhoneEvent {}

class SendPhoneEvent extends ConfirmPhoneEvent {
  final String phone;

  SendPhoneEvent({required this.phone});
}

class SendCodeEvent extends ConfirmPhoneEvent {
  final String phone;
  final int code;

  SendCodeEvent({required this.phone, required this.code});
}
