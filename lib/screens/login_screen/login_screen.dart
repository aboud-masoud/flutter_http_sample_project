import 'package:flutter/material.dart';
import 'package:http_sample_project/screens/login_screen/login_bloc.dart';
import 'package:http_sample_project/screens/verify_otp/verify_otp_screen.dart';

class LoginScreen extends StatefulWidget {
  final int countryId;
  final int cityId;

  final String countryName;
  final String cityName;

  const LoginScreen({
    required this.countryId,
    required this.cityId,
    required this.countryName,
    required this.cityName,
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var bloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  widget.countryName,
                ),
                Text(widget.cityName),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: bloc.mobileNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      prefixIcon: const Icon(Icons.phone),
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
                  onPressed: bloc.mobileNumberController.text.isEmpty
                      ? null
                      : () async {
                          if (bloc.mobileNumberController.text.length != 10) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Mobile Number not valid"),
                            ));
                          } else {
                            await bloc.callLoginRequest(countryId: widget.countryId);

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (ctx) => VerifyOTPScreen(
                                    mobileNumber: bloc.mobileNumberController.text,
                                    countryId: widget.countryId,
                                    apiKey: bloc.apiKey,
                                    userId: bloc.userId,
                                  ),
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
      ),
    );
  }
}
