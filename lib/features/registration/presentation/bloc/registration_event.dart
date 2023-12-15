part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class GetRegistrationEvent extends RegistrationEvent {
  final String userName;
  final String email;
  final String password;

  GetRegistrationEvent(
      {required this.userName, required this.email, required this.password });
}
