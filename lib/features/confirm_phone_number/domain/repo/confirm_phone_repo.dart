abstract class ConfirmPhoneRepo {
  Future<void> sendPhone(String username, String phone);
  Future<void> sendCode(String username, String phone, int code);
}
