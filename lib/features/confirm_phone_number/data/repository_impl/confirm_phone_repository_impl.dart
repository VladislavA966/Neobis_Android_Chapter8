import 'package:neobis_android_chapter8/features/confirm_phone_number/data/data_sources/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/domain/repo/confirm_phone_repo.dart';

class ConfirmPhoneNumberImpl implements ConfirmPhoneRepo {
  final ConfirmPhoneRemoteDataSource dataSource;

  ConfirmPhoneNumberImpl({required this.dataSource});
  @override
  Future<void> getPinCode(String username, String phone) async {
    await dataSource.getPinCode(username, phone);
  }
}
