import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<void> logIn(String name, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});
  @override
  Future<void> logIn(String login, String password) async {
    await dio.post('/login/', data: {"login": login, "password": password});
  }
}
