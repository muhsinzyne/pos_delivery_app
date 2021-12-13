import 'package:posdelivery/app/modules/auth/contracts.dart';
import 'package:posdelivery/app/modules/contracts.dart';
import 'package:posdelivery/app/modules/dashboard/contracts.dart';
import 'package:posdelivery/app/modules/splash/contracts.dart';
import 'package:posdelivery/models/requests/auth/login_request.dart';
import 'package:posdelivery/models/requests/auth/validate_licence.dart';
import 'package:posdelivery/models/response/auth/employee_info.dart';
import 'package:posdelivery/models/response/auth/licence_validation_response.dart';
import 'package:posdelivery/models/response/auth/login_response.dart';
import 'package:posdelivery/models/status_codes.dart';
import 'package:posdelivery/models/url.dart';
import 'package:posdelivery/providers/data/base_data_provider.dart';

class AuthDataProvider extends BaseDataProvider {
  late ILoginController loginCtrl;
  late IOtpVerificationController otpVerCtrl;
  late ISplashScreenController homeCtrl;
  late IDashboardScreenController dashCtrl;
  late IBaseGetXController bCtrl;
  late ILicenceScreenController lCtrl;

  set callBack(IBaseGetXController controller) {
    bCtrl = controller;
  }

  /// page call back seters
  set licenceValidationCallback(ILicenceScreenController controller) {
    lCtrl = controller;
  }

  set otpVerificationCallback(IOtpVerificationController controller) {
    otpVerCtrl = controller;
  }

  set loginCallBack(ILoginController controller) {
    loginCtrl = controller;
  }

  set homeCallBack(ISplashScreenController controller) {
    homeCtrl = controller;
  }

  set dashboardCallback(IDashboardScreenController controller) {
    dashCtrl = controller;
  }

  // validation for splash
  getEmpInfoForDashBoard() {
    final obs = network.get(NetworkURL.getEmpInfo).asStream();
    obs.listen(
      (data) {
        try {
          EmployeeInfo employeeInfo = EmployeeInfo.fromJSON(data.data);
          dashCtrl.onLoadTokenValid(employeeInfo);
        } on Exception {
          dashCtrl.onLoadTokenInvalid();
        }
      },
      onError: (err) {
        if (err.response?.statusCode == StatusCodes.status401Unauthorized) {
          dashCtrl.onLoadTokenInvalid();
        }
      },
    );
  }

  // validation for splash
  getEmpInfoForHome() {
    final obs = network.get(NetworkURL.getEmpInfo).asStream();
    obs.listen(
      (data) {
        try {
          EmployeeInfo employeeInfo = EmployeeInfo.fromJSON(data.data);
          homeCtrl.onLoadTokenValid(employeeInfo);
        } on Exception {
          homeCtrl.onLoadTokenInvalid();
        }
      },
      onError: (err) {
        if (err.response?.statusCode == StatusCodes.status401Unauthorized) {
          homeCtrl.onLoadTokenInvalid();
        }
      },
    );
  }

  // validation for splash
  getEmpInfo() {
    final obs = network.get(NetworkURL.getEmpInfo).asStream();
    obs.listen(
      (data) {
        try {
          EmployeeInfo employeeInfo = EmployeeInfo.fromJSON(data.data);
          bCtrl.onLoadTokenValid(employeeInfo);
        } on Exception {
          bCtrl.onLoadTokenInvalid();
        }
      },
      onError: (err) {
        if (err.response?.statusCode == StatusCodes.status401Unauthorized) {
          bCtrl.onLoadTokenInvalid();
        }
      },
    );
  }

  /// login call
  login(LoginRequest loginRequest) {
    final obs = network.post(NetworkURL.login, data: loginRequest.toJson()).asStream();
    obs.listen((data) {
      try {
        LoginResponse loginResponse = LoginResponse.fromJSON(data.data);
        loginCtrl.onLoginDone();
      } on Exception {
        loginCtrl.onLoginError();
      }
    }, onError: (err) {
      if (err.response?.statusCode == StatusCodes.status401Unauthorized) {
        loginCtrl.onLoginError();
      }
    });
  }

  validateLicence(ValidateLicenceRequest validateLicenceRequest) {
    final obs = network.post(NetworkURL.validateLicence, data: validateLicenceRequest.toJson()).asStream();
    obs.listen((data) {
      try {
        LicenceValidationResponse lvR = LicenceValidationResponse.fromJSON(data.data);
        lCtrl.onLicenceVerificationDone(lvR);
      } on Exception {
        print("exception");
      }
    }, onError: (err) {
      print("error fired");
      if (err.response?.statusCode == StatusCodes.status400BadRequest) {}
    });
  }
}
