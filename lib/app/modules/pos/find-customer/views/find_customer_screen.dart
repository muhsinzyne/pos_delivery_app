import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/ui/theme/app_colors.dart';
import 'package:posdelivery/models/constants.dart';

import '../controllers/find_customer_controller.dart';

class FindCustomerScreen extends GetView<FindCustomerScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        title: Text('Sales - Select Customer'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: Constants.pagePadding),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                    ),
                    flex: 6,
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.blue,
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
