import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../util/Helper/helper.dart';

class ItemListCard extends StatefulWidget {
  const ItemListCard({super.key});

  @override
  State<ItemListCard> createState() => _ItemListCardState();
}

class _ItemListCardState extends State<ItemListCard> {
  bool isOpen = true;
  bool _isopen = true;
  @override
  Widget build(BuildContext context) {
    return StickyHeaderBuilder(
      overlapHeaders: true,
      builder: (BuildContext context, double stuckAmount) {
        stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
        return Container(
           padding: const EdgeInsets.only(left:20.0,bottom: 2,top: 2),
          height: 30,
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: const Text(
            'Recommanded(30)',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
        );
      },
      content: Padding(
        padding: const EdgeInsets.only(left:10,right:10,top:30,bottom:5),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Regular Sandwich',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.square,
                      color: Colors.green,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
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
                          builder: __buildBottomSheet,
                          anchors: [0, 0.5, 1],
                          isSafeArea: true,
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(4)),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'BESTSELLER',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    Text(
                      '₹ 162 / Plate',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '₹180',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '10 % off',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'With tartar souce and tomato souce',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'This is some Special note for some items',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 100,
              width: 80,
              child: Stack(
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
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/pizza.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isopen = !_isopen;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.red,
                        ),
                        height: 25,
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'ADD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
        child: ListView(
          controller: scrollController,
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 430,
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(7)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          CarouselSlider(
                              options: CarouselOptions(
                                  autoPlay: true,
                                  height: 30.h,
                                  viewportFraction: 0.99,
                                  initialPage: 0,
                                  aspectRatio: 2 / 4.2),
                              items: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image: const AssetImage(
                                          'assets/images/pizzapopup1.png'),
                                      fit: BoxFit.cover,
                                      width:
                                          Helper.getScreenWidth(context) / 1.05,
                                    )),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image: const AssetImage(
                                          'assets/images/pizzapopup.png'),
                                      fit: BoxFit.cover,
                                      width:
                                          Helper.getScreenWidth(context) / 1.05,
                                    )),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image: const AssetImage(
                                          'assets/images/pizzapopup1.png'),
                                      fit: BoxFit.cover,
                                      width:
                                          Helper.getScreenWidth(context) / 1.05,
                                    )),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image: const AssetImage(
                                          'assets/images/pizzapopup.png'),
                                      fit: BoxFit.cover,
                                      width:
                                          Helper.getScreenWidth(context) / 1.05,
                                    )),
                              ]),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.square,
                                        color: Colors.red,
                                        size: 23,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.pinkAccent
                                                  .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              'BESTSELLER',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Rosted Chicken',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      const Text(
                                        'Something about food Food Tasty Something about food Food Tasty Something about food Food Tasty Something about food Food Tasty',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ])),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget __buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
        child: ListView(
          controller: scrollController,
          children: [
            SizedBox(
              height: 500,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/rosted.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Roasted Chicken',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.square,
                          size: 18,
                          color: Colors.red,
                        ),
                      ],
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                'QUANTITY',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Seclect any one',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        width: 1, color: Colors.red)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    'Required',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                'Half[3 Pieces]',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Text(
                                '\$189',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                'Full[3 Pieces]',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Text(
                                '\$389',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Add Cooking Intruction',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                minLines: 2, maxLines: 2,
                                textAlign: TextAlign.start,
                                //  controller: number,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 48, 45, 45),
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
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: Helper.getScreenWidth(context) / 2.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(width: 1, color: Colors.red)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Icon(
                                    Icons.minimize,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.red,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            repeat(context);
                          },
                          child: Container(
                            height: 40,
                            width: Helper.getScreenWidth(context) / 2.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.red,
                            ),
                            child: const Center(
                              child: Text(
                                'Add Item \$123',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void repeat(BuildContext context) {
    showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Repeat with same combination',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.square_outlined,
                            color: Colors.red,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Chicken Biryani',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '\$190',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Half[2 Pieces]',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 150, 148, 148),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            '\$190',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 29),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: Helper.getScreenWidth(context) / 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 1, color: Colors.blue)),
                            child: const Center(
                              child: Text(
                                'Add New',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: Helper.getScreenWidth(context) / 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 1, color: Colors.red)),
                            child: const Center(
                              child: Text(
                                'Repeat Last',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
