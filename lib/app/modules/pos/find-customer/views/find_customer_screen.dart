import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/find_customer_controller.dart';

class FindCustomerScreen extends GetView<FindCustomerScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FindCustomerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FindCustomerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
