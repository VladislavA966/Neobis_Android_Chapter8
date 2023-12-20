import 'package:neobis_android_chapter8/features/confirm_phone_number/domain/repo/confirm_phone_repo.dart';

class ConfirmPhoneUseCase {
  final ConfirmPhoneRepo repo;

  ConfirmPhoneUseCase({required this.repo});
  Future<void> call(String username, String phone) async {
    return await repo.getPinCode(username, phone);
  }
}
