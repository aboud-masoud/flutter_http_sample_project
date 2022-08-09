class LoginResponse {
  LoginResponseData? data;
  String? message;
  String? requestId;

  LoginResponse({this.data, this.message, this.requestId});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginResponseData.fromJson(json['data']) : null;
    message = json['message'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['request_id'] = this.requestId;
    return data;
  }
}

class LoginResponseData {
  int? id;
  String? apiKey;
  bool? blocked;
  Null? firstName;
  Null? lastName;
  String? lastOtp;

  LoginResponseData({this.id, this.apiKey, this.blocked, this.firstName, this.lastName, this.lastOtp});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiKey = json['api_key'];
    blocked = json['blocked'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    lastOtp = json['last_otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['api_key'] = this.apiKey;
    data['blocked'] = this.blocked;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['last_otp'] = this.lastOtp;
    return data;
  }
}
