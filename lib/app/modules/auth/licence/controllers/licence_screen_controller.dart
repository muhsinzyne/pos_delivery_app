import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/modules/auth/contracts.dart';
import 'package:posdelivery/app/routes/app_pages.dart';
import 'package:posdelivery/controllers/base_controller.dart';
import 'package:posdelivery/models/constants.dart';

class LicenceScreenController extends BaseGetXController implements ILicenceScreenController {
  RxBool continuePermission = RxBool(false);
  RxString licenceCode = RxString('');

  @override
  void onInit() {
    // when licence code reaches max limit
    ever(licenceCode, (_) {
      if (licenceCode.value.length == Constants.licenceCodeLength) {
        continuePermission.value = true;
      } else {
        continuePermission.value = false;
      }
    });
    super.onInit();
  }

  void actionLicenceValidate() async {
    isLoading.value = true;
    print(licenceCode.value);
    await Future.delayed(Duration(seconds: 1));
    isLoading.value = false;
    onLicenceVerificationDone();
  }

  @override
  void onLicenceVerificationDone() async {
    //TODO: set the api cache logic in local
    //TODO set a value in shared preferece parameter to skip this page asked again

    Get.snackbar(
      'verified'.tr,
      'licence_verified_please_login_your_account'.tr,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
    );
    await Future.delayed(Duration(seconds: 1));
    Get.offAllNamed(Routes.login);
  }

  @override
  void onLicenceVerificationError() {
    Get.snackbar(
      'error'.tr,
      'licence_could_not_be_verified'.tr,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
    );
  }
}
