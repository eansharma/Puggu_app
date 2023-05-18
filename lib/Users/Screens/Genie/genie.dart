import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:pugau/Users/Screens/Genie/genie_picup.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/Api/API_URLs.dart';
import '../../../util/Helper/helper.dart';
import '../../Controller/banner_controller.dart';

class Genie extends StatefulWidget {
  const Genie({super.key});

  @override
  State<Genie> createState() => _GenieState();
}

class _GenieState extends State<Genie> {
     final BannerController bannerController = Get.put(BannerController());

  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              const Center(
                  child: Text(
                'Genie',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              )),
              const SizedBox(
                height: 4,
              ),
              const Center(
                  child: Text(
                'Anything You Need, Delivered',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )),
              const SizedBox(
                height: 8,
              ),
              const Center(
                  child: Text(
                'NOTE: ItemWhich is Easily carried on bike is only recommended',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              )),
              const SizedBox(
                height: 30,
              ),
 CarouselSlider.builder(
          options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  selectindex = index;
                });
              },
              height: 33.h,
              viewportFraction: 0.99,
              initialPage: 0,
              aspectRatio: 2 / 4.2),
          itemBuilder: (BuildContext context, int index, int realIndex) {

           return GetBuilder<BannerController>(
            // Define the bcontroller variable here
            builder: (bcontroller){
              return bcontroller.genieData.isEmpty
               ? Center(
                      child: CircularProgressIndicator(
                        color: PugauColors.themeColor,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        image: NetworkImage(AppContent.BASE_URL +
                            '/public/uploads/banner/' +
                           bannerController.genieData[index]['image'].toString()),
                        fit: BoxFit.cover,
                        width: 94.5.w,
                      ),
                    );
            }

            );


          },
          itemCount: bannerController.genieData.length, // Use bannerController instead of bcontroller
        ),
       
           
           


              const SizedBox(
                height: 10,
              ),
              PageViewDotIndicator(
                size: const Size(8, 8),
                currentItem: selectindex,
                count: bannerController.genieData.length,
                unselectedColor: Colors.black26,
                selectedColor: PugauColors.themeColor,
                duration: const Duration(milliseconds: 200),
                boxShape: BoxShape.circle,
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 180,
                  width: Helper.getScreenWidth(context) / 1.06,
                  decoration: BoxDecoration(
                    color: PugauColors.WHITE,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                          color: PugauColors.liteGrey,
                          spreadRadius: 01.0,
                          offset: const Offset(
                            0.0,
                            01.0,
                          )),
                      BoxShadow(
                          color: PugauColors.liteGrey,
                          spreadRadius: 02.0,
                          offset: const Offset(
                            01.0,
                            .0,
                          )),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 19, vertical: 11),
                        child: Row(
                          children: const [
                            Text(
                              'Pic or Drop',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: PugauColors.BLACK),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'any Item',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: PugauColors.BLACK),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Center(
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 19,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            textColor: PugauColors.BLACK,
                            color: PugauColors.themeColor,
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GeniePicup(
                                          title: '',
                                        )),
                              );
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'ADD PIC UP / DROP DETAILS',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: PugauColors.WHITE),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        indent: 18,
                        endIndent: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 23),
                        child: Text(
                          'Something we can pickdrop for you',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 46,
                                width: 46,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/geniehome.png'),
                                      height: 25,
                                      width: 25,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'Home Food',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 46,
                                width: 46,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/geniecard.png'),
                                      height: 25,
                                      width: 25,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'Care Packages',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 46,
                                width: 46,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/geniedocument.png'),
                                      height: 25,
                                      width: 25,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'Documents',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 46,
                                width: 46,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/geniecloth.png'),
                                      height: 25,
                                      width: 25,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'Cloths',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 46,
                                width: 46,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/icons8-four-squares-24.png'),
                                      height: 25,
                                      width: 25,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'Many More',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 160,
                  width: Helper.getScreenWidth(context) / 1.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                          color: const Color.fromARGB(255, 202, 200, 200)
                              .withOpacity(.4),
                          spreadRadius: 01.0,
                          offset: const Offset(
                            0.0,
                            01.0,
                          )),
                      BoxShadow(
                          color: const Color.fromARGB(255, 145, 144, 144)
                              .withOpacity(.4),
                          spreadRadius: 02.0,
                          offset: const Offset(
                            01.0,
                            .0,
                          )),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 28,
                            ),
                            Text(
                              'Here\'s how  you can use Genie for your needes',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Pic  and Drop',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Pic up and send from anywhere in the city',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 11),
                        child: Center(
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 19,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            textColor: Colors.black,
                            color: PugauColors.themeColor,
                            onPressed: () {
                              // Navigator.push(
                              //    context,
                              //    MaterialPageRoute(builder: (context) => const TaskAdd  (title: '',)),
                              //  );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'HOW IT WORKS',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
