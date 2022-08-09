import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_sample_project/models/login_request.dart';
import 'package:http_sample_project/models/login_respose.dart';
import 'package:http_sample_project/utils/repo/http_repo.dart';

class LoginBloc {
  TextEditingController mobileNumberController = TextEditingController();
  String apiKey = "";
  int userId = 0;

  Future<void> callLoginRequest({required countryId}) async {
    final LoginRequest data = LoginRequest(
      mobileNumber: mobileNumberController.text,
      osType: Platform.isAndroid ? "android" : "iOS",
      deviceTypeName: "dss",
      osVersion: Platform.operatingSystemVersion,
      appVersion: "as",
      countryId: countryId,
    );

    final response = await HttpRepo().callRequest(
      requestType: HttpMethods.post,
      methodName: "auth-debug/",
      language: "en",
      data: data.toJson(),
    );

    final res = LoginResponse.fromJson(response);

    print("OTP   ${res.data!.lastOtp}");
    apiKey = res.data!.apiKey!;
    userId = res.data!.id!;
  }
}
