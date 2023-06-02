// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:pugau/Users/Auth/Forget/edit_number.dart';
import 'package:pugau/Users/Auth/set_name_password.dart';
import 'package:pugau/Users/Controller/AuthController/login_controller.dart';
import 'package:pugau/util/theme/Pugau_images.dart';

import '../../util/Helper/helper.dart';

class VerifyOtp extends StatefulWidget {
  String? type;
  String? phone;
  VerifyOtp({required this.type,required this.phone});
  //  VerifyOtp({super.key, required String type,required String phone});

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
          body: SingleChildScrollView(
            child: Column(
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
                Text('+977 '+widget.phone.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Pinput(
                    controller: otp,
                    onChanged: (value) {
                      if (otp.text.length == 6) {
                        setState((){

                        });
                        print(widget.type.toString()+"hiii");
                        authController.Verify_OTP(otp.text, widget.type,widget.phone);
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
                 SizedBox(
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
                SizedBox(
                  height: 50,
                ),
                // Image
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Image.asset(
                    Pugau_Images.OTP_Image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
