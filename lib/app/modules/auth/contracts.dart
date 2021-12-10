import 'package:posdelivery/models/response/auth/check_otp_respose.dart';

abstract class ILoginController {
  void onLoginDone();
  void onLoginError();
}

abstract class IOtpVerificationController {
  void onVerificationDone(CheckOtpResponse otpResponse);
  void onVerificationError();
}

abstract class ILicenceScreenController {
  void onLicenceVerificationDone();
  void onLicenceVerificationError();
}
