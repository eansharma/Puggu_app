import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Controller/AuthController/login_controller.dart';
import 'package:pugau/util/theme/Pugau_images.dart';
import 'package:pugau/widget/customSnakebar.dart';

class SetNamePassword extends StatefulWidget {
  const SetNamePassword({super.key, required String title});

  @override
  State<SetNamePassword> createState() => _SetNamePasswordState();
}

class _SetNamePasswordState extends State<SetNamePassword> {
  bool isTrue = false;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  bool obsecure=true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
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
                  'Set Name & Password',
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
                    shadowColor: Colors.black,
                    elevation: 5,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
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
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.start,
                                controller: name,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  hintText: 'Enter a Name',
                                  hintStyle: const TextStyle(
                                      fontSize: 11, fontWeight: FontWeight.w500),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 153, 153, 153),
                                          width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 153, 153, 153),
                                          width: 1)),
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 30,
                              child: TextFormField(
                                obscureText: obsecure,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.start,
                                controller: password,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: const TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                      fontSize: 11, fontWeight: FontWeight.w500),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 153, 153, 153),
                                          width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 153, 153, 153),
                                          width: 1)),
                                ),
                              )),
                          Row(
                            children: [
                              Checkbox(
                                  value: isTrue,
                                  onChanged: (value) {
                                    setState(() {
                                      isTrue = value!;
                                      if(isTrue)
                                        {
                                          obsecure=false;
                                        }
                                      else{
                                        obsecure=true;

                                      }
                                    });
                                  }),
                              Text(
                                'Show Password',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            'Confirm Password',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 30,
                              child: TextFormField(
                                obscureText: obsecure,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.start,
                                controller: confirm_password,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: const TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
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
                                          width: 1)),
                                ),
                              )),
                          SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 18.2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              textColor: Colors.black,
                              color: Colors.red,
                              onPressed: (() {
                                if (name.text.isEmpty) {
                                  showCustomSnackBar("Name is Empty",
                                      isError: true);
                                } else if (password.text.isEmpty) {
                                  showCustomSnackBar("Password is Empty",
                                      isError: true);
                                } else if (confirm_password.text.isEmpty) {
                                  showCustomSnackBar("Confirm Password is Empty",
                                      isError: true);
                                } else if (password.text !=
                                    confirm_password.text) {
                                  showCustomSnackBar("Password is not match ",
                                      isError: true);
                                } else {
                                  authController.User_Register(
                                      name.text.toString(),
                                      password.text.toString(),
                                      "",
                                      "",
                                      "");
                                }
                              }),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    ' REGISTER',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                    Pugau_Images.Register,
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
