import 'package:dio/dio.dart';
import 'package:neobis_android_chapter8/features/login/data/models/token_model.dart';

abstract class RemoteDataSource {
  Future<TokenModel> logIn(String name, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});
  @override
  Future<TokenModel> logIn(String login, String password) async {
    final responce = await dio.post('/api/auth/sign-in',
        options: Options(extra: {"requiresToken": false}),
        data: {"username": login, "password": password});
    if (responce.statusCode == 200) {
      return TokenModel.fromJson(responce.data);
    } else {
      throw Exception();
    }
  }
}
