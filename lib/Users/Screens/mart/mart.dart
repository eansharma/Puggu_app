import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:pugau/Users/Controller/categorycontroller.dart';
import 'package:pugau/Users/Controller/coopan_controller.dart';
import 'package:pugau/Users/Screens/product_listing.dart';
import 'package:pugau/util/theme/Pugau_images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/Api/API_URLs.dart';
import '../../../util/Helper/helper.dart';
import '../../../util/theme/Pugau_theme_colors.dart';
import '../../Controller/banner_controller.dart';
import '../Search/mart_search.dart';

class Mart extends StatefulWidget {
  const Mart({super.key});

  @override
  State<Mart> createState() => _MartState();
}

class _MartState extends State<Mart> {
  final BannerController bannerController = Get.put(BannerController());

  final  CategoryController _categoryController = Get.put(CategoryController());
  final CoopanController coopanController = Get.put(CoopanController());
  int selectindex = 0;
  int _selectindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                  children: [
                    const Text(
                      'MART',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const Spacer(),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.red),
                      child: const Text(
                        '20-25 mins',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MartSearch(
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
                            width: 1,
                            color: const Color.fromARGB(255, 87, 86, 86)
                                .withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(7)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Search for groceries, vaggies and more',
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 87, 86, 86),
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: GestureDetector(
                  onTap: () {
                    _coupon();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff1ffe2020),
                        border: Border.all(width: 1, color: Colors.red)),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Helper.getScreenWidth(context) / 1.4,
                            child: CarouselSlider(
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _selectindex = index;
                                    });
                                  },
                                  height: 25,
                                  viewportFraction: 0.99,
                                  initialPage: 0,
                                ),
                                items: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '%',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            '50% off upto \$125',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red),
                                          ),
                                          Text(
                                            'Use Coupon SUPER MART',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          SizedBox(
                            width: Helper.getScreenWidth(context) / 7.5,
                            child: PageViewDotIndicator(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.5),
                              size: const Size(6, 6),
                              currentItem: _selectindex,
                              count: 4,
                              unselectedColor: Colors.black26,
                              selectedColor: Colors.red,
                              duration: const Duration(milliseconds: 200),
                              boxShape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
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
                return bcontroller.martData.isEmpty
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
                             bannerController.martData[index]['image'].toString()),
                          fit: BoxFit.cover,
                          width: 94.5.w,
                        ),
                      );
              }
        
              );
        
        
            },
            itemCount: bannerController.martData.length, // Use bannerController instead of bcontroller
          ),
               
             
             
             
              const SizedBox(
                height: 10,
              ),
              PageViewDotIndicator(
                size: const Size(8, 8),
                currentItem: selectindex,
                count: bannerController.martData.length,
                unselectedColor: Colors.black26,
                selectedColor: Colors.red,
                duration: const Duration(milliseconds: 200),
                boxShape: BoxShape.circle,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.5,
                      width: Helper.getScreenWidth(context) / 3.75,
                      color: const Color.fromARGB(255, 153, 153, 153),
                      padding: const EdgeInsets.only(
                        top: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('SHOP BY CATEGORY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 1.5,
                        width: Helper.getScreenWidth(context) / 3.75,
                        color: const Color.fromARGB(255, 153, 153, 153),
                        padding: const EdgeInsets.only(
                          top: 2,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
          builder: (context) => const ProductListing(
            title: '',
          ),
              ),
            );
          },
          child: Expanded(
           child: Obx(() {
  return GridView.builder(
    itemCount: _categoryController.categoryList.length,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 0.8,
    ),
    itemBuilder: (context, index) {
      var category = _categoryController.categoryList[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.pinkAccent.withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const SizedBox(
                          width: 20,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 1,
                            ),
                            child: Text(
                              '18% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Color.fromARGB(255, 133, 132, 132),
                          size: 18,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(AppContent.BASE_URL +
                            '/public/uploads/menu/' +'${_categoryController.categoryList[index].image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${_categoryController.categoryList[index].title}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    },
  );
}),


            
            )
            
        
          ),
        
            
            ],
          ),
        ),
      ),
    );
  }

  void _coupon() {
    showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Coupon Details',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const Text(
                        'Free Veg Momo',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Pagau',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Get 50% OFF up to \$100',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Valid on only this order',
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromARGB(255, 6, 56, 97)),
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.lightBlue.withOpacity(0.3)),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'WELCOME',
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 2, 60, 107)),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'TAP TO COPY',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Text(
                        'Offer term and condition',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
