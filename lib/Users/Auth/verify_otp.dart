// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:pugau/Users/Auth/Forget/edit_number.dart';
import 'package:pugau/Users/Auth/set_name_password.dart';
import 'package:pugau/Users/Controller/login_controller.dart';

import '../../util/Helper/helper.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key, required String title});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController otp = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.5,
                      width: Helper.getScreenWidth(context) / 3.8,
                      color: const Color.fromARGB(255, 153, 153, 153),
                      padding: const EdgeInsets.only(
                        top: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('OTP VERIFICATION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 1.5,
                        width: Helper.getScreenWidth(context) / 3.8,
                        color: const Color.fromARGB(255, 153, 153, 153),
                        padding: const EdgeInsets.only(
                          top: 2,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              Text('WE have send a verification code on',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 20,
              ),
              const Text('+977 9151149965',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Pinput(
                  controller: otp,
                  onChanged: (value) {
                    if (otp.text.length == 6) {
                      authController.Verify_OTP(otp.text);
                    } else {
                      // showCustomSnackBar("OTP is invalid !", isError: true);
                    }
                  },
                  defaultPinTheme: PinTheme(
                      height: 43,
                      width: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      )),
                  length: 6,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    Center(
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 18.2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: const BorderSide(color: Colors.grey)),
                        textColor: Colors.black,
                        color: Colors.white,
                        onPressed: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SetNamePassword(
                                      title: '',
                                    )),
                          );
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Resend SMS in 59s',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 18.2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: const BorderSide(color: Colors.green)),
                        textColor: Colors.green,
                        color: Colors.white,
                        onPressed: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditNumber(
                                      title: '',
                                    )),
                          );
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Edit Number',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
