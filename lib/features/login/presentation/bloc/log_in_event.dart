part of 'log_in_bloc.dart';

@immutable
sealed class LogInEvent {}

class SendLoginData extends LogInEvent {
  final String logIn;
  final String password;

  SendLoginData({required this.logIn, required this.password});
}
