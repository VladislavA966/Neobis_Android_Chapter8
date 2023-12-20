import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/entities/user_info_entity.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/usecase/user_info_usecase.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserInfoUseCase useCase;
  UserInfoBloc(this.useCase) : super(UserInfoInitial()) {
    on<UpdateUserDataEvent>((event, emit) async {
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
    });
  }
}
