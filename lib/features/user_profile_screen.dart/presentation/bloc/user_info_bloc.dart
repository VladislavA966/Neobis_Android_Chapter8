import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/entities/image_entity.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/entities/user_info_entity.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/usecase/pick_image_usecase.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/usecase/user_info_usecase.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserInfoUseCase useCase;
  final UploadImageUseCase imageUseCase;
  UserInfoBloc(this.useCase, this.imageUseCase) : super(UserInfoInitial()) {
    on<UpdateUserDataEvent>(_updateUserData);
    on<ImagePickerEvent>(_addImage);
  }

  Future<void> _addImage(
      ImagePickerEvent event, Emitter<UserInfoState> emit) async {
    emit(UserInfoLoading());
    try {
      final model = await imageUseCase.call(event.image);
      emit(
        PickImageLoaded(model: model),
      );
    } catch (e) {
      emit(
        UserInfoError(
          errorText: e.toString(),
        ),
      );
    }
  }

  Future<void> _updateUserData(
      UpdateUserDataEvent event, Emitter<UserInfoState> emit) async {
    emit(UserInfoLoading());
    try {
      final userData = await useCase.call(
          event.name, event.surname, event.surname, event.birthDay);
      emit(
        UserInfoLoaded(
          userData: userData,
        ),
      );
    } catch (e) {
      emit(
        UserInfoError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
