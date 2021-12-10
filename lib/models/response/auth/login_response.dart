class LoginResponse {
  String? token;
  LoginResponse();
  LoginResponse.fromJSON(Map<String, dynamic> parsedJson) {
    token = parsedJson['token'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
      };
}
