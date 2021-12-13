import 'package:posdelivery/models/response/auth/check_otp_respose.dart';
import 'package:posdelivery/models/response/auth/licence_validation_response.dart';

abstract class ILoginController {
  void onLoginDone();
  void onLoginError();
}

abstract class IOtpVerificationController {
  void onVerificationDone(CheckOtpResponse otpResponse);
  void onVerificationError();
}

abstract class ILicenceScreenController {
  void onLicenceVerificationDone(LicenceValidationResponse lvR);
  void onLicenceVerificationError();
}
