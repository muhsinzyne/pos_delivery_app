import 'package:posdelivery/models/response/pos/billers.dart';
import 'package:posdelivery/models/response/pos/warehouse.dart';

class MyInfoResponse {
  String? id;
  String? lastIpAddress;
  String? ipAddress;
  String? username;
  String? email;
  String? createdOn;
  String? lastLogin;
  String? active;
  String? firstName;
  String? lastName;
  String? company;
  String? phone;
  String? avatar;
  String? gender;
  String? groupId;
  String? warehouseId;
  String? billerId;
  String? companyId;
  String? showCost;
  String? showPrice;
  String? awardPoints;
  String? viewRight;
  String? editRight;
  String? allowDiscount;
  List<Billers>? billers;
  List<Warehouses>? warehouses;

  MyInfoResponse();
  MyInfoResponse.fromJSON(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    lastIpAddress = parsedJson['last_ip_address'];
    ipAddress = parsedJson['ip_address'];
    username = parsedJson['username'];
    email = parsedJson['email'];
    createdOn = parsedJson['created_on'];
    lastLogin = parsedJson['last_login'];
    active = parsedJson['active'];
    firstName = parsedJson['first_name'];
    lastName = parsedJson['last_name'];
    company = parsedJson['company'];
    phone = parsedJson['phone'];
    avatar = parsedJson['avatar'];
    gender = parsedJson['gender'];
    groupId = parsedJson['group_id'];
    warehouseId = parsedJson['warehouse_id'];
    billerId = parsedJson['biller_id'];
    companyId = parsedJson['company_id'];
    showCost = parsedJson['show_cost'];
    showPrice = parsedJson['show_price'];
    awardPoints = parsedJson['award_points'];
    viewRight = parsedJson['view_right'];
    editRight = parsedJson['edit_right'];
    allowDiscount = parsedJson['allow_discount'];
    billers = (parsedJson['billers'] as List<dynamic>)
        .map((e) => e == null ? null : Billers.fromJSON(e as Map<String, dynamic>))
        .cast<Billers>()
        .toList();
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};
}
