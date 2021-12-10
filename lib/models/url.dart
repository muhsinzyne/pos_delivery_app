import 'package:posdelivery/app/config/flavor/src/flavor.dart';

class NetworkURL {
  static var api = FlavorConfig.instance.flavorValues.api;
  static var base = 'RDCCI/';
  static var login = base + 'Login';
  static var checkOtp = base + 'CheckOTP';
  static var getEmpInfo = base + 'GetEmpInfo';
}
