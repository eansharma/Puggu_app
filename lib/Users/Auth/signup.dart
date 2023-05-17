import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:pugau/Users/Auth/select_city.dart';
import 'package:pugau/Users/Controller/login_controller.dart';
import 'package:pugau/util/theme/Pugau_Styles.dart';
import 'package:pugau/util/theme/Pugau_images.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required String title});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> countrycode = [
    '+91',
    '+92',
    '+93',
    '+94',
    '+95',
  ]; // Option 2
  int selectindex = 0;
  final TextEditingController phone = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Scaffold(body: GetBuilder<AuthController>(builder: (_authController) {
      return SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectindex = index;
                      });
                    },
                    height: 47.h,
                    viewportFraction: 1,
                    autoPlay: true,
                    initialPage: 0,
                    aspectRatio: 2 / 4.2),
                items: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        image: AssetImage(Pugau_Images.SignUpImage),
                        fit: BoxFit.cover,
                        width: Helper.getScreenWidth(context),
                      )),
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      child: Image(
                        image: AssetImage(Pugau_Images.SignUpImage),
                        fit: BoxFit.cover,
                        width: Helper.getScreenWidth(context),
                      )),
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      child: Image(
                        image: AssetImage(Pugau_Images.SignUpImage),
                        fit: BoxFit.cover,
                        width: Helper.getScreenWidth(context),
                      )),
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      child: Image(
                        image: AssetImage(Pugau_Images.SignUpImage),
                        fit: BoxFit.cover,
                        width: Helper.getScreenWidth(context),
                      )),
                ]),
            SizedBox(height: 2.h),
            PageViewDotIndicator(
              size: Size(13.sp, 13.sp),
              currentItem: selectindex,
              count: 4,
              unselectedColor: Colors.black26,
              selectedColor: Colors.red,
              duration: const Duration(milliseconds: 200),
              boxShape: BoxShape.circle,
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
                child: Text('Nepal,s No. 1 Food & Grocery\n Delivery App',
                    textAlign: TextAlign.center, style: regularHeadding)),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 41.w,
                    color: const Color.fromARGB(255, 153, 153, 153),
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Or',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: PugauColors.BLACK,
                          fontSize: 10,
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 1,
                      width: 41.w,
                      color: const Color.fromARGB(255, 153, 153, 153),
                      padding: const EdgeInsets.only(
                        top: 2,
                      )),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                children: [
                  Container(
                      height: 5.h,
                      width: 19.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 153, 153, 153)),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child: Text(
                            '+977',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )),
                  Container(
                      height: 5.h,
                      width: 71.5.w,
                      padding: const EdgeInsets.only(left: 17),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.start,
                        // maxLength: 10,
                        // inputFormatters: [],
                        controller: phone,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: 'Enter Phone Number',
                          hintStyle: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  BorderSide(color: PugauColors.GREY, width: 1)
                              //<-- SEE HERE
                              ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  BorderSide(color: PugauColors.GREY, width: 1)
                              //<-- SEE HERE
                              ),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            !_authController.isLoading
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: Center(
                        child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: 5.3.h,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            textColor: PugauColors.BLACK,
                            color: PugauColors.themeColor,
                            onPressed: (() {
                              if (phone.text.isEmpty) {
                                showCustomSnackBar('Phone Is Empty',
                                    isError: true);
                              } else {
                                _authController.generateOTP(phone.text);
                              }
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' CONTINUE', style: regularMediumWhite),
                              ],
                            ))),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                    color: PugauColors.themeColor,
                  )),

            // SizedBox(height: 16.0),
            // GetBuilder<OTPController>(
            //   builder: (controller) {
            //     if (controller.isLoading.value) {
            //       return CircularProgressIndicator();
            //     } else {
            //       return Text('OTP: ${controller.otp.value}');
            //     }
            //   },
            // ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 41.w,
                    color: PugauColors.GREY,
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Or',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: PugauColors.BLACK,
                          fontSize: 10,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 1,
                      width: 41.w,
                      color: PugauColors.GREY,
                      padding: const EdgeInsets.only(
                        top: 2,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Center(
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 5.5.h,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  textColor: Colors.black,
                  color: const Color.fromARGB(255, 252, 214, 211),
                  onPressed: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectCity(
                                title: '',
                              )),
                    );
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Skip For Now', style: regularMediumBlack),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'By continuing ,you agree to our\nTerm of Services Privacy Policy Content Policy',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: PugauColors.BLACK),
            ),
          ],
        ),
      );
      // })
    })));
  }
}
