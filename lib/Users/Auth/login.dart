import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Auth/Forget/reset_password.dart';
import 'package:pugau/Users/Controller/AuthController/login_controller.dart';
import 'package:pugau/util/theme/Pugau_images.dart';

import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:pugau/widget/customSnakebar.dart';

class Login extends StatefulWidget {
  String? user_id;
  Login({required this.user_id});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<AuthController>(builder: (_contorller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text('Login Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                      color: Color.fromARGB(255, 180, 179, 179),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [

                            BoxShadow(
                                color: Colors.grey.withOpacity(.4),
                                blurRadius: 0.5,
                                spreadRadius: 1.0,
                                offset: Offset(
                                  0.0,
                                  1.0,
                                )),
                          ],
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Password',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                  height: 35,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.start,
                                    controller: password,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        fontSize: 11, fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(7),
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(255, 153, 153, 153),
                                              width: 1)
                                        //<-- SEE HERE
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(255, 153, 153, 153),
                                              width: 1)

                                        //<-- SEE HERE
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: MaterialButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height / 21,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  textColor: Colors.black,
                                  color: PugauColors.themeColor,
                                  onPressed: (() {
                                    if (password.text.isEmpty) {
                                      showCustomSnackBar('Phone Is Empty', isError: true);
                                    } else {
                                      _contorller.Login_password(password.text,widget.user_id);
                                    }
                                  }),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const ResetPassword(
                                              title: '',
                                            )),
                                      );
                                    },
                                    child: const Text(
                                      'Forgot Your Password ?',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    // Image
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                      child: Image.asset(
                        Pugau_Images.EnterPassword,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            }
            )
        )
    );
  }
}
