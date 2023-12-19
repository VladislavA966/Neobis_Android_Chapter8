import 'package:dio/dio.dart';

abstract class RemoteDataSourceRegistration {
  Future<void> registration(String name, String email, String password);
}

class RemoteDataSourceRegistrationImpl implements RemoteDataSourceRegistration {
  final Dio dio;

  RemoteDataSourceRegistrationImpl({required this.dio});
  @override
  Future<void> registration(String email, String password, String login, ) async {
    await dio.post('/api/auth/sign-up', data: {
      "email": email,
      "password": password,
      "username": login,
    });
  }
}
