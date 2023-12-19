class TokenEntity {
  final String token;
  final String refreshToken;
  final String authorities;
  final String username;

  TokenEntity(
      {required this.token,
      required this.refreshToken,
      required this.authorities,
      required this.username});
}
