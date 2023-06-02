import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Users/Screens/Restaurants/restaurent_datails.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Users/Controller/fav_controller_show.dart';
import '../../Users/Controller/fav_restrorent_controller.dart';
import 'package:vibration/vibration.dart';

class FavRestrorentList extends StatefulWidget {
  const FavRestrorentList({super.key});

  @override
  State<FavRestrorentList> createState() => _FavRestrorentListState();
}

class _FavRestrorentListState extends State<FavRestrorentList> {
  FavRestaurantShowController favRestaurantShowController =
      Get.put(FavRestaurantShowController());
  final FavRestaurantController _favRestaurantController =
      Get.put(FavRestaurantController());
  RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: favRestaurantShowController.isLogin == true
          ? favRestaurantShowController.list.length >= 0
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: favRestaurantShowController.list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurentDetails(
                                    title: favRestaurantShowController
                                        .list[index].restrorentDetailsImg!.name,
                                    image:
                                        "" /*AppContent.BASE_URL+"/public/uploads/user/"+rscontroller.restaurentList[index].sellerInfo!.image.toString()*/,
                                    address: favRestaurantShowController
                                        .list[index]
                                        .restrorentDetailsImg!
                                        .address, 
                                        seller_id: favRestaurantShowController
                                        .list[index]
                                        .restrorentDetailsImg!
                                        .address,
                                  )),
                        );
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                  favRestaurantShowController
                                      .list[index].restrorentDetails!.name
                                      .toString(),
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
                                      favRestaurantShowController.list[index].restrorentDetailsImg!.image
                                          .toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _favRestaurantController.fechData(
                                              favRestaurantShowController
                                                  .list[index].restaurantId
                                                  .toString());
                                          print(favRestaurantShowController
                                              .list[index].id
                                              .toString());
                                          favRestaurantShowController.fechData();
                                          Vibration.vibrate(duration: 50);
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _isFavorite == true
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 30,
                                              )
                                            : const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 30,
                                              ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              color:
                                                  Colors.blue.withOpacity(0.9),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(favRestaurantShowController.list[index].restrorentDetails!.offerNote??"",
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
                                              color:
                                                  Colors.blue.withOpacity(0.9),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(favRestaurantShowController.list[index].restrorentDetails!.note??"",
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
                                      const Spacer(),
                                      {
                                                favRestaurantShowController
                                                    .list[index]
                                                    .restrorentDetails
                                                    ?.timing
                                              } ==
                                              null
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 17),
                                              child: Container(
                                                height: 25,
                                                width: 88,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
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
                                                    Text(
                                                      '${favRestaurantShowController.list[index].restrorentDetails?.timing}',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(),
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
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            setState(() {
                                              print(favRestaurantShowController.list[index].restrorentDetailsImg!.location.toString()+"hjvcjkjgghk");
                                            });
                                          },
                                          child: Container(
                                            height: 22,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: favRestaurantShowController.list[index].restrorentDetailsImg!.location=="both"?
                                                Colors.deepPurple.shade300:favRestaurantShowController.list[index].restrorentDetailsImg!.location=="veg"?
                                                Colors.green:Colors.red,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: Center(
                                              child: Text(favRestaurantShowController.list[index].restrorentDetailsImg!.location=="both"?
                                              "Both":favRestaurantShowController.list[index].restrorentDetailsImg!.location=="veg"?
                                              "Veg":"Non Veg",
                                                style: TextStyle(
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                       /* Text(
                                          '${favRestaurantShowController.list[index].restrorentDetails?.name}',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),*/
                                        Spacer(),

                                        // Raiting bar
                                        '${favRestaurantShowController.list[index].restrorentDetails?.rank}' !=
                                                "null"
                                            ? Container(
                                                height: 20,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${favRestaurantShowController.list[index].restrorentDetails?.rank}',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(child: null),
                                      ],
                                    ),
                                  ),

                                  // Key Word Section
                                  {
                                            favRestaurantShowController
                                                .list[index]
                                                .restrorentDetails
                                                ?.keyword
                                          } ==
                                          null
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                '${favRestaurantShowController.list[index].restrorentDetails?.keyword}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              // Icon(
                                              //   Icons.circle,
                                              //   size: 7,
                                              // ),
                                              // Text(
                                              //   ' Desserts ',
                                              //   style: TextStyle(
                                              //     fontSize: 12,
                                              //     fontWeight: FontWeight.w500,
                                              //     color: Colors.black,
                                              //   ),
                                              // ),
                                              // Icon(
                                              //   Icons.circle,
                                              //   size: 7,
                                              // ),
                                              // Text(
                                              //   ' Beverages',
                                              //   style: TextStyle(
                                              //     fontSize: 12,
                                              //     fontWeight: FontWeight.w500,
                                              //     color: Colors.black,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        )
                                      : Container(),

                                  // tag SEction
                                  favRestaurantShowController.list[index]
                                              .restrorentDetails?.keyword !=
                                          null
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 7),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  color: PugauColors.pinkCard,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8,
                                                    vertical: 8,
                                                  ),
                                                  child: Text(
                                                    // '${favRestaurantShowController.list[index].restrorentDetails!.tags}',
                                                    'NO TAG',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8,
                                                    vertical: 8,
                                                  ),
                                                  child: Text(
                                                    'MUSTRY',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8,
                                                    vertical: 8,
                                                  ),
                                                  child: Text(
                                                    'NEWLYOPEN',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              {
                                                        favRestaurantShowController
                                                            .list[index]
                                                            .restrorentDetails!
                                                            .storeStatus
                                                      } !=
                                                      null
                                                  ? Container(
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        color: PugauColors
                                                            .blueCard,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 8,
                                                          horizontal: 8,
                                                        ),
                                                        child: Text(
                                                          '${favRestaurantShowController.list[index].restrorentDetails?.storeStatus}',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: PugauColors
                                                                .BLACK,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        )
                                      : Container(),

                                  // description
                                  favRestaurantShowController.list[index]
                                              .restrorentDetails?.description !=
                                          null
                                      ? Padding(
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 5),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 18,
                                            width:
                                                Helper.getScreenWidth(context),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF1F1F1),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 10),
                                                Text(favRestaurantShowController.list[index].restrorentDetails!.description.toString().replaceAll(exp, ""))
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("Please Add To Favorite",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),
                )
          : Center(
              child: Text("Please Login",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 28)),
            ),
    );
  }
}
