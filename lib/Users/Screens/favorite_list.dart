import 'package:flutter/material.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:pugau/widget/View/food_type.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../util/Helper/helper.dart';
import '../../widget/View/fav_restrorent_list.dart';
import 'Search/main_search.dart';

class FevoriteList extends StatefulWidget {
  const FevoriteList({super.key, required String title});

  @override
  State<FevoriteList> createState() => _FevoriteListState();
}

class _FevoriteListState extends State<FevoriteList> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.red.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(7)),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
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
                        style: TextStyle(fontSize: 12),
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
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.5,
                    width: Helper.getScreenWidth(context) / 3.8,
                    color: PugauColors.GREY,
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('30 FAVORITES RESRAURENTS',
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
                      width: Helper.getScreenWidth(context) / 3.8,
                      color: PugauColors.GREY,
                      padding: const EdgeInsets.only(
                        top: 2,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 10),
            //   width: Helper.getScreenWidth(context),
            //   decoration: BoxDecoration(boxShadow: [
            //     BoxShadow(
            //         color: Colors.grey.withOpacity(.4),
            //         blurRadius: 2.0,
            //         spreadRadius: 2.0,
            //         offset: const Offset(
            //           0.0,
            //           2.0,
            //         )),
            //   ], borderRadius: BorderRadius.circular(11), color: Colors.green),
            //   child: Column(
            //     children: [
            //       const SizedBox(
            //         height: 20,
            //         child: Center(
            //           child: Text('PURE VEG RESRAURENT',
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.w500)),
            //         ),
            //       ),
            //       Container(
            //         height: 25.h,
            //         width: Helper.getScreenWidth(context),
            //         decoration: const BoxDecoration(
            //             image: DecorationImage(
            //                 image: AssetImage('assets/images/burger.png'),
            //                 fit: BoxFit.cover)),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.end,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: GestureDetector(
            //                 onTap: () => setState(() {
            //                   _isFavorite = !_isFavorite;
            //                 }),
            //                 child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: _isFavorite == true
            //                         ? const Icon(Icons.favorite_border,
            //                             color: Colors.red, size: 30)
            //                         : const Icon(Icons.favorite,
            //                             color: Colors.red, size: 30)),
            //               ),
            //             ),
            //             const Spacer(),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 Column(
            //                   mainAxisAlignment: MainAxisAlignment.end,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Container(
            //                       alignment: Alignment.centerLeft,
            //                       height: 4.h,
            //                       width: 60.w,
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(5),
            //                           color: Colors.blue.withOpacity(0.9)),
            //                       child: const Padding(
            //                         padding: EdgeInsets.only(left: 5),
            //                         child: Text(
            //                           '30 % Of on entire menu',
            //                           style: TextStyle(
            //                               fontSize: 12,
            //                               fontWeight: FontWeight.w500,
            //                               color: Colors.white),
            //                         ),
            //                       ),
            //                     ),
            //                     const SizedBox(
            //                       height: 3,
            //                     ),
            //                     Container(
            //                       alignment: Alignment.centerLeft,
            //                       height: 4.h,
            //                       width: 60.w,
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(5),
            //                           color: Colors.blue.withOpacity(0.9)),
            //                       child: const Padding(
            //                         padding: EdgeInsets.only(left: 5),
            //                         child: Text(
            //                           '30 % Of on entire menu',
            //                           style: TextStyle(
            //                               fontSize: 12,
            //                               fontWeight: FontWeight.w500,
            //                               color: Colors.white),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 const Spacer(),
            //                 Padding(
            //                   padding: const EdgeInsets.only(bottom: 17),
            //                   child: Container(
            //                     height: 25,
            //                     width: 88,
            //                     decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         borderRadius: BorderRadius.circular(4)),
            //                     child: Row(
            //                       children: const [
            //                         SizedBox(
            //                           width: 3,
            //                         ),
            //                         Icon(
            //                           Icons.alarm,
            //                           color: Colors.green,
            //                           size: 18,
            //                         ),
            //                         SizedBox(
            //                           width: 3,
            //                         ),
            //                         Text(
            //                           '30 min | 2 km',
            //                           style: TextStyle(
            //                               fontSize: 10,
            //                               fontWeight: FontWeight.w500),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 const SizedBox(
            //                   width: 4,
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         height: 15.h,
            //         width: Helper.getScreenWidth(context),
            //         decoration: const BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.only(
            //                 bottomLeft: Radius.circular(11),
            //                 bottomRight: Radius.circular(11))),
            //         child: Column(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.symmetric(
            //                   horizontal: 10, vertical: 6),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     'The Burger House',
            //                     style: TextStyle(
            //                       fontSize: 16.sp,
            //                       fontWeight: FontWeight.w600,
            //                     ),
            //                   ),
            //                   const Spacer(),
            //                   Container(
            //                     height: 20,
            //                     width: 60,
            //                     decoration: BoxDecoration(
            //                         color: Colors.green,
            //                         borderRadius: BorderRadius.circular(4)),
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       crossAxisAlignment: CrossAxisAlignment.center,
            //                       children: const [
            //                         Text(
            //                           '4.5',
            //                           style: TextStyle(
            //                             fontSize: 10,
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.white,
            //                           ),
            //                         ),
            //                         Icon(
            //                           Icons.star,
            //                           size: 10,
            //                           color: Colors.white,
            //                         ),
            //                         Text(
            //                           'Rating',
            //                           style: TextStyle(
            //                             fontSize: 10,
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.white,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 10),
            //               child: Row(
            //                 children: const [
            //                   Text(
            //                     'Fast food ',
            //                     style: TextStyle(
            //                       fontSize: 12,
            //                       fontWeight: FontWeight.w500,
            //                       color: Colors.black,
            //                     ),
            //                   ),
            //                   Icon(
            //                     Icons.circle,
            //                     size: 7,
            //                   ),
            //                   Text(
            //                     ' Desserts ',
            //                     style: TextStyle(
            //                       fontSize: 12,
            //                       fontWeight: FontWeight.w500,
            //                       color: Colors.black,
            //                     ),
            //                   ),
            //                   Icon(
            //                     Icons.circle,
            //                     size: 7,
            //                   ),
            //                   Text(
            //                     ' Beverages',
            //                     style: TextStyle(
            //                       fontSize: 12,
            //                       fontWeight: FontWeight.w500,
            //                       color: Colors.black,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             const SizedBox(
            //               height: 2,
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 6),
            //               child: Row(
            //                 children: [
            //                   Container(
            //                     height: 25,
            //                     width: 65,
            //                     decoration: BoxDecoration(
            //                         color: const Color(0xffFFC7C7),
            //                         borderRadius: BorderRadius.circular(4)),
            //                     child: const Center(
            //                       child: Text(
            //                         'BESTSELLER',
            //                         style: TextStyle(
            //                           fontSize: 10,
            //                           fontWeight: FontWeight.w500,
            //                           color: Colors.black,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   const SizedBox(
            //                     width: 6,
            //                   ),
            //                   Container(
            //                     height: 25,
            //                     width: 55,
            //                     decoration: BoxDecoration(
            //                         color: const Color(0xffFFC7C7),
            //                         borderRadius: BorderRadius.circular(4)),
            //                     child: const Center(
            //                       child: Text(
            //                         'MUSTRY',
            //                         style: TextStyle(
            //                           fontSize: 10,
            //                           fontWeight: FontWeight.w500,
            //                           color: Colors.black,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   const SizedBox(
            //                     width: 6,
            //                   ),
            //                   Container(
            //                     height: 25,
            //                     width: 60,
            //                     decoration: BoxDecoration(
            //                         color: const Color(0xffFFC7C7),
            //                         borderRadius: BorderRadius.circular(4)),
            //                     child: const Center(
            //                       child: Text(
            //                         'NEWLYOPEN',
            //                         style: TextStyle(
            //                           fontSize: 10,
            //                           fontWeight: FontWeight.w500,
            //                           color: Colors.black,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   const Spacer(),
            //                   Container(
            //                     height: 25,
            //                     width: 60,
            //                     decoration: BoxDecoration(
            //                         color: Colors.blue,
            //                         borderRadius: BorderRadius.circular(4)),
            //                     child: const Center(
            //                       child: Text(
            //                         'OPEN NOW',
            //                         style: TextStyle(
            //                           fontSize: 10,
            //                           fontWeight: FontWeight.w500,
            //                           color: Colors.white,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 6),
            //               child: Container(
            //                 alignment: Alignment.centerLeft,
            //                 height: 18,
            //                 width: Helper.getScreenWidth(context),
            //                 decoration: BoxDecoration(
            //                     color: const Color.fromARGB(255, 221, 220, 220),
            //                     borderRadius: BorderRadius.circular(4)),
            //                 child: Row(
            //                   children: const [
            //                     SizedBox(
            //                       width: 5,
            //                     ),
            //                     Text(
            //                       'Best burger in the town',
            //                       style: TextStyle(
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.w500,
            //                         color: Colors.black,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Food_Type_List()
                FavRestrorentList()
          ],
        ),
      ),
    );
  }
}
