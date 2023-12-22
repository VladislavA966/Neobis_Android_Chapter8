import 'package:dio/dio.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/data/models/user_info_model.dart';

abstract class UserInfoRemoteDataSource {
  Future<UserInfoModel> updateUserData(
      String name, String surname, String lastName, String birthDate);
}

class UserInfoRemoteDataSourceImpl implements UserInfoRemoteDataSource {
  final Dio dio;

  UserInfoRemoteDataSourceImpl({required this.dio});
  @override
  Future<UserInfoModel> updateUserData(
      String name, String surname, String lastName, String birthDate) async {
    final responce = await dio.put(
      '/api/user',
      options: Options(extra: {"requiresToken": true}),
      data: {
        "name": name,
        "surname": surname,
        "lastname": lastName,
        "birthDate": birthDate,
      },
    );
    if (responce.statusCode == 200) {
      return UserInfoModel.fromJson(responce.data);
    } else {
      throw UnimplementedError();
    }
  }
}
