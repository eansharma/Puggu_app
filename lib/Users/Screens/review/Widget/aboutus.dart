import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pugau/Users/Controller/Privacy_Controller.dart';

import '../../../../util/Helper/helper.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key, required String title});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Scaffold(body: GetBuilder<PrivacyController>(builder: (_controller) {
      return Column(
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
                const Text('ABOUT US',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
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
          Image(
            image: const AssetImage('assets/images/cityimage.png'),
            height: 137,
            width: Helper.getScreenWidth(context),
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: Helper.getScreenWidth(context),
            height: 160,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: Helper.getScreenWidth(context) / 2.7,
                        color: const Color.fromARGB(255, 153, 153, 153),
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('Summary',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          height: 1.5,
                          width: Helper.getScreenWidth(context) / 2.7,
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // ignore: invalid_use_of_protected_member
                  child: Text(
                      _controller.list.isNotEmpty
                          ? _controller.list[0].value.toString()
                          : '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: Helper.getScreenWidth(context),
            height: 210,
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
            child: Column(
              children: [
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
                      const Text('Description',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w700)),
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
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      _controller.list.isNotEmpty
                          ? _controller.list[0].value.toString()
                          : '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
          )
        ],
      );
    })));
  }
}
