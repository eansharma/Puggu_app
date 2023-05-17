import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:pugau/Users/Screens/favorite.dart';
import 'package:pugau/Users/Screens/Search/main_search.dart';
import 'package:pugau/Users/Screens/Order/place_on_order.dart';
import 'package:pugau/Users/Screens/Restaurants/restaurent_datails.dart';
import 'package:pugau/Users/Screens/Location/select_location.dart';
import 'package:pugau/Users/Screens/Profile/user_profile.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Startup extends StatefulWidget {
  const Startup({super.key, required String title});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectLocation(
                                  title: '',
                                )),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Location',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Sano colony road,siddthrthnagar rupandehi nepal',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfile(
                                    title: '',
                                  )),
                        );
                      },
                      child: const Icon(Icons.menu)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainSearch(
                                title: '',
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Colors.red.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(7)),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search,
                            color: Colors.red,
                            size: 18,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search rastaurent name or dish name',
                            style: TextStyle(fontSize: 12),
                          ),
                          Spacer(),
                          Icon(
                            Icons.keyboard_voice,
                            color: Colors.red,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlaceOnOrder(
                                title: '',
                              )),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.4, color: Colors.black),
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.pink.withOpacity(0.2)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.red,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'Near by',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: GridView.builder(
                              itemCount: 6,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 2 / 6),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Container(
                                    height: 25,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.4, color: Colors.black),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: const Center(
                                      child: Text(
                                        'Fast Delivery',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              children: [
                CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            selectindex = index;
                          });
                        },
                        height: 260.h,
                        viewportFraction: 0.99,
                        initialPage: 0,
                        aspectRatio: 2 / 4.2),
                    items: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: const AssetImage(
                                'assets/images/foodslider.png'),
                            fit: BoxFit.cover,
                            width: 370.w,
                          )),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: const AssetImage(
                                'assets/images/foodslider.png'),
                            fit: BoxFit.cover,
                            width: 370.w,
                          )),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: const AssetImage(
                                'assets/images/foodslider.png'),
                            fit: BoxFit.cover,
                            width: 370.w,
                          )),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: const AssetImage(
                                'assets/images/foodslider.png'),
                            fit: BoxFit.cover,
                            width: 370.w,
                          )),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                PageViewDotIndicator(
                  size: const Size(8, 8),
                  currentItem: selectindex,
                  count: 4,
                  unselectedColor: Colors.black26,
                  selectedColor: Colors.red,
                  duration: const Duration(milliseconds: 200),
                  boxShape: BoxShape.circle,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: Helper.getScreenWidth(context) / 3.15,
                        color: const Color.fromARGB(255, 153, 153, 153),
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('TOP OFFERS FOR YOU',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          height: 1.5,
                          width: Helper.getScreenWidth(context) / 3.15,
                          color: const Color.fromARGB(255, 153, 153, 153),
                          padding: const EdgeInsets.only(
                            top: 2,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 413.h,
                  child: GridView.builder(
                      itemCount: 4,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          height: 150.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/foodgrid.png'),
                                  fit: BoxFit.cover)),
                        );
                      }),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: Helper.getScreenWidth(context) / 3.97,
                        color: const Color.fromARGB(255, 153, 153, 153),
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('EAT WHATS MAKES YOU HAPPY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          height: 1.5,
                          width: Helper.getScreenWidth(context) / 3.97,
                          color: const Color.fromARGB(255, 153, 153, 153),
                          padding: const EdgeInsets.only(
                            top: 2,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 216.h,
                  child: GridView.builder(
                      itemCount: 6,
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 4.64.sp / 2.sp),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Fevorite(title: '')),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 75.w,
                                height: 75.h,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/pizza.png'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Text('Pizza',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 13.h,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 75.w,
                                    height: 75.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/pizza.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text('Pizza',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: Helper.getScreenWidth(context) / 3,
                        color: const Color.fromARGB(255, 153, 153, 153),
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('30 RESRAURENTS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          height: 1.5,
                          width: Helper.getScreenWidth(context) / 3,
                          color: const Color.fromARGB(255, 153, 153, 153),
                          padding: const EdgeInsets.only(
                            top: 2,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RestaurentDetails(
                              // title: '',
                              )),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 290,
                    width: Helper.getScreenWidth(context),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.4),
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              offset: const Offset(
                                0.0,
                                2.0,
                              )),
                        ],
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.green),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 13,
                          child: Center(
                            child: Text('PURE VEG RESRAURENT',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Container(
                          height: 205.7.h,
                          width: Helper.getScreenWidth(context),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/burger.png'),
                                  fit: BoxFit.cover)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 25.h,
                                    width: 160.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue.withOpacity(0.9)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '30 % Of on entire menu',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 25.h,
                                    width: 160.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue.withOpacity(0.9)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '30 % Of on entire menu',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 17),
                                child: Container(
                                  height: 19,
                                  width: 74,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.alarm,
                                        color: Colors.green,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        '30 min | 2 km',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 110.7.h,
                          width: Helper.getScreenWidth(context),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(11),
                                  bottomRight: Radius.circular(11))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'The Burger House',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 17,
                                      width: 52,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 10,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Rating',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Fast food ',
                                      style: TextStyle(
                                        fontSize: 10,
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
                                        fontSize: 10,
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
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 16,
                                      width: 56,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFFC7C7),
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
                                          color: const Color(0xffFFC7C7),
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
                                          color: const Color(0xffFFC7C7),
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
                                    const Spacer(),
                                    Container(
                                      height: 20,
                                      width: 49,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Center(
                                        child: Text(
                                          'OPEN NOW',
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 18,
                                  width: Helper.getScreenWidth(context),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 221, 220, 220),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Best burger in the town',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  void _pizzapopup() {
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
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Pizza',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 45,
                        )),
                  ],
                )),
          );
        });
  }
}
