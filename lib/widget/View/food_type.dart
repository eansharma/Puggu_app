import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Users/Controller/Restaurent_Product_Controller.dart';
import 'package:pugau/Users/Screens/Restaurants/restaurent_datails.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Users/Controller/Data/restaurentcontroller.dart';
import 'package:vibration/vibration.dart';
import '../../Users/Controller/fav_controller_show.dart';
import '../../Users/Controller/fav_restrorent_controller.dart';

class Food_Type_List extends StatefulWidget {
  @override
  State<Food_Type_List> createState() => _Food_Type_ListState();
}

class _Food_Type_ListState extends State<Food_Type_List> {
  final ReataurentController rscontroller = Get.put(ReataurentController());
  final FavRestaurantController _favRestaurantController = Get.put(FavRestaurantController());
  final FavRestaurantShowController _favshowctrl = Get.put(FavRestaurantShowController());
  RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: rscontroller.restaurentList.length,
        itemBuilder: (context, index) {
          int selectedIndex = -1;
          return rscontroller.restaurentList[index].userDetail!=null?
          InkWell(
            onTap: () async {
              final controller = Get.find<Resaurent_Product_Controller>();
              final sellerInfo = rscontroller.restaurentList[index].userDetail;

              if (sellerInfo != null) {
                setState(() {
                  selectedIndex = index;
                });
                await controller.product(sellerInfo.sellerId.toString(),"All");
                print(controller.product);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      final restaurant = rscontroller.restaurentList[index];
                      final sellerInfo = restaurant?.userDetail;

                      if (restaurant != null && sellerInfo != null) {
                        return RestaurentDetails(
                          title: restaurant.name.toString(),
                          image: AppContent.BASE_URL +
                              "/public/uploads/user/" +
                              restaurant.image.toString(),
                          address: restaurant.address,
                          seller_id: sellerInfo.id.toString(),
                        );
                      } else {
                        return Scaffold(
                          body: Center(
                            child: Text('Restaurant details not available'),
                          ),
                        );
                      }
                    },
                  ),
                );
              }
              else {
              }
            },

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: Helper.getScreenWidth(context),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.4),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0.0, 2.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(11),
                color: Colors.green,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                    child: Center(
                      child: Text(
                        '${rscontroller.restaurentList[index].name}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 25.h,
                    width: Helper.getScreenWidth(context),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(AppContent.BASE_URL +
                            "/public/uploads/user/" +
                            rscontroller.restaurentList[index].image
                                .toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Handle favorite icon tap
                              _favRestaurantController.fechData(rscontroller
                                  .restaurentList[index].userDetail!.sellerId
                                  .toString());
                              rscontroller.fetchRestaurentData();
                              _favshowctrl.fechData();
                              setState(() {
                                Vibration.vibrate(duration: 50);
                                // likeToggle(index);
                              });


                              Vibration.vibrate(duration: 50);
                              setState(() {
                                if (rscontroller.restaurentList[index].wished!) {
                                  rscontroller.restaurentList[index].wished = false;
                                } else {
                                  rscontroller.restaurentList[index].wished= true;
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              rscontroller.restaurentList[index].wished!
                                  ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              )
                                  : const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),


                          ),
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 4.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                    color: Colors.blue.withOpacity(0.9),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(rscontroller.restaurentList[index].userDetail!.offerNote??"",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 4.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                    color: Colors.blue.withOpacity(0.9),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(rscontroller.restaurentList[index].userDetail!.note??"",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 17),
                              child: Container(
                                height: 25,
                                width: 88,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 3),
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                    SizedBox(width: 3),
                                    Text(rscontroller.restaurentList[index].userDetail!.timing??'',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 15.h,
                    width: Helper.getScreenWidth(context),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(11),
                        bottomRight: Radius.circular(11),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             InkWell(
                               onTap:(){
                                setState(() {
                                  print(rscontroller.restaurentList[index].location.toString()+"hjvcjkjgghk");
                                });
                  },
                               child: Container(
                                  height: 22,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: rscontroller.restaurentList[index].location=="both"?
                                        Colors.deepPurple.shade300:rscontroller.restaurentList[index].location=="veg"?
                                        Colors.green:Colors.red,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Center(
                                    child: Text(rscontroller.restaurentList[index].location=="both"?
                                    "Both":rscontroller.restaurentList[index].location=="veg"?
                                    "Veg":"Non Veg",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                             ),
                             /* Text(
                                '${rscontroller.restaurentList[index].name}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),*/
                              Spacer(),
                              Container(
                                height: 20,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${rscontroller.restaurentList[index].rank}',
                                      style: TextStyle(
                                        fontSize: 10,
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
                                        fontSize: 10,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(rscontroller.restaurentList[index].userDetail!.keyword??'',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 7),
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: PugauColors.pinkCard,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    "Tags",
                                    // '${rscontroller.restaurentList[index].tags}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: PugauColors.pinkCard,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    'MUSTRY',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: PugauColors.pinkCard,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    'NEWLYOPEN',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: PugauColors.blueCard,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 5,
                                  ),
                                  child: Text(rscontroller.restaurentList[index].userDetail!.isOpen!=false?"Open":"Close",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: PugauColors.BLACK,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 5),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 18,
                            width: Helper.getScreenWidth(context),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Text(rscontroller.restaurentList[index].description.toString().replaceAll(exp, ""))
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
          ):
          SizedBox();
        },
      );
    });
  }
}
