import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:pugau/Data/Api/API_URLs.dart';

import 'package:pugau/Users/Controller/Restaurent_Product_Controller.dart';
import 'package:pugau/Users/Controller/cart_controller.dart';
import 'package:pugau/Users/Controller/coopan_controller.dart';
import 'package:pugau/Users/Controller/view_card_controller.dart';
import 'package:pugau/Users/Screens/Cart/cart.dart';
import 'package:pugau/Users/Screens/Search/menu_search.dart';
import 'package:pugau/Users/Screens/Restaurants/resturaurent_tap.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import '../../../Data/Model/Restaurent_Product_model.dart';
import '../../../util/Helper/helper.dart';
import '../../../Data/Model/mock_data.dart';
import 'package:flutter/cupertino.dart';

class RestaurentDetails extends StatefulWidget {
  String? title, image, address, seller_id;
  // const RestaurentDetails({super.key});
  RestaurentDetails(
      {required this.title,
      required this.image,
      required this.address,
      required this.seller_id});

  @override
  State<RestaurentDetails> createState() => _RestaurentDetailsState();
}

var itemCount = 0;
bool rotation = false;
int? check;

class _RestaurentDetailsState extends State<RestaurentDetails>
    with TickerProviderStateMixin {
  var sectionList = MockData.getExampleSections(
      Get.find<Resaurent_Product_Controller>().Restaurent.length != 0
          ? Get.find<Resaurent_Product_Controller>().Restaurent.length
          : 0,
      5,
      Get.find<Resaurent_Product_Controller>().Restaurent);

  int selectedRadio = 1;

  void setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  late TabController tabController, subTabController;
  final GlobalKey<NestedScrollViewState> nestedScrollKey = GlobalKey();
  double _expandedHeight = 200;

  bool _isPinnedTitleShown = false;
  final scrollController = ScrollController();

  int _counter = 0;
  int _counter1 = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _dcrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  void _dcrementCounter1() {
    setState(() {
      _counter1--;
    });
  }

  List<int> selectedItemscount = [];
  int _selectindex = 0;
  bool isOpen = true;
  bool btnChange = false;
  final ScrollController _scrollController = ScrollController();
  final CoopanController controller = Get.put(CoopanController());
  TextEditingController addCooking = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
    this.subTabController = TabController(length: 2, vsync: this);
    var headerContentHeight = _expandedHeight - kToolbarHeight;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      outerController.addListener(() {
        var pinned = outerController.offset >= headerContentHeight;
        if (_isPinnedTitleShown != pinned) {
          setState(() {
            _isPinnedTitleShown = pinned;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    subTabController.dispose();
    super.dispose();
  }

  ScrollController get outerController {
    return nestedScrollKey.currentState!.outerController;
  }

  final CartController _cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: itemCount != 0
            ? Container(
                color: Colors.transparent,
                child: Container(
                  height: 6.h,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(children: [
                    TextButton(
                      onPressed: () {
                       
                      },
                      child: Text(
                        '${itemCount} ITEM ADDED',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 0.3.w,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 8),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '\$90 Plus',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        if (itemCount == 0) {
                          showCustomSnackBar(
                              "Plese Add to product in your cart",
                              isError: true);
                        } else {
                          Get.find<ViewCardController>().viewCardData();
                          // Get.put(ViewCardController());
                          Get.to(() => Cart(
                                title: '',
                              ));
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            'VIEW CART',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 2),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            : SizedBox(),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverAppBar(
                    expandedHeight: 240.0,
                    title: widget.title.toString(),
                    image: widget.image.toString(),
                  ),
                ),
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height / 3.3,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    // expandedTitleScale: 1,
                    //
                    background: Column(
                      children: [
                        Column(children: [
                          Container(
                            width: Helper.getScreenWidth(context),
                            margin: EdgeInsets.symmetric(horizontal: 10),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RestaurentTap(
                                                          title: widget.title
                                                              .toString(),
                                                          address: widget
                                                              .address
                                                              .toString(),
                                                          image: widget.image
                                                              .toString(),
                                                          seller_id: widget
                                                              .seller_id
                                                              .toString(),
                                                        )),
                                              );
                                            },
                                            child: Text(
                                              widget.title.toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                'Fast food ',
                                                style: TextStyle(
                                                  fontSize: 12,
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
                                                  fontSize: 12,
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
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'City Street Address landmark',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                child: Container(
                                                  height: 25,
                                                  width: 65,
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  child: const Center(
                                                    child: Text(
                                                      'BESTSELLER',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 55,
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: Center(
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
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 65,
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: Center(
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
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RestaurentTap(
                                                    title:
                                                        widget.title.toString(),
                                                    address: widget.address
                                                        .toString(),
                                                    image:
                                                        widget.image.toString(),
                                                    seller_id: widget.seller_id
                                                        .toString(),
                                                  )),
                                        ),
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                new BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(.4),
                                                    blurRadius: 1.0,
                                                    spreadRadius: 1.0,
                                                    offset: Offset(1.0, 0.0)),
                                                BoxShadow(
                                                    color: Colors.white
                                                        .withOpacity(.4),
                                                    blurRadius: 1.0,
                                                    spreadRadius: 1.0,
                                                    offset: Offset(
                                                      0.0,
                                                      1,
                                                    )),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20))),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '4.3',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                height: 30,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20))),
                                                child: const Text(
                                                  '200 \nReviews',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: Helper.getScreenWidth(context) /
                                            1.6,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            new BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(.4),
                                                // blurRadius: 2.0,
                                                spreadRadius: 2.0,
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                )),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.circle,
                                                    size: 9,
                                                    color: Colors.green,
                                                  ),
                                                  GestureDetector(
                                                    child: Text(
                                                      'OPEN NOW',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    width: 2,
                                                    height: 12,
                                                    color: Color.fromARGB(
                                                        255, 165, 163, 163),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '11:00 AM - 11:30 PM',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Spacer(),
                                                  Icon(
                                                    Icons.arrow_drop_down,
                                                    size: 13,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: Helper.getScreenWidth(context) /
                                            4.5,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            new BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(.4),
                                                // blurRadius: 2.0,
                                                spreadRadius: 2.0,
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                )),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 4),
                                          child: Center(
                                              child: Text(
                                            '\$200 for two',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: Helper.getScreenWidth(context) /
                                            1.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            new BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(.4),
                                                // blurRadius: 2.0,
                                                spreadRadius: 2.0,
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                )),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.alarm,
                                                    size: 12,
                                                    color: Colors.green,
                                                  ),
                                                  Text(
                                                    '30 mins',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    width: 2,
                                                    height: 12,
                                                    color: Color.fromARGB(
                                                        255, 165, 163, 163),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '2 km away',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Spacer(),
                                                  Icon(
                                                    Icons.arrow_drop_down,
                                                    size: 13,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: Helper.getScreenWidth(context) /
                                            6.5,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            new BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(.4),
                                                // blurRadius: 2.0,
                                                spreadRadius: 2.0,
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                )),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 4),
                                          child: Center(
                                              child: Row(
                                            children: [
                                              Icon(
                                                Icons.favorite_border_outlined,
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Like',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          )),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Text(
                                            '10% off',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: GestureDetector(
                              onTap: () {
                                _coupon();
                              },
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color(0xff26205EFE),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff26205EFE),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.verified,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Obx(() {
                                        if (controller.coupanDataList.isEmpty) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                                // color: PugauColors.themeColor,
                                                // strokeWidth: 4.0,
                                                ),
                                          );
                                        } else {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Colors.white,
                                            ),
                                            width:
                                                Helper.getScreenWidth(context) /
                                                    1.53,
                                            height: 35,
                                            child: CarouselSlider.builder(
                                              itemCount: controller
                                                  .coupanDataList.length,
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
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index,
                                                      int realIndex) {
                                                final coupon = controller
                                                    .coupanDataList[index];
                                                // aditya
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '40% OFF up to ₹ ${coupon.amount?.toStringAsFixed(2)} ',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      'use code ${coupon.couponCode ?? ''}',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              66, 39, 39, 39)),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      }),
                                      Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.white,
                                        ),
                                        width: Helper.getScreenWidth(context) /
                                            7.5,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0.5, vertical: 12),
                                          child: controller
                                                  .coupanDataList.isEmpty
                                              ? Container(
                                                  height: 6,
                                                  width: 6,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: PugauColors
                                                          .themeColor),
                                                )
                                              : PageViewDotIndicator(
                                                  size: Size(6, 6),
                                                  currentItem: _selectindex,
                                                  count: controller
                                                      .coupanDataList.length,
                                                  unselectedColor:
                                                      Colors.black26,
                                                  selectedColor: Colors.red,
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  boxShape: BoxShape.circle,
                                                ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverHeader(
                      maxExtent: 50,
                      minExtent: 50.0,
                      seller_id: widget.seller_id.toString()),
                ),
                SliverExpandableList(
                  builder:
                      SliverExpandableChildDelegate<String, ExampleSection>(
                    sectionList: sectionList,
                    sectionBuilder: (context, containerInfo) => _SectionWidget(
                      section: sectionList[containerInfo.sectionIndex],
                      // containerInfo: [1],
                      containerInfo: containerInfo,
                      onStateChanged: () {
                        //notify ExpandableListView that expand state has changed.
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            setState(() {});
                          }
                        });
                      },
                    ),
                    itemBuilder: (context, sectionIndex, itemIndex, index) {
                      return ListTile(
                        title: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              margin: EdgeInsets.only(
                                  left: 0, right: 10, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.8, color: Colors.grey)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          Get.find<
                                                  Resaurent_Product_Controller>()
                                              .Restaurent[sectionIndex]
                                              .submenus![itemIndex]
                                              .title
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        height: 2.w,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(1),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 0.5.w,
                                                  color: Get.find<Resaurent_Product_Controller>()
                                                              .Restaurent[
                                                                  sectionIndex]
                                                              .submenus![
                                                                  itemIndex]
                                                              .type
                                                              .toString() ==
                                                          "veg"
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Icon(
                                              Icons.circle,
                                              color:
                                                  Get.find<Resaurent_Product_Controller>()
                                                              .Restaurent[
                                                                  sectionIndex]
                                                              .submenus![
                                                                  itemIndex]
                                                              .type
                                                              .toString() ==
                                                          "veg"
                                                      ? Colors.green
                                                      : Colors.red,
                                              size: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          InkWell(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Colors.pink.shade50,
                                              ),
                                              child: Text('BESTSELLER',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp)),
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.w,
                                      ),
                                      Text(
                                        '₹' +
                                            Get.find<
                                                    Resaurent_Product_Controller>()
                                                .Restaurent[sectionIndex]
                                                .submenus![itemIndex]
                                                .price
                                                .toString() +
                                            '/' +
                                            Get.find<
                                                    Resaurent_Product_Controller>()
                                                .Restaurent[sectionIndex]
                                                .submenus![itemIndex]
                                                .unit
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                        // unitp
                                      ),
                                      SizedBox(
                                        height: 0.5.w,
                                      ),
                                      Text(
                                        Get.find<Resaurent_Product_Controller>()
                                            .Restaurent[sectionIndex]
                                            .submenus![itemIndex]
                                            .description
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Stack(
                                    children: [
                                      Column(
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              height: 12.h,
                                              width: 26.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  image: DecorationImage(
                                                      image: NetworkImage(AppContent
                                                              .BASE_URL +
                                                          "/public/uploads/subMenu/" +
                                                          Get.find<
                                                                  Resaurent_Product_Controller>()
                                                              .Restaurent[
                                                                  sectionIndex]
                                                              .submenus![
                                                                  itemIndex]
                                                              .image
                                                              .toString()),
                                                      fit: BoxFit.cover)),
                                            ),
                                            onTap: () {
                                              showFlexibleBottomSheet(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            25.0),
                                                    topRight:
                                                        const Radius.circular(
                                                            25.0),
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
                                          ),
                                          SizedBox(height: 1.5.h),
                                          Text(
                                            'After 4:30pm',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.sp),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                        ],
                                      ),

// Inside your build method:

// Inside your build method:
                                      GetBuilder<CartController>(
                                        builder: (_cartController) =>
                                            Positioned(
                                          bottom: 20,
                                          right: 12,
                                          left: 12,
                                          child: InkWell(
                                            onTap: () {
                                              final customizable = Get.find<
                                                      Resaurent_Product_Controller>()
                                                  .Restaurent[sectionIndex]
                                                  .submenus![itemIndex]
                                                  .isCustomizable;

                                              if (customizable == 0) {
                                                _cartController.Add_to_Cart(
                                                  Get.find<
                                                          Resaurent_Product_Controller>()
                                                      .Restaurent[sectionIndex]
                                                      .submenus![itemIndex]
                                                      .id
                                                      .toString(),
                                                  Get.find<
                                                          Resaurent_Product_Controller>()
                                                      .Restaurent[sectionIndex]
                                                      .submenus![itemIndex]
                                                      .price
                                                      .toString(),
                                                  itemCount.toString(),
                                                  Get.find<
                                                          Resaurent_Product_Controller>()
                                                      .Restaurent[sectionIndex]
                                                      .submenus![itemIndex]
                                                      .unit
                                                      .toString(),
                                                );
                                              } else {
                                                _cartbottamsheet(
                                                  Get.find<
                                                          Resaurent_Product_Controller>()
                                                      .Restaurent[sectionIndex]
                                                      .submenus![itemIndex]
                                                      .id
                                                      .toString(),
                                                  Get.find<
                                                          Resaurent_Product_Controller>()
                                                      .Restaurent[sectionIndex]
                                                      .submenus![itemIndex]
                                                      .title
                                                      .toString(),
                                                  Get.find<
                                                          Resaurent_Product_Controller>()
                                                      .Restaurent[sectionIndex]
                                                      .submenus![itemIndex]
                                                      .image
                                                      .toString(),
                                                  Get.find<
                                                          Resaurent_Product_Controller>()
                                                      .Restaurent[sectionIndex]
                                                      .submenus![itemIndex]
                                                      .unit
                                                      .toString(),
                                                  Get.find<
                                                          Resaurent_Product_Controller>()
                                                      .Restaurent[sectionIndex]
                                                      .submenus![itemIndex]
                                                      .attributes!,
                                                );
                                              }

                                              setState(() {
                                                // Update the specific item's itemCount
                                                if (selectedItemscount
                                                    .contains(itemIndex)) {
                                                  selectedItemscount
                                                      .remove(itemIndex);
                                                  itemCount = 1;
                                                } else {
                                                  selectedItemscount
                                                      .add(itemIndex);
                                                  itemCount = 1;
                                                }
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.0, vertical: 5),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 0.3,
                                                    color: Colors.red),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: selectedItemscount
                                                      .contains(itemIndex)
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        itemCount != 1
                                                            ? InkWell(
                                                                onTap: () =>
                                                                    setState(() =>
                                                                        itemCount--),
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 18,
                                                                ),
                                                              )
                                                            : SizedBox(),
                                                        Text(
                                                          itemCount.toString(),
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () => setState(
                                                              () =>
                                                                  itemCount++),
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.red,
                                                            size: 18,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      children: [
                                                        Icon(
                                                          Icons.add,
                                                          color: Colors.red,
                                                          size: 15,
                                                        ),
                                                        SizedBox(width: 2),
                                                        Text(
                                                          'Add',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: itemCount != 0 ? 55 : 5,
                left: 150,
                child: GestureDetector(
                  onTap: () {
                    _menu(context);
                  },
                  child: Container(
                    height: 5.h,
                    width: 90,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.pink.shade100,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.wallpaper_outlined),
                        SizedBox(
                          width: 1.h,
                        ),
                        Text(
                          'Menu',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
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
          return SingleChildScrollView(child: Obx(() {
            if (controller.coupanDataList.isEmpty) {
              return Center(
                child: CircularProgressIndicator(
                    // color: PugauColors.themeColor,
                    // strokeWidth: 4.0,
                    ),
              );
            } else {
              return SizedBox(
                  height: 250.h,
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
                        Divider(
                          thickness: 1,
                        ),
                        Text(
                          'Free Veg Momo',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Pagau',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Get 50% OFF up to \$ ${controller.coupanDataList[0].amount?.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Valid on only this order',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromARGB(255, 6, 56, 97)),
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.lightBlue.withOpacity(0.3)),
                              child: Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  '${controller.coupanDataList[0].couponCode ?? ''}',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 2, 60, 107)),
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
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
                  ));
            }
          }));
        });
  }

  void _itemAdded() {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (builder) {
          return Container(
              height: 500.0,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.5,
                          width: Helper.getScreenWidth(context) / 3,
                          color: Color.fromARGB(255, 153, 153, 153),
                          padding: EdgeInsets.only(
                            top: 2,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('ITEM ADDED',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            height: 1.5,
                            width: Helper.getScreenWidth(context) / 3,
                            color: Color.fromARGB(255, 153, 153, 153),
                            padding: EdgeInsets.only(
                              top: 2,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Helper.getScreenWidth(context),
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.grey.withOpacity(.4),
                            // blurRadius: 2.0,
                            spreadRadius: 2.0,
                            offset: Offset(
                              0.0,
                              1.0,
                            )),
                      ],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.square,
                                color: Colors.green,
                                size: 18,
                              ),
                              Text(
                                'Butter Vada Paw',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 30,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          width: 1, color: Colors.red)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            _dcrementCounter();
                                          },
                                          child: Text(
                                            '–',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '$_counter',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            _incrementCounter();
                                          },
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              children: [
                                Text(
                                  '₹40',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  '₹40',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            child: Text(
                              'Full Plate[2 pieces]',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 179, 177, 177),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            child: Row(
                              children: [
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.red,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.square,
                                color: Colors.green,
                                size: 18,
                              ),
                              Text(
                                'Butter Vada Paw',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 30,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          width: 1, color: Colors.red)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            _dcrementCounter1();
                                          },
                                          child: Text(
                                            '–',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '$_counter1',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            _incrementCounter1();
                                          },
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              children: [
                                Text(
                                  '₹40',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  '₹40',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _itemAdded();
                              },
                              child: Row(
                                children: [
                                  Text(
                                    '1 ITEM ADDED',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 18,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   width: 5,
                            // ),
                            Container(
                              width: 1.5,
                              height: 25,
                              color: Colors.white,
                            ),
                            // Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Cart(title: '')),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'VIEW CART',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 18,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ));
        });
  }

  void _cartbottamsheet(
      String? id, name, image, unit, List<Attributes> variation) {
    showMaterialModalBottomSheet(
      // isScrollControlled: true,
      isDismissible: true,
      context: context,
      backgroundColor: Colors.transparent,

      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22)),
                color: PugauColors.WHITE),
            height: MediaQuery.of(context).size.height / 1.9,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            image: DecorationImage(
                                image: NetworkImage(AppContent.BASE_URL +
                                    "/public/uploads/subMenu/" +
                                    image.toString()),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        name.toString(),
                        // "Rosted Chicken",

                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.square,
                        size: 18,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Helper.getScreenWidth(context),
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.4),
                          // blurRadius: 2.0,
                          spreadRadius: 2.0,
                          offset: Offset(
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
                        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Row(
                          children: [
                            Text(
                              'QUANTITY',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Seclect any one',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 122, 122, 122),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border:
                                      Border.all(width: 1, color: Colors.red)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
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
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: variation.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 25,
                            child: InkWell(
                              onTap: () {
                                setSelectedRadio(index);
                                String price =
                                    variation[index].pivot?.price.toString() ??
                                        "0";
                                check = int.tryParse(price) ?? 0;

                                setState(() {
                                  setSelectedRadio(index);
                                });
                              },
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: .8,
                                    child: Radio(
                                      activeColor: PugauColors.themeColor,
                                      value: index,
                                      groupValue: selectedRadio,
                                      onChanged: (val) {
                                        setState(() {
                                          setSelectedRadio(val!);
                                          setSelectedRadio(index);
                                          String price = variation[index]
                                                  .pivot
                                                  ?.price
                                                  .toString() ??
                                              "0";
                                          check = int.tryParse(price) ?? 0;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    variation[index].title.toString(),
                                    // half
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Text(
                                    ' ${variation[index].pivot!.price}',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 122, 122, 122),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 10)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Add Cooking Intruction',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines: 2,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              controller: addCooking,
                              textAlignVertical: TextAlignVertical.bottom,
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 153, 153, 153),
                                        width: 1)
                                    //<-- SEE HERE
                                    ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 153, 153, 153),
                                        width: 1)

                                    //<-- SEE HERE
                                    ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                // Spacer(),
                SizedBox(
                  height: 40,
                ),
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
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Visibility(
                                  visible: itemCount > 0,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() => itemCount--);
                                    },
                                    child: Icon(
                                      Icons.minimize,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                itemCount.toString(),
                                // '1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() => itemCount++);
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.red,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          // repeat();
                          if (check != 0) {
                            showCustomSnackBar(
                                "Product added to cart successfully!",
                                isError: false);
                            _cartController.Add_to_Cart(
                              id.toString(),
                              variation[0].pivot!.price.toString(),
                              itemCount,
                              unit.toString(),
                            );
                          } else {
                            // repeat();
                          }
                        },
                        child: Container(
                          height: 40,
                          width: Helper.getScreenWidth(context) / 2.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              // abc
                              ((check ?? 0) * (itemCount ?? 0)).toString(),
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
            ));
      }),
    );
  }

  void repeat() {
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
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
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Repeat with same combination',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.square_outlined,
                            color: Colors.red,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                          Spacer(),
                          Text(
                            '\$190',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
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
                            child: Center(
                              child: Text(
                                'Add New',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 30,
                            width: Helper.getScreenWidth(context) / 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 1, color: Colors.red)),
                            child: Center(
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
                                      image: AssetImage(
                                          'assets/images/pizzapopup1.png'),
                                      fit: BoxFit.cover,
                                      width:
                                          Helper.getScreenWidth(context) / 1.05,
                                    )),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/pizzapopup.png'),
                                      fit: BoxFit.cover,
                                      width:
                                          Helper.getScreenWidth(context) / 1.05,
                                    )),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/pizzapopup1.png'),
                                      fit: BoxFit.cover,
                                      width:
                                          Helper.getScreenWidth(context) / 1.05,
                                    )),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image: AssetImage(
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
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.pinkAccent
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                'BESTSELLER',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rosted Chicken',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
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

  void _menu(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22)),
        ),
        isDismissible: true,
        context: context,
        builder: (builder) {
          return Container(
              // height: 450.0,
              height: 60.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22)),
              ),
              child: Column(
                children: [
                  SizedBox(
                      //color: Colors.white.withOpacity(0.2),
                      height: 60.h,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 6, left: 6, top: 20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Menu',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context, true);
                                      },
                                      child: const Icon(Icons.close),
                                    )
                                  ],
                                ),
                                VsScrollbar(
                                    controller: _scrollController,
                                    showTrackOnHover: true, // default false
                                    isAlwaysShown: true, // default false
                                    scrollbarFadeDuration: const Duration(
                                        milliseconds:
                                            500), // default : Duration(milliseconds: 300)
                                    scrollbarTimeToFade:
                                        const Duration(milliseconds: 800),
                                    style: const VsScrollbarStyle(
                                      hoverThickness: 5.0, // default 12.0
                                      radius: Radius.circular(
                                          10), // default Radius.circular(8.0)
                                      thickness: 5.0, // [ default 8.0 ]
                                      color: Colors.red,
                                    ),
                                    child: SizedBox(
                                        height: 60.h,
                                        child: ListView.builder(
                                            itemCount: Get.find<
                                                    Resaurent_Product_Controller>()
                                                .Restaurent
                                                .length,
                                            shrinkWrap: true,
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            itemBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    right: 25),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        Get.find<
                                                                Resaurent_Product_Controller>()
                                                            .Restaurent[index]
                                                            .title
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Text(
                                                        Get.find<
                                                                Resaurent_Product_Controller>()
                                                            .Restaurent[index]
                                                            .submenuCount
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ],
                                                ),
                                              );
                                            })))
                              ],
                            ),
                          ]),
                        ),
                      )),
                ],
              ));
        });
  }
}

