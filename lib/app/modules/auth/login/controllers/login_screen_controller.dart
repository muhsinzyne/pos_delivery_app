import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/config/flavor/src/flavor.dart';
import 'package:posdelivery/app/modules/auth/contracts.dart';
import 'package:posdelivery/app/routes/app_pages.dart';
import 'package:posdelivery/app/ui/components/ui_notification.dart';
import 'package:posdelivery/models/constants.dart';
import 'package:posdelivery/models/requests/auth/login_request.dart';
import 'package:posdelivery/models/response/auth/login_response.dart';
import 'package:posdelivery/providers/data/auth_data_provider.dart';
import 'package:posdelivery/services/app_service.dart';

class LoginScreenController extends GetxController implements ILoginController {
  //TODO: Implement LoginController

  final loginFormKey = GlobalKey<FormState>();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final TextEditingController usernameInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final isRememberMeInput = RxBool(true);
  final hidePassword = RxBool(true);
  final AppService _appService = Get.find<AppService>();

  AuthDataProvider authDataProvider = Get.find<AuthDataProvider>();

  @override
  void onInit() {
    authDataProvider.loginCallBack = this;
    super.onInit();
  }

  nextFocus(FocusNode focusNode, context) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void submitForm() async {
    if (loginFormKey.currentState!.validate()) {
      UINotification.showLoading();
      final LoginRequest loginRequest = LoginRequest();
      loginRequest.username = usernameInput.value.text;
      loginRequest.password = passwordInput.value.text;
      loginRequest.rememberMe = isRememberMeInput.value;
      authDataProvider.login(loginRequest);
    } else {}

    print(FlavorConfig.instance.flavorValues.api);
  }

  @override
  void onLoginDone(LoginResponse loginResponse) async {
    //TODO: save token information from login response
    _appService.authToken = loginResponse.data?.token.toString() ?? '';
    Get.snackbar(
      'success'.tr,
      'login_success'.tr,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
    UINotification.hideLoading();
    await Future.delayed(Constants.oneSecDuration);
    Get.toNamed(Routes.dashboard);
  }

  @override
  void onLoginError() {
    UINotification.hideLoading();
    Get.snackbar(
      'error'.tr,
      'login_invalid_credentials'.tr,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
