import 'package:dio/dio.dart';

abstract class AddUserDataDataSource {
  Future<void> sendUserData(
      String name, String surname, String lastname, String birthday);
}

class AddUserDataDataSourceImpl extends AddUserDataDataSource {
  final Dio dio;

  AddUserDataDataSourceImpl({required this.dio});
  @override
  Future<void> sendUserData(
      String name, String surname, String lastname, String birthday) async {
    await dio.put(
      '/api/user',
      data: {
        "name": name,
        "surname": surname,
        "lastname": lastname,
        "birthDate": birthday,
      },
    );
  }
}
