import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Controller/Feedback_form_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../util/Helper/helper.dart';

class MyFeedback extends StatefulWidget {
  const MyFeedback({super.key, required String title});

  @override
  State<MyFeedback> createState() => _MyFeedbackState();
}

class _MyFeedbackState extends State<MyFeedback> {
  final ComplaintFeedController controller = Get.put(ComplaintFeedController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    width: Helper.getScreenWidth(context) / 3.32,
                    color: const Color.fromARGB(255, 153, 153, 153),
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('MY FEEDBACK',
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
                      width: Helper.getScreenWidth(context) / 3.32,
                      color: const Color.fromARGB(255, 153, 153, 153),
                      padding: const EdgeInsets.only(
                        top: 2,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Obx(() => ListView.builder(
                  itemCount: controller.compFeedList.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('Feedback Type:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                    controller.compFeedList[index].type
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600)),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text('In Review',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text('Feedback Message:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      controller.compFeedList[index].message
                                          .toString(),
                                      // 'This is My Feedback Description',

                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
