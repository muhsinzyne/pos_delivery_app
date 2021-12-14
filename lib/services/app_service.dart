import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:posdelivery/app/config/flavor/flavor_service.dart';
import 'package:posdelivery/models/app_languages.dart';
import 'package:posdelivery/models/constants.dart';
import 'package:posdelivery/models/response/auth/employee_info.dart';
import 'package:posdelivery/models/response/auth/my_info_response.dart';
import 'package:posdelivery/services/base/get_x_service.dart';
import 'package:posdelivery/services/storage/local_storage_service.dart';

class AppService extends BaseGetXService {
  PackageInfo? packageInfo;
  late EmployeeInfo employeeInfo;
  MyInfoResponse myInfoResponse = MyInfoResponse();
  LocalStorage localStorage = Get.find<LocalStorage>();
  final _authToken = RxString('');
  final _isLastLoggedIn = RxBool(false);
  final _appServer = RxString('');
  final _appPrefix = RxString('');
  final _qrCodeResult = RxString('');
  final isScanned = RxBool(false);

  final List<AppLocale> languageList = AppLocale.appLocalList;

  @override
  void onInit() {
    dependencies();
    super.onInit();
    //ever(_authToken, (_) => print(_authToken.value));
    ever(_appServer, (_) => print(_appServer.value));
    //ever(_isLastLoggedIn, (_) => print("is logged in updated -  ${_isLastLoggedIn.value}"));
  }

  @override
  Future dependencies() async {
    try {
      packageInfo = await PackageInfo.fromPlatform();
    } on Exception {
      //
    }

    _preloadValues();
  }

  String get authToken => _authToken.value;
  bool get isLastLoggedIn => _isLastLoggedIn.value;
  String get qrCodeResult => _qrCodeResult.value;
  String get cdnUrl => FlavorConfig.instance.flavorValues.api + Constants.smaUploadPath + '/';
  String get saasCdnUrl =>
      FlavorConfig.instance.flavorValues.api + Constants.smaUploadPath + '/' + FlavorConfig.instance.flavorValues.appPrefix + '/';

  set qrCodeResult(String value) {
    _qrCodeResult.value = value;
    isScanned.value = true;
  }

  set isLastLoggedIn(bool value) {
    _isLastLoggedIn.value = value;
    localStorage.setBool(Constants.isLastLoggedIn, value);
  }

  set authToken(String value) {
    _authToken.value = value;
    localStorage.setString(Constants.authToken, value);
  }

  set appServer(String value) {
    _appServer.value = value;
    localStorage.setString(Constants.appServer, value);
  }

  set appPrefix(String value) {
    _appPrefix.value = value;
    localStorage.setString(Constants.appPrefix, value);
  }

  _preloadValues() {
    final String? tempToken = localStorage.getString(Constants.authToken);
    final String? tempAppServer = localStorage.getString(Constants.appServer);
    final String? tempAppPrefix = localStorage.getString(Constants.appPrefix);
    authToken = tempToken.toString();
    appServer = tempAppServer.toString();
    appPrefix = tempAppPrefix.toString();
  }
}
