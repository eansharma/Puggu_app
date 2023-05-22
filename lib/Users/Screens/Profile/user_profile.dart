import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pugau/Users/Auth/Forget/set_new_password.dart';
import 'package:pugau/Users/Controller/login_controller.dart';
import 'package:pugau/Users/Screens/review/Widget/aboutus.dart';
import 'package:pugau/Users/Screens/review/Widget/complaint_feedback.dart';
import 'package:pugau/Users/Screens/review/customer_review.dart';
import 'package:pugau/Users/Screens/faq.dart';
import 'package:pugau/Users/Screens/review/Widget/feedback.dart';
import 'package:pugau/Users/Screens/my_address.dart';
import 'package:pugau/Users/Screens/no_internet_connection.dart';
import 'package:pugau/Users/Screens/Order/order.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:pugau/widget/customSnakebar.dart';

import '../../Auth/Forget/change_password.dart';
import '../../Auth/Forget/reset_password.dart';
import '../../Controller/Web_controller.dart';
import '../favorite_list.dart';
import '../googlepay.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required String title});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final WebController _controller = Get.put(WebController());
  final TextEditingController name = TextEditingController();
  final TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
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
        Container(
          width: Helper.getScreenWidth(context),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.4),
                  // blurRadius: 2.0,
                  spreadRadius: 2.0,
                  offset: const Offset(
                    0.0,
                    1.0,
                  )),
            ],
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showFlexibleBottomSheet(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      minHeight: 0,
                      initHeight: 0.5,
                      maxHeight: 1,
                      context: context,
                      builder: _buildBottomSheet,
                      anchors: [0, 0.5, 1],
                      isSafeArea: true,
                    );
                  },
                  child: Row(
                    children: [
                      const Text(
                        'User Name',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/profile.png'),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FevoriteList(
                                    title: '',
                                  )),
                        );
                      },
                      child: Column(
                        children: const [
                          Icon(Icons.favorite_border_outlined),
                          Text(
                            'Favorites',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyAddress(
                                    title: '',
                                  )),
                        );
                      },
                      child: Column(
                        children: const [
                          Icon(Icons.book),
                          Text(
                            'Address Book',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomerReview(
                                    title: '',
                                  )),
                        );
                      },
                      child: Column(
                        children: const [
                          Icon(Icons.star_border_outlined),
                          Text(
                            'Your Rating',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GooglePay(
                                    title: '',
                                  )),
                        );
                      },
                      child: Column(
                        children: const [
                          Icon(Icons.account_balance_wallet_outlined),
                          Text(
                            'Payment',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: Helper.getScreenWidth(context),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.4),
                  // blurRadius: 2.0,
                  spreadRadius: 2.0,
                  offset: const Offset(
                    0.0,
                    1.0,
                  )),
            ],
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Order(
                                title: '',
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.shopping_bag,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'My Order',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: PugauColors.GREY,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(ResetPassword(
                      title: '',
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.notification_important_sharp,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'How to Order',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ComplaintFeedback(
                                title: '',
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.feedback,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Complaint & Feedback',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyFeedback(
                                title: '',
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.feedback,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Feedback',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FAQ(
                                title: '',
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.message_rounded,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'FAQ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutUs(
                                title: '',
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.help_center_outlined,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutUs(
                                title: '',
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.help,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Terms & Condition',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                ),
                GetBuilder<WebController>(
                  builder: (_controller) {
                    return GestureDetector(
                      onTap: () {
                        _controller.fechData("About Us");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutUs(
                                    title: '',
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.feedback_rounded,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'About US',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePassword(
                                title: '',
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.lock,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Change Password',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NoInternet(
                                title: '',
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    )));
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return GetBuilder<AuthController>(builder: (_authController)
    {
      return  Container(
        child: ListView(
          controller: scrollController,
          children: [
            SingleChildScrollView(
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1.5,
                              width: Helper.getScreenWidth(context) / 2.9,
                              color: const Color.fromARGB(255, 153, 153, 153),
                              padding: const EdgeInsets.only(
                                top: 2,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('EDIT PROFILE',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                                height: 1.5,
                                width: Helper.getScreenWidth(context) / 2.9,
                                color: const Color.fromARGB(255, 153, 153, 153),
                                padding: const EdgeInsets.only(
                                  top: 2,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GetBuilder<AuthController>(builder: (procontroller){
                       
                          var userProfile = procontroller.userProfile.value;
                          name.text= userProfile.name.toString();
                          // number.text=userProfile.phone.toString();
                          number.text=userProfile.phone.toString();
                          
                          return  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Full Name',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                height: 40,
                                child: TextFormField(
                                  // initialValue: userProfile.name??"",
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.start,
                                   controller: name,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    hintText: 'User Full Name',
                                    
                                    // label:Text('${_authController.getUserlist.length}'),
                                    hintStyle: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 153, 153, 153),
                                            width: 1)
                                        //<-- SEE HERE
                                        ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 153, 153, 153),
                                            width: 1)

                                        //<-- SEE HERE
                                        ),
                                   ),
                                              onChanged: (value) {
              // Update the phone number in the controller if needed
                               procontroller.userProfile.update((val) {
                                  val!.phone = value;
                                });
                              },


                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                height: 40,
                                child: TextFormField(
                                  // initialValue: userProfile.phone ??"",
                                  
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.start,
                                   controller: number,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    hintText: 'Phone Number',
                                    hintStyle: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 153, 153, 153),
                                            width: 1)
                                        //<-- SEE HERE
                                        ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 153, 153, 153),
                                            width: 1)

                                        //<-- SEE HERE
                                        ),
                                  ),
                                  onChanged: (value) {
              // Update the phone number in the controller if needed
                                procontroller.userProfile.update((val) {
                                  val!.phone = value;
                                });
                              },
                                )),
                          ],
                        );
                     
                        }
                        
                        
                        )
                     
                     
                      ),
                   
                   
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 18.2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            textColor: Colors.black,
                            color: Colors.red,
                            onPressed: (() {
                              if(name.text.isEmpty){
                                showCustomSnackBar('Name is Empty!');
                              } else if(number.text.isEmpty){
                                showCustomSnackBar('Number is Empty !');
                              }
                              else{
                                _authController.editUserProfile(
                                  name.text.toString(),
                                  number.text.toString()
                                );

                              }



                              //            Navigator.push(
                              //    context,
                              //    MaterialPageRoute(builder: (context) => const ResetPassword  (title: '',)),
                              //  );
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Save',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );


    });

  }
}
