import 'package:posdelivery/app/config/flavor/flavor_service.dart';

class FlavorConfig {
  Flavor flavor;
  FlavorValues flavorValues;
  static FlavorConfig? _instance;

  factory FlavorConfig({required Flavor flavor, required FlavorValues flavorValues}) {
    return FlavorConfig._initialize(flavor, flavorValues);
  }

  FlavorConfig._initialize(this.flavor, this.flavorValues);
  static FlavorConfig get instance => _instance ?? FlavorConfig(flavor: Flavor.development, flavorValues: AppFlavors.devFlavor);
}