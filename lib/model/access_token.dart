class AccessToken {
  final String accessToken;
  final String tokenType;
  AccessToken({required this.accessToken, required this.tokenType});
  factory AccessToken.fromJson(Map<String, dynamic> json) {
    return AccessToken(
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
    );
  }
}
