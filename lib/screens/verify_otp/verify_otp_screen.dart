import 'package:flutter/material.dart';
import 'package:http_sample_project/screens/main_screen/main_screen.dart';
import 'package:http_sample_project/screens/verify_otp/verify_otp_bloc.dart';

class VerifyOTPScreen extends StatefulWidget {
  final String mobileNumber;

  final int countryId;
  final String apiKey;
  final int userId;

  VerifyOTPScreen({required this.mobileNumber, required this.countryId, required this.apiKey, required this.userId, Key? key})
      : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final bloc = VerifyOTPBloc();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: bloc.otpController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'OTP',
                    prefixIcon: const Icon(Icons.sms),
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: bloc.otpController.text.isEmpty
                    ? null
                    : () async {
                        if (bloc.otpController.text.length < 5) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("OTP not valid"),
                          ));
                        } else {
                          await bloc.callRequestOfVerifyOTP(
                            mobileNumber: widget.mobileNumber,
                            countryId: widget.countryId,
                            apiKey: widget.apiKey,
                            userId: widget.userId,
                          );
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (ctx) => MainScreen(),
                              ),
                              (route) => false);
                        }
                      },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
