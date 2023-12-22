import 'package:dio/dio.dart';

abstract class ConfirmPhoneRemoteDataSource {
  Future<void> sendPhone(String username, String phone);
  Future<void> sendCode(String username, String phone, int code);
}

class ConfirmPhoneRemoteDataSourceImpl implements ConfirmPhoneRemoteDataSource {
  final Dio dio;

  ConfirmPhoneRemoteDataSourceImpl({required this.dio});
  @override
  Future<void> sendPhone(String username, String phone) async {
    await dio.put(
      '/api/user/send-code',
      options: Options(
        extra: {"requiresToken": true},
      ),
      data: {
        "username": username,
        "phone": phone,
      },
    );
  }

  @override
  Future<void> sendCode(String username, String phone, int code) async {
    await dio.put(
      '/api/user/phone-confirm',
      options: Options(
        extra: {"requiresToken": true},
      ),
      queryParameters: {"code": code},
      data: {
        "username": username,
        "phone": phone,
      },
    );
  }
}
