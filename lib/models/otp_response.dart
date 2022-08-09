class OTPResponse {
  OTPResponseData? data;
  String? message;

  OTPResponse({this.data, this.message});

  OTPResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new OTPResponseData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class OTPResponseData {
  String? token;
  String? tokenType;

  OTPResponseData({this.token, this.tokenType});

  OTPResponseData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    return data;
  }
}
