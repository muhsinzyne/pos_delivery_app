class MyInfoResponse {
  String? id;
  String? lastIpAddress;
  String? ipAddress;
  String? username;
  String? email;
  String? createdOn;
  String? lastLogin;
  bool? active;
  String? firstName;
  String? lastName;
  String? company;
  String? phone;
  String? avatar;
  String? gender;
  num? groupId;
  num? warehouseId;
  num? billerId;
  num? companyId;
  bool? showCost;
  bool? showPrice;
  num? awardPoints;
  bool? viewRight;
  bool? editRight;
  bool? allowDiscount;

  MyInfoResponse();
  MyInfoResponse.fromJSON(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    lastIpAddress = parsedJson['last_ip_address'];
    ipAddress = parsedJson['ip_address'];
    username = parsedJson['username'];
    email = parsedJson['email'];
    createdOn = parsedJson['created_on'];
    lastLogin = parsedJson['last_login'];
    active = parsedJson['active'] as bool;
    firstName = parsedJson['first_name'];
    lastName = parsedJson['last_name'];
    company = parsedJson['company'];
    phone = parsedJson['phone'];
    avatar = parsedJson['avatar'];
    gender = parsedJson['gender'];
    groupId = parsedJson['group_id'] as num;
    warehouseId = parsedJson['warehouse_id'] as num;
    billerId = parsedJson['biller_id'] as num;
    companyId = parsedJson['company_id'] as num;
    showCost = parsedJson['show_cost'] as bool;
    showPrice = parsedJson['show_price'] as bool;
    awardPoints = parsedJson['award_points'] as num;
    viewRight = parsedJson['view_right'] as bool;
    editRight = parsedJson['edit_right'] as bool;
    allowDiscount = parsedJson['allow_discount'] as bool;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};
}
