class TokenModel {
  String? token;
  String? refreshToken;
  String? authorities;
  String? username;

  TokenModel({this.token, this.refreshToken, this.authorities, this.username});

  TokenModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    authorities = json['authorities'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['authorities'] = authorities;
    data['username'] = username;
    return data;
  }
}
