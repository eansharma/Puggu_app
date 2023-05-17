import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Screens/Notification/_notification.dart';
import 'package:pugau/Users/Screens/mart/mart.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';

import '../Controller/banner_controller.dart';
import '../Screens/favorite_list.dart';
import '../Screens/Genie/genie.dart';
import '../Screens/Home_Screen.dart';

class Home extends StatefulWidget {
  const Home({super.key, required String title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;




  final pages = [
    Food(title: Text('')),
    Mart(),
    Genie(),
    FevoriteList(
      title: '',
    ),
    Appnotification(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PugauColors.WHITE,
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: PugauColors.WHITE,
        ),
        child: Column(
          children: [
            Container(
                height: 2,
                width: Helper.getScreenWidth(context),
                color: PugauColors.GREY),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.food_bank_outlined,
                          color: pageIndex == 0
                              ? PugauColors.themeColor
                              : PugauColors.BLACK,
                        ),
                        Text(
                          'FOOD',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: pageIndex == 0 ? Colors.red : Colors.black,
                          ),
                        )
                      ],
                    )),
                Container(
                    height: 40,
                    width: 1,
                    color: const Color.fromARGB(255, 202, 200, 200)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: pageIndex == 1 ? Colors.red : Colors.black,
                      ),
                      Text(
                        'MART',
                        style: TextStyle(
                          fontSize: 10,
                          color: pageIndex == 1 ? Colors.red : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 40,
                    width: 1,
                    color: const Color.fromARGB(255, 202, 200, 200)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          color: pageIndex == 2 ? Colors.red : Colors.black,
                        ),
                        Text(
                          'GENIE',
                          style: TextStyle(
                            fontSize: 10,
                            color: pageIndex == 2 ? Colors.red : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )),
                Container(
                    height: 40,
                    width: 1,
                    color: const Color.fromARGB(255, 202, 200, 200)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          color: pageIndex == 3 ? Colors.red : Colors.black,
                        ),
                        Text(
                          'FAVORITE',
                          style: TextStyle(
                            fontSize: 10,
                            color: pageIndex == 3 ? Colors.red : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )),
                Container(
                    height: 40,
                    width: 1,
                    color: const Color.fromARGB(255, 202, 200, 200)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 4;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_active_outlined,
                        color: pageIndex == 4 ? Colors.red : Colors.black,
                      ),
                      Text(
                        'NOTIFICATION',
                        style: TextStyle(
                          fontSize: 10,
                          color: pageIndex == 4 ? Colors.red : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
