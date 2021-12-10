import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/modules/contracts.dart';
import 'package:posdelivery/app/routes/app_pages.dart';
import 'package:posdelivery/controllers/app_controller.dart';
import 'package:posdelivery/models/constants.dart';
import 'package:posdelivery/models/response/auth/employee_info.dart';
import 'package:posdelivery/providers/data/auth_data_provider.dart';
import 'package:posdelivery/services/app_service.dart';
import 'package:posdelivery/services/storage/local_storage_service.dart';

class BaseGetXController extends GetxController implements IBaseGetXController {
  // base dependency injections
  LocalStorage localStorage = Get.find<LocalStorage>();
  AppController appController = Get.find<AppController>();
  AppService appService = Get.find<AppService>();
  AuthDataProvider authDataProvider = Get.find<AuthDataProvider>();

  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    authDataProvider.callBack = this;
    super.onInit();
  }

  @override
  onLoadTokenInvalid() async {
    appService.authToken = Constants.none;
    if (appService.isLastLoggedIn) {
      Get.snackbar(
        'error'.tr,
        'login_no_login_credentials_please_login'.tr,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      appService.isLastLoggedIn = false;
    }
    await Future.delayed(Duration(seconds: 1));
    Get.offAllNamed(Routes.login);
  }

  @override
  void onLoadTokenValid(EmployeeInfo employeeInfo) {
    appService.employeeInfo = employeeInfo;
    print("on token validated");
    Get.offAllNamed(Routes.dashboard);
  }

  @override
  void validateLogin() async {
    await Future.delayed(Duration(seconds: 1));
    Get.toNamed(Routes.licence);
    //Get.offAllNamed(Routes.licence);
    // print("validation called from super");
    // if (localStorage.isAuthToken) {
    //   authDataProvider.getEmpInfoForHome();
    // } else {
    //   print("here triggered");
    //   onLoadTokenInvalid();
    // }
  }
}
