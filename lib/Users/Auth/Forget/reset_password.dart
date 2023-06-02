import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pugau/Users/Controller/AuthController/login_controller.dart';
import 'package:pugau/util/theme/Pugau_images.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:pugau/widget/customSnakebar.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required String title});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController phone_no = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: GetBuilder<AuthController>(builder: (_contorller) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                ),
              ),
              Center(
                  child: Text(
                'Reset Password',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: const Offset(
                          10.0, // Move to right 10  horizontally
                          01.0,
                        )),
                  ],
                ),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    elevation: 5,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Number',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 30,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.start,
                                controller: phone_no,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: const TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  hintText: 'Number',
                                  hintStyle: const TextStyle(
                                      fontSize: 11, fontWeight: FontWeight.w500),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 153, 153, 153),
                                          width: 1)
                                      //<-- SEE HERE
                                      ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 153, 153, 153),
                                          width: 1)

                                      //<-- SEE HERE
                                      ),
                                ),
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          !_contorller.isLoading
                              ? Center(
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 18.2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    textColor: Colors.black,
                                    color: PugauColors.themeColor,
                                    onPressed: (() {
                                      if (phone_no.text.isEmpty) {
                                        showCustomSnackBar('Phone Is Empty',
                                            isError: true);
                                      } else {
                                        _contorller.resetPassword(phone_no.text);
                                      }
                                    }),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Send Password Reset Code',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: PugauColors.themeColor,
                                  ),
                                )
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              // Image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Image.asset(
                  Pugau_Images.ForgotPassword,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      })),
    );
  }
}
