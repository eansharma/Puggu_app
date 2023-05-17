import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../util/Helper/helper.dart';
import '../review/add_review.dart';

class RestaurentTap extends StatefulWidget {
  const RestaurentTap({super.key, required String title});

  @override
  State<RestaurentTap> createState() => _RestaurentTapState();
}

class _RestaurentTapState extends State<RestaurentTap> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return 
    DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  height: Helper.getScreenHeight(context) / 3.5,
                  width: Helper.getScreenWidth(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/burgercart.png'),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.share,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Hoichoi Restaurent',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      'Fast food ',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(
                                      Icons.circle,
                                      size: 4,
                                    ),
                                    Text(
                                      ' Desserts ',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(
                                      Icons.circle,
                                      size: 4,
                                    ),
                                    Text(
                                      ' Beverages',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'City Street Address landmark',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 16,
                                      width: 56,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Center(
                                        child: Text(
                                          'BESTSELLER',
                                          style: TextStyle(
                                            fontSize: 7,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      height: 16,
                                      width: 42,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Center(
                                        child: Text(
                                          'MUSTRY',
                                          style: TextStyle(
                                            fontSize: 7,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      height: 16,
                                      width: 56,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Center(
                                        child: Text(
                                          'NEWLYOPEN',
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.4),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: const Offset(1.0, 0.0)),
                                BoxShadow(
                                    color: Colors.white.withOpacity(.4),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: const Offset(
                                      0.0,
                                      1,
                                    )),
                              ], borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          '4.3',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 11,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: const Text(
                                      '200 \nReviews',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: Helper.getScreenWidth(context) / 1.9,
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
                                    horizontal: 6, vertical: 4),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 7,
                                          color: Colors.green,
                                        ),
                                        const Text(
                                          'OPEN NOW',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 2,
                                          height: 12,
                                          color: const Color.fromARGB(
                                              255, 165, 163, 163),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          '11:00 AM - 11:30 PM',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          size: 13,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: Helper.getScreenWidth(context) / 5,
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
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 4),
                                child: Center(
                                    child: Text(
                                  '\$200 for two',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                )),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: Helper.getScreenWidth(context) / 1.9,
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
                                    horizontal: 6, vertical: 4),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.alarm,
                                          size: 12,
                                          color: Colors.green,
                                        ),
                                        const Text(
                                          '30 mins',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 2,
                                          height: 12,
                                          color: const Color.fromARGB(
                                              255, 165, 163, 163),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          '2 km away',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          size: 13,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4)),
                                child: const Text(
                                  '10% off',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: Helper.getScreenWidth(context) / 6,
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
                                    horizontal: 5, vertical: 4),
                                child: Center(
                                    child: Row(
                                  children: const [
                                    Icon(
                                      Icons.call,
                                      size: 10,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Contact',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              width: Helper.getScreenWidth(context) / 5,
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
                                    horizontal: 5, vertical: 4),
                                child: Center(
                                    child: Row(
                                  children: const [
                                    Icon(
                                      Icons.directions,
                                      size: 10,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Direction',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              width: Helper.getScreenWidth(context) / 6,
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
                                    horizontal: 5, vertical: 4),
                                child: Center(
                                    child: Row(
                                  children: const [
                                    Icon(
                                      Icons.share,
                                      size: 10,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Share',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              width: Helper.getScreenWidth(context) / 6.5,
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
                                    horizontal: 5, vertical: 4),
                                child: Center(
                                    child: Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite_border_outlined,
                                      size: 10,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Like',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const TabBar(
                    indicatorColor: Colors.red,
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        child: Text(
                          'About',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Review',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Photos',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ]),
                Expanded(
                  child: TabBarView(children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/restaurentdoller.png'))),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Category : ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Text(
                                      'Pizza | Momo | Chowmein',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/restaurentservice.png'))),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Serves North Indian',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                 Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/restaurentcityname.png'))),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'City Name, Street Address, Full Address',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 13),
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 const Padding(
                                   padding: EdgeInsets.symmetric(horizontal: 5),
                                   child: Text(
                                              'FACILITIES',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                 ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.green,
                                            fillColor: MaterialStateProperty.all(Colors.white),
                                            side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(width: 1.0, color: Colors.green),),
                            value: value,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value;
                              });
                            },
                          ),
                          const Text(
                                                  'Breakfast',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                        ],
                                      ),
                                      SizedBox(width: Helper.getScreenWidth(context)/4.5,),
                                       Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.green,
                                        fillColor: MaterialStateProperty.all(Colors.white),
                                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(width: 1.0, color: Colors.green),),
                            value: value,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value;
                              });
                            },
                          ),
                          const Text(
                                              'Home Delivery',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                    ],
                                  ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.green,
                                            fillColor: MaterialStateProperty.all(Colors.white),
                                            side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(width: 1.0, color: Colors.green),),
                            value: value,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value;
                              });
                            },
                          ),
                          const Text(
                                                  'Takeawat AvailableV',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                        ],
                                      ),
                                      SizedBox(width: Helper.getScreenWidth(context)/17,),
                                       Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.green,
                                        fillColor: MaterialStateProperty.all(Colors.white),
                                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(width: 1.0, color: Colors.green),),
                            value: value,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value;
                              });
                            },
                          ),
                          const Text(
                                              'Vegetarians Only',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                    ],
                                  ),
                                    ],
                                  ),
                               ],
                             ),
                           ),
                             const Text(
                                              '',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                        ],
                      ),
                    ),
                     Column(
          children: [
            const SizedBox(height: 20,),
            Column(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Row(
                     children: [
                       const Text('Reviews | 200',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                     const Spacer(),
                     GestureDetector(
                      onTap: () =>   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddReview (title: '')),
                      ),
                       child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('ADD REVIEW',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Colors.white),),
                        )),
                     ),
                     ],
                   ),
                 ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: const Color.fromARGB(255, 168, 167, 167)),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Row(
                      children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 5),
                           child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(image: AssetImage('assets/images/customerreview.png'),fit: BoxFit.cover)
                                            ),),
                         ),
                                          const SizedBox(width: 10,),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                            width: Helper.getScreenWidth(context)/1.24,
                                            color: Colors.pink.withOpacity(0.1),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: const [
                                                         Text('USER NAME',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),
                                                      Text('JAN 26 2023 SUNDAY 06:00 PM',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 143, 142, 142)),),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                height: 20,width: 68,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(255, 252, 206, 221),
                                                  borderRadius: BorderRadius.circular(4)
                                                ),
                                                child:  Center(child:   Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                
                                                  children: [
                                                    RatingBar.builder(
                        itemSize: 10,
                         initialRating: 3,
                         minRating: 1,
                         direction: Axis.horizontal,
                         allowHalfRating: true,
                         itemCount: 5,
                         itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                         itemBuilder: (context, _) => const Icon(
                           Icons.star,size: 10,
                           color: Colors.red,
                         ),
                         onRatingUpdate: (rating) {
                           print(rating);
                         },
                      ),
                                                  ],
                                                ),),
                                              ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10,),
                      const Text('This is the review description This is the review description This is the review',
                      style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 148, 146, 146)),), 
                      const SizedBox(height: 3,),                                   
                                             const Text('This is the review description This is the review description This is the review',
                      style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 148, 146, 146)),),
                                              ],
                                            ),
                                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: const Color.fromARGB(255, 168, 167, 167)),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Row(
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 5),
                       child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(image: AssetImage('assets/images/customerreview.png'),fit: BoxFit.cover)
                                        ),),
                     ),
                                      const SizedBox(width: 10,),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                        width: Helper.getScreenWidth(context)/1.24,
                                        color: Colors.pink.withOpacity(0.1),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: const [
                                                     Text('USER NAME',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),
                                                  Text('JAN 26 2023 SUNDAY 06:00 PM',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 143, 142, 142)),),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Container(
                                            height: 20,width: 68,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 252, 206, 221),
                                              borderRadius: BorderRadius.circular(4)
                                            ),
                                            child:  Center(child:   Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
            
                                              children: [
                                                RatingBar.builder(
                    itemSize: 10,
                     initialRating: 3,
                     minRating: 1,
                     direction: Axis.horizontal,
                     allowHalfRating: true,
                     itemCount: 5,
                     itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                     itemBuilder: (context, _) => const Icon(
                       Icons.star,size: 10,
                       color: Colors.red,
                     ),
                     onRatingUpdate: (rating) {
                       print(rating);
                     },
                  ),
                                              ],
                                            ),),
                                          ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                  const Text('This is the review description This is the review description This is the review',
                  style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 148, 146, 146)),), 
                  const SizedBox(height: 3,),                                   
                                         const Text('This is the review description This is the review description This is the review',
                  style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 148, 146, 146)),),
                                          ],
                                        ),
                                      )
                  ],
                ),
              ),
            ),
          ],
        ),
                    SizedBox(
                height: Helper.getScreenHeight(context)/1.85,
                 child: GridView.builder(itemCount: 6,
                 physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context,index){
                    return
                 Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                  height: 150,width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: const DecorationImage(image: AssetImage('assets/images/foodgrid.png'),fit: BoxFit.cover)
                  ),
                 );
                 }),
               ),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
