part of 'log_in_bloc.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInLoading extends LogInState {}

final class LogInLoaded extends LogInState {}

final class LogInError extends LogInState {
  final String errorText;

  LogInError({required this.errorText});
}
