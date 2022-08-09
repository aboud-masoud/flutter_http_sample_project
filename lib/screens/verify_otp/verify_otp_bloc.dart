import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_sample_project/models/otp_request.dart';
import 'package:http_sample_project/models/otp_response.dart';
import 'package:http_sample_project/utils/repo/http_repo.dart';

class VerifyOTPBloc {
  TextEditingController otpController = TextEditingController();

  Future<void> callRequestOfVerifyOTP({
    required String mobileNumber,
    required int countryId,
    required String apiKey,
    required int userId,
  }) async {
    final OTPRequest data = OTPRequest(
      mobileNumber: mobileNumber,
      osType: Platform.isAndroid ? "android" : "iOS",
      deviceTypeName: "dss",
      osVersion: Platform.operatingSystemVersion,
      appVersion: "1.0",
      countryId: countryId,
      otp: otpController.text,
      apiKey: apiKey,
      userId: userId,
    );

    final response = await HttpRepo().callRequest(
      requestType: HttpMethods.post,
      methodName: "auth-verify/",
      language: "en",
      data: data.toJson(),
    );

    final res = OTPResponse.fromJson(response);

    print(res.data!.tokenType);
    print(res.data!.token);
  }
}
