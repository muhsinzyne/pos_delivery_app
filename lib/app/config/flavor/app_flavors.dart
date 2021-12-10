import 'package:posdelivery/app/config/flavor/src/flavor.dart';

import 'src/flavor_value.dart';

class AppFlavors {
  static FlavorValues devFlavor = FlavorValues(
    name: "beta",
    api: "http://rddc-app-21-a:4321/api/",
    cdn: "",
    isTest: true,
    oneSignalAppId: "8801857e-080b-4d49-aad4-5131a192bbd4",
    oneSignalRestApiKey: "ZmFlN2Q2YjctOWNiOC00NDQyLWFmNTgtYTM0NzY4ZmVmMjdi",
  );

  static FlavorValues stageFlavor = FlavorValues(
    name: "Stage",
    api: "http://rddc-app-21-a:4321/api/",
    cdn: "",
    isTest: true,
    oneSignalAppId: "8801857e-080b-4d49-aad4-5131a192bbd4",
    oneSignalRestApiKey: "ZmFlN2Q2YjctOWNiOC00NDQyLWFmNTgtYTM0NzY4ZmVmMjdi",
  );

  static FlavorValues prodFlavor = FlavorValues(
    name: "",
    api: "http://rddc-app-21-a:4321/api/",
    cdn: "",
    isTest: true,
    oneSignalAppId: "8801857e-080b-4d49-aad4-5131a192bbd4",
    oneSignalRestApiKey: "ZmFlN2Q2YjctOWNiOC00NDQyLWFmNTgtYTM0NzY4ZmVmMjdi",
  );

  static getLogLevel() {
    if (FlavorConfig.instance.flavorValues.isTest == true) {
      return print;
    }
  }
}
