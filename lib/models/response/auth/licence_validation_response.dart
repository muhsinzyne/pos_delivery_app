class LicenceValidationResponse {
  String? api;
  LicenceValidationResponse();
  LicenceValidationResponse.fromJSON(Map<String, dynamic> parsedJson) {
    api = parsedJson['api'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'api': api,
      };
}
