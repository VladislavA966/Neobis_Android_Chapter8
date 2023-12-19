abstract class RegistrationRepo {
  Future<void> registration(
    String email,
    String password,
    String login
  );
}
