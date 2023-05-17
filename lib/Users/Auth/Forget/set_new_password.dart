import 'package:flutter/material.dart';
import 'package:pugau/Users/Auth/login.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';

import '../../../util/Helper/helper.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key, required String title});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.5,
                    width: Helper.getScreenWidth(context) / 4.1,
                    color: const Color.fromARGB(255, 153, 153, 153),
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('SET NEW PASSWORD',
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
                      width: Helper.getScreenWidth(context) / 4.1,
                      color: const Color.fromARGB(255, 153, 153, 153),
                      padding: const EdgeInsets.only(
                        top: 2,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 218, 216, 216),
                      blurRadius: 2.0, // soften the shadow
                      offset: Offset(
                        0,
                        3,
                      )),
                  BoxShadow(
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 218, 216, 216),
                      offset: Offset(0, -3)),
                  BoxShadow(
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 218, 216, 216),
                      offset: Offset(-3, 0))
                ],
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'New Password',
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
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            //  controller: number,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              hintText: 'New Password',
                              hintStyle: const TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w500),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
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
                      Row(
                        children: [
                          Checkbox(
                              value: isTrue,
                              onChanged: (value) {
                                setState(() {
                                  isTrue != value;
                                });
                              }),
                          const Text(
                            'Show Password',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      const Text(
                        'Confirm New Password',
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
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            //  controller: number,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              hintText: 'Confirm New Password',
                              hintStyle: const TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w500),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
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
                          color: PugauColors.themeColor,
                          onPressed: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login(
                                        title: '',
                                      )),
                            );
                          }),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Save Password',
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
            )
          ],
        ),
      ),
    );
  }
}
