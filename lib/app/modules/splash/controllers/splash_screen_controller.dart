import 'package:posdelivery/app/modules/splash/contracts.dart';
import 'package:posdelivery/controllers/base_controller.dart';

class SplashScreenController extends BaseGetXController implements ISplashScreenController {
  @override
  void onInit() {
    authDataProvider.homeCallBack = this;
    print("validate login calling from splash HomeController");
    super.validateLogin();
    super.onInit();
  }
}
