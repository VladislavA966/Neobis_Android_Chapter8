part of 'user_info_bloc.dart';

@immutable
sealed class UserInfoEvent {}

class UpdateUserDataEvent extends UserInfoEvent {
  final String name;
  final String surname;
  final String lastName;
  final String birthDay;

  UpdateUserDataEvent(
      {required this.name,
      required this.surname,
      required this.lastName,
      required this.birthDay});
}

class ImagePickerEvent extends UserInfoEvent {
  final File image;

  ImagePickerEvent({required this.image});
}
