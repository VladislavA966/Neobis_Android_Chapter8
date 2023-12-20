part of 'user_info_bloc.dart';

@immutable
sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

final class UserInfoLoading extends UserInfoState {}

final class UserInfoLoaded extends UserInfoState {
  final UserInfoEntity userData;

  UserInfoLoaded({required this.userData});
}

final class UserInfoError extends UserInfoState {
  final String errorText;

  UserInfoError({required this.errorText});
}
