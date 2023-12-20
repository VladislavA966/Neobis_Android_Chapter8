import 'package:dio/dio.dart';

abstract class ConfirmPhoneRemoteDataSource {
  Future<void> getPinCode(String username, String phone);
}

class ConfirmPhoneRemoteDataSourceImpl implements ConfirmPhoneRemoteDataSource {
  final Dio dio;

  ConfirmPhoneRemoteDataSourceImpl({required this.dio});
  @override
  Future<void> getPinCode(String username, String phone) async {
    await dio.put('/api/user/send-code', data: {
      "username": username,
      "phone": phone,
    });
  }
}
