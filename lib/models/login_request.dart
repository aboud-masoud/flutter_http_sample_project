class LoginRequest {
  String? mobileNumber;
  String? osType;
  String? deviceTypeName;
  String? osVersion;
  String? appVersion;
  int? countryId;

  LoginRequest({this.mobileNumber, this.osType, this.deviceTypeName, this.osVersion, this.appVersion, this.countryId});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    osType = json['os_type'];
    deviceTypeName = json['device_type_name'];
    osVersion = json['os_version'];
    appVersion = json['app_version'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_number'] = this.mobileNumber;
    data['os_type'] = this.osType;
    data['device_type_name'] = this.deviceTypeName;
    data['os_version'] = this.osVersion;
    data['app_version'] = this.appVersion;
    data['country_id'] = this.countryId;
    return data;
  }
}
