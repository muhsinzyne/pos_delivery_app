import 'package:get/get.dart';
import 'package:posdelivery/app/modules/dashboard/contracts.dart';
import 'package:posdelivery/app/routes/app_pages.dart';
import 'package:posdelivery/controllers/base_controller.dart';

class DashboardScreenController extends BaseGetXController implements IDashboardScreenController {
  @override
  void onInit() {
    //authDataProvider.dashboardCallback = this;
    //print("validate login calling from splash dashboard controller");
    //super.validateLogin();
    super.onInit();
  }

  actionGoSales() {
    Get.toNamed(Routes.findCustomer);
  }

  actionGoReturns() {}
  actionGoSalesHistory() {}
  actionGoPayments() {}
}