class _SectionWidget extends StatefulWidget {
  final ExampleSection section;
  final ExpandableSectionContainerInfo containerInfo;
  final VoidCallback onStateChanged;

  _SectionWidget(
      {required this.section,
      required this.containerInfo,
      required this.onStateChanged});

  @override
  __SectionWidgetState createState() => __SectionWidgetState();
}

class __SectionWidgetState extends State<_SectionWidget>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  late AnimationController _controller;

  late Animation _iconTurns;

  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _iconTurns =
        _controller.drive(_halfTween.chain(CurveTween(curve: Curves.easeIn)));
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));

    if (widget.section.isSectionExpanded()) {
      _controller.value = 1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.containerInfo
      ..header = _buildHeader(context)
      ..content = _buildContent(context);
    return ExpandableSectionContainer(
      info: widget.containerInfo,
    );
  }

  Widget _buildHeader(
    BuildContext context,
  ) {
    return Card(
      elevation: 0,
      child: Container(
        height: 50,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   border: Border(
        //     top: BorderSide(),
        //     bottom: BorderSide()
        //   )
        // ),
        color: Colors.white,

        child: ListTile(
          title: Text(
            //  '${titleList}',
            widget.section.header,

            style: TextStyle(color: Colors.black),
          ),
          trailing: RotationTransition(
            turns: _iconTurns as Animation<double>,
            child: const Icon(
              Icons.expand_more,
              color: Colors.black,
            ),
          ),
          onTap: _onTap,
        ),
      ),
    );
  }

  void _onTap() {
    widget.section.setSectionExpanded(!widget.section.isSectionExpanded());
    if (widget.section.isSectionExpanded()) {
      widget.onStateChanged();
      _controller.duration = Duration(milliseconds: 400);
      _controller.forward();
    } else {
      _controller.duration = Duration(milliseconds: 400);
      _controller.reverse().then((_) {
        widget.onStateChanged();
      });
    }
  }

  Widget _buildContent(BuildContext context) {
    return SizeTransition(
      sizeFactor: _heightFactor,
      child: SliverExpandableChildDelegate.buildDefaultContent(
          context, widget.containerInfo),
    );
  }
}
// Custom Dotted line only bottom

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print("shrinkOffset:$shrinkOffset overlapsContent:$overlapsContent");
    return Container(color: Colors.yellow, child: this.child);
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class MySliverHeader extends SliverPersistentHeaderDelegate {
  String? seller_id;
  MySliverHeader({
    required this.minExtent,
    required this.maxExtent,
    required this.seller_id,
  });

  final double minExtent;
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.white, // Set the background color here
          child: Row(
            children: [
              InkWell(
                onTap: () async {
                  Get.find<Resaurent_Product_Controller>().check("veg");
                  await Get.find<Resaurent_Product_Controller>()
                      .product(seller_id.toString(), "veg");
                },
                child: Card(
                  child: Container(
                      height: 40, width: 60, child: Center(child: Text('Veg'))),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () async {
                  await Get.find<Resaurent_Product_Controller>()
                      .product(seller_id.toString(), "non_veg");
                },
                child: Card(
                  child: Container(
                      height: 40,
                      width: 90,
                      child: Center(child: Text('Non Veg'))),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Get.to(() => MenuSearch());
                },
                child: Card(
                  child: Container(
                    height: 40,
                    width: 120,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          enabled: false,
                          contentPadding: EdgeInsets.only(top: 5)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  String? title, image;
  MySliverAppBar({
    required this.expandedHeight,
    required this.title,
    required this.image,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          height: Helper.getScreenHeight(context) / 3.5,
          width: Helper.getScreenWidth(context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(image.toString()), fit: BoxFit.cover)),
        ),
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.keyboard_arrow_left,
                          size: 30, color: Colors.black)),
                  Text(
                    title.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.share, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
