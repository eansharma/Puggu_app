import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:pugau/Users/Controller/banner_controller.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Data/Api/API_URLs.dart';
import '../../Data/Model/aboutUs_model.dart';

class Slider_Screen extends StatefulWidget {
  const Slider_Screen({Key? key});

  @override
  State<Slider_Screen> createState() => _Slider_ScreenState();
}

class _Slider_ScreenState extends State<Slider_Screen> {
  final BannerController bannerController = Get.put(BannerController());

  int selectindex = 0;

  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerController) {
      return bannerController.restaurantData.isEmpty
          ? Container(
              height: 198.px,
              width: 320.px,
              color: PugauColors.grey,
            )
          : Column(
              children: [
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
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        image: NetworkImage(
                          AppContent.BASE_URL +
                              '/public/uploads/banner/' +
                              bannerController.restaurantData[index]['image']
                                  .toString(),
                        ),
                        fit: BoxFit.cover,
                        width: 94.5.w,
                      ),
                    );
                  },
                  itemCount: bannerController.restaurantData.length,
                ),
                SizedBox(
                  height: 3.h,
                ),
                PageViewDotIndicator(
                  size: Size(8, 8),
                  currentItem: selectindex,
                  count: bannerController.restaurantData.length,
                  unselectedColor: Colors.black26,
                  selectedColor: Colors.red,
                  duration: Duration(milliseconds: 200),
                  boxShape: BoxShape.circle,
                ),
              ],
            );
    });
  }
}
