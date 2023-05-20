import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Users/Controller/food_controller.dart';

import '../../util/Helper/helper.dart';

class SelectTaskCategory extends StatefulWidget {
  const SelectTaskCategory({super.key, required String title});

  @override
  State<SelectTaskCategory> createState() => _SelectTaskCategoryState();
}

class _SelectTaskCategoryState extends State<SelectTaskCategory> {
  final FoodController _controller = Get.put(FoodController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
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
        const Center(
          child: Text('SELECT TASK CATEGORY',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 117,
          width: Helper.getScreenWidth(context),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 151, 18, 8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: Helper.getScreenWidth(context) / 2,
                child: Text(
                    'Delivery of alchohol or any illegal items is prohibitated by law.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/taskaddbottle.png'))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage('assets/images/taskadd.png'),
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 13, left: 18),
          child: Text('Select package Type',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: Helper.getScreenWidth(context),
            margin: EdgeInsets.symmetric(horizontal: 22),
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
                child: GetBuilder<FoodController>(builder: (_controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: _controller.myFood.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(AppContent
                                                  .BASE_URL +
                                              '/public/uploads/foodType/' +
                                              _controller.myFood[index].image
                                                  .toString()),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  _controller.myFood[index].title.toString(),
                                  // 'Food Items',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 163, 163, 163),
                          ),
                        ],
                      );
                    },
                  );
                })
                // Column(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             height: 15,
                //             width: 15,
                //             decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         'assets/images/profilefood.png'),
                //                     fit: BoxFit.cover)),
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Food Items',
                //             style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           )
                //         ],
                //       ),
                //     ),
                //     const Divider(
                //       color: Color.fromARGB(255, 163, 163, 163),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             height: 15,
                //             width: 15,
                //             decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         'assets/images/profilemedicine.png'),
                //                     fit: BoxFit.cover)),
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Medicines',
                //             style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           )
                //         ],
                //       ),
                //     ),
                //     const Divider(
                //       color: Color.fromARGB(255, 163, 163, 163),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             height: 15,
                //             width: 15,
                //             decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         'assets/images/geniedocument.png'),
                //                     fit: BoxFit.cover)),
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Documents or BooksElectronics Items',
                //             style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           )
                //         ],
                //       ),
                //     ),
                //     const Divider(
                //       color: Color.fromARGB(255, 163, 163, 163),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             height: 15,
                //             width: 15,
                //             decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         'assets/images/geniecloth.png'),
                //                     fit: BoxFit.cover)),
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Cloths',
                //             style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           )
                //         ],
                //       ),
                //     ),
                //     const Divider(
                //       color: Color.fromARGB(255, 163, 163, 163),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             height: 15,
                //             width: 15,
                //             decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         'assets/images/profileelectronics.png'),
                //                     fit: BoxFit.cover)),
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Items for Repair',
                //             style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           )
                //         ],
                //       ),
                //     ),
                //     const Divider(
                //       color: Color.fromARGB(255, 163, 163, 163),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             height: 15,
                //             width: 15,
                //             decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         'assets/images/profilebusness.png'),
                //                     fit: BoxFit.cover)),
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Business Deliveries',
                //             style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           )
                //         ],
                //       ),
                //     ),
                //     const Divider(
                //       color: Color.fromARGB(255, 163, 163, 163),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             height: 15,
                //             width: 15,
                //             decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         'assets/images/profilegift.png'),
                //                     fit: BoxFit.cover)),
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Gift',
                //             style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           )
                //         ],
                //       ),
                //     ),
                //     const Divider(
                //       color: Color.fromARGB(255, 163, 163, 163),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             height: 15,
                //             width: 15,
                //             decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         'assets/images/profileothers.png'),
                //                     fit: BoxFit.cover)),
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Others',
                //             style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           )
                //         ],
                //       ),
                //     ),
                //   ],
                // ),

                ),
          ),
        )
      ]),
    )));
  }
}
