import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pugau/Users/Controller/food_controller.dart';
import 'package:pugau/Users/Screens/Cart/cart.dart';
import 'package:pugau/Users/Screens/Order/place_on_order.dart';
import 'package:pugau/Users/Screens/Location/select_location.dart';
import 'package:pugau/Users/Screens/Profile/user_profile.dart';
import 'package:pugau/widget/View/Slider.dart';
import 'package:pugau/widget/View/category_food.dart';
import 'package:pugau/widget/View/food_type.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../util/theme/Pugau_theme_colors.dart';
import '../../util/Helper/helper.dart';

import 'Search/main_search.dart';

class Food extends StatefulWidget {
  const Food({Key? key, required Text title}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  int selectindex = 0;

  final FoodController controller = Get.put(FoodController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Container(
              height: 7.h,
              decoration: BoxDecoration(color: Color(0xffFFC7C7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 12.w,
                      height: 5.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/pizza.png'),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'The Burger House',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'You have items saved in your cart',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cart(title: '')),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.red),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            'View Cart',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        _popup();
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 18,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            body: CustomScrollView(slivers: [
              SliverAppBar(
                expandedHeight: 110,
                pinned: true,
                floating: true,
                stretch: true,
                backgroundColor: Colors.white,
                leadingWidth: 0,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 1,
                  stretchModes: const [StretchMode.zoomBackground],
                  title: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainSearch(
                                  title: '',
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Container(
                        //width:350.h ,
                        height: 5.5.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.red.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.search,
                                color: PugauColors.themeColor,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Search rastaurent name or dish name',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: PugauColors.GREY,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Icon(
                                Icons.keyboard_voice,
                                color: PugauColors.themeColor,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  background: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: PugauColors.themeColor,
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
                ),
                elevation: 0,
                automaticallyImplyLeading: false,
              ),
              SliverAppBar(
                toolbarHeight: 50,
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 1,
                  title: GestureDetector(
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
                                border: Border.all(
                                    width: 1, color: PugauColors.GREY),
                                borderRadius: BorderRadius.circular(7),
                                color: PugauColors.litePink),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: PugauColors.themeColor,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    'Near by',
                                    style: TextStyle(
                                        color: PugauColors.BLACK,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
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
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: const Center(
                                        child: Text(
                                          'Fast Delivery',
                                          style: TextStyle(
                                              color: Colors.black,
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
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    //  Crousel Slider
                    Slider_Screen(),

                    SizedBox(height: 3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1.5,
                            width: Helper.getScreenWidth(context) / 3.15,
                            color: Color.fromARGB(255, 153, 153, 153),
                            padding: EdgeInsets.only(
                              top: 2,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('TOP OFFERS FOR YOU',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: PugauColors.BLACK,
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
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 46.h,
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
                              height: 10.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/foodgrid.png'),
                                      fit: BoxFit.cover)),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 3.h,
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
                          Text('EAT WHATS MAKES YOU HAPPY',
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
                      height: 3.h,
                    ),
                    // here is import category
                    category_food(),

                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1.5,
                            width: Helper.getScreenWidth(context) / 3,
                            color: PugauColors.GREY,
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
                    SizedBox(
                      height: 3.h,
                    ),
                    // Here is import food type list
                    Food_Type_List(),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              )
            ])));
  }

  void _popup() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Discart all the items in your cart ?',
            style: TextStyle(fontSize: 15),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 60, right: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Discart',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
