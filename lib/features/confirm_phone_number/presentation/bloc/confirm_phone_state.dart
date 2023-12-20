part of 'confirm_phone_bloc.dart';

@immutable
sealed class ConfirmPhoneState {}

final class ConfirmPhoneInitial extends ConfirmPhoneState {}

final class ConfirmPhoneLoading extends ConfirmPhoneState {}

final class ConfirmPhoneLoaded extends ConfirmPhoneState {}

final class ConfirmPhoneError extends ConfirmPhoneState {
  final String errorText;

  ConfirmPhoneError({required this.errorText});
}
