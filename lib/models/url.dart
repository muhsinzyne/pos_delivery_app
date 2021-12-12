import 'package:posdelivery/app/config/flavor/src/flavor.dart';

class NetworkURL {
  static var api = FlavorConfig.instance.flavorValues.api;
  static var validateLicence = FlavorConfig.instance.flavorValues.licenceServer;
  static var base = '';
  static var login = base + 'a';
  static var checkOtp = base + 'CheckOTP';
  static var getEmpInfo = base + 'GetEmpInfo';
}
