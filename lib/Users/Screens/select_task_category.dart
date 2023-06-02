import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Users/Controller/food_controller.dart';
import 'package:pugau/Users/Screens/task_add.dart';

import '../../util/Helper/helper.dart';

class SelectTaskCategory extends StatefulWidget {
  String km,tasktitel,package_type,task;
  SelectTaskCategory({
    required this.km,
    required this.tasktitel,
    required this.package_type,
    required this.task,
  });

  @override
  State<SelectTaskCategory> createState() => _SelectTaskCategoryState();
}

class _SelectTaskCategoryState extends State<SelectTaskCategory> {
  final FoodController _controller = Get.put(FoodController());
  String? dsata_all;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                ),
                Center(
                  child: Text('SELECT TASK CATEGORY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 117,
                  width: Helper.getScreenWidth(context),
                  decoration: BoxDecoration(
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
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/taskaddbottle.png'))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                Padding(
                  padding: EdgeInsets.only(top: 13, left: 18),
                  child: Text('Select package Type',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: Helper.getScreenWidth(context),
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.4),
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
                    child:



                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              dsata_all="Food Items";
                              Get.off(()=>TaskAdd(
                                km: widget.km,
                                tasktitel: widget.tasktitel,
                                package_type: dsata_all.toString(),
                                task: 'task',
                              ));
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/profilefood.png'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Food Items',
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
                          color: Color.fromARGB(255, 163, 163, 163),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              dsata_all="Medicines";
                              Get.off(()=>TaskAdd(
                                km: widget.km,
                                tasktitel: widget.tasktitel,
                                package_type: dsata_all.toString(),
                                task: 'task',
                              ));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/profilemedicine.png'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Medicines',
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
                          color: Color.fromARGB(255, 163, 163, 163),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              dsata_all="Documents or BooksElectronics Items";
                              Get.off(()=>TaskAdd(
                                km: widget.km,
                                tasktitel: widget.tasktitel,
                                package_type: dsata_all.toString(),
                                task: 'task',
                              ));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/geniedocument.png'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Documents or BooksElectronics Items',
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
                          color: Color.fromARGB(255, 163, 163, 163),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              dsata_all="Cloths";
                              Get.off(()=>TaskAdd(
                                km: widget.km,
                                tasktitel: widget.tasktitel,
                                package_type: dsata_all.toString(),
                                task: 'task',
                              ));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/geniecloth.png'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Cloths',
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
                          color: Color.fromARGB(255, 163, 163, 163),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              dsata_all="Items for Repair'";
                              Get.off(()=>TaskAdd(
                                km: widget.km,
                                tasktitel: widget.tasktitel,
                                package_type: dsata_all.toString(),
                                task: 'task',
                              ));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/profileelectronics.png'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Items for Repair',
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
                          color: Color.fromARGB(255, 163, 163, 163),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              dsata_all="Business Deliveries";
                              Get.off(()=>TaskAdd(
                                km: widget.km,
                                tasktitel: widget.tasktitel,
                                package_type: dsata_all.toString(),
                                task: 'task',
                              ));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/profilebusness.png'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Business Deliveries',
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
                        InkWell(
                          onTap: (){
                            setState(() {
                              dsata_all="Gift";
                              Get.off(()=>TaskAdd(
                                km: widget.km,
                                tasktitel: widget.tasktitel,
                                package_type: dsata_all.toString(),
                                task: 'task',
                              ));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/profilegift.png'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Gift',
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
                          color: Color.fromARGB(255, 163, 163, 163),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              dsata_all="Others";
                              Get.off(()=>TaskAdd(
                                km: widget.km,
                                tasktitel: widget.tasktitel,
                                package_type: dsata_all.toString(),
                                task: 'task',
                              ));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/profileothers.png'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Others',
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
              ]),
            )
        )
    );
  }
}
