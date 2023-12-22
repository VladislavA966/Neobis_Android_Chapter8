import 'package:neobis_android_chapter8/features/confirm_phone_number/data/data_sources/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/domain/repo/confirm_phone_repo.dart';

class ConfirmPhoneNumberImpl implements ConfirmPhoneRepo {
  final ConfirmPhoneRemoteDataSource dataSource;

  ConfirmPhoneNumberImpl({required this.dataSource});
  @override
  Future<void> sendPhone(String username, String phone) async {
    await dataSource.sendPhone(username, phone);
  }

  @override
  Future<void> sendCode(String username, String phone, int code) async {
    await dataSource.sendCode(username, phone, code);
  }
}
