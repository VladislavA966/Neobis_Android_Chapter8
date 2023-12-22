import 'package:neobis_android_chapter8/features/confirm_phone_number/domain/repo/confirm_phone_repo.dart';

class ConfirmPhoneUseCase {
  final ConfirmPhoneRepo repo;

  ConfirmPhoneUseCase({required this.repo});
  Future<void> sendPhone(String username, String phone) async {
    await repo.sendPhone(username, phone);
  }

  Future<void> sendCode(String username, String phone, int code) async {
    await repo.sendCode(username, phone, code);
  }
}
