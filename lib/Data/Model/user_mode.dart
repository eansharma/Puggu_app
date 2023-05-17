//  Container(
//                 width: Helper.getScreenWidth(context),
//                 margin: EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(.4),
//                         // blurRadius: 2.0,
//                         spreadRadius: 2.0,
//                         offset: const Offset(
//                           0.0,
//                           1.0,
//                         )),
//                   ],
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const RestaurentTap(
//                                               title: '',
//                                             )),
//                                   );
//                                 },
//                                 child: const Text(
//                                   'Hoichoi Restaurent',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Row(
//                                 children: const [
//                                   Text(
//                                     'Fast food ',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   Icon(
//                                     Icons.circle,
//                                     size: 4,
//                                   ),
//                                   Text(
//                                     ' Desserts ',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   Icon(
//                                     Icons.circle,
//                                     size: 4,
//                                   ),
//                                   Text(
//                                     ' Beverages',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               const Text(
//                                 'City Street Address landmark',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Row(
//                                 children: [
//                                   Container(
//                                     height: 25,
//                                     width: 65,
//                                     decoration: BoxDecoration(
//                                         color: Colors.orange,
//                                         borderRadius: BorderRadius.circular(4)),
//                                     child: const Center(
//                                       child: Text(
//                                         'BESTSELLER',
//                                         style: TextStyle(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 6,
//                                   ),
//                                   Container(
//                                     height: 25,
//                                     width: 55,
//                                     decoration: BoxDecoration(
//                                         color: Colors.orange,
//                                         borderRadius: BorderRadius.circular(4)),
//                                     child: Center(
//                                       child: Text(
//                                         'MUSTRY',
//                                         style: TextStyle(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 6,
//                                   ),
//                                   Container(
//                                     height: 25,
//                                     width: 65,
//                                     decoration: BoxDecoration(
//                                         color: Colors.orange,
//                                         borderRadius: BorderRadius.circular(4)),
//                                     child: Center(
//                                       child: Text(
//                                         'NEWLYOPEN',
//                                         style: TextStyle(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Spacer(),
//                           GestureDetector(
//                             onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const RestaurentTap(title: '')),
//                             ),
//                             child: Container(
//                               height: 60,
//                               width: 60,
//                               decoration: BoxDecoration(boxShadow: [
//                                 new BoxShadow(
//                                     color: Colors.grey.withOpacity(.4),
//                                     blurRadius: 1.0,
//                                     spreadRadius: 1.0,
//                                     offset: Offset(1.0, 0.0)),
//                                 BoxShadow(
//                                     color: Colors.white.withOpacity(.4),
//                                     blurRadius: 1.0,
//                                     spreadRadius: 1.0,
//                                     offset: Offset(
//                                       0.0,
//                                       1,
//                                     )),
//                               ], borderRadius: BorderRadius.circular(20)),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 30,
//                                     width: 60,
//                                     decoration: BoxDecoration(
//                                         color: Colors.green,
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(20),
//                                             topRight: Radius.circular(20))),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           '4.3',
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         Icon(
//                                           Icons.star,
//                                           color: Colors.white,
//                                           size: 11,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 30,
//                                     width: 60,
//                                     decoration: const BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.only(
//                                             bottomLeft: Radius.circular(20),
//                                             bottomRight: Radius.circular(20))),
//                                     child: const Text(
//                                       '200 \nReviews',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             width: Helper.getScreenWidth(context) / 1.6,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 new BoxShadow(
//                                     color: Colors.grey.withOpacity(.4),
//                                     // blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(
//                                       0.0,
//                                       1.0,
//                                     )),
//                               ],
//                               borderRadius: BorderRadius.circular(7),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 6, vertical: 4),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.circle,
//                                         size: 9,
//                                         color: Colors.green,
//                                       ),
//                                       GestureDetector(
//                                         child: Text(
//                                           'OPEN NOW',
//                                           style: TextStyle(
//                                               color: Colors.green,
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w400),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Container(
//                                         width: 2,
//                                         height: 12,
//                                         color:
//                                             Color.fromARGB(255, 165, 163, 163),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         '11:00 AM - 11:30 PM',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                       Spacer(),
//                                       Icon(
//                                         Icons.arrow_drop_down,
//                                         size: 13,
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             width: Helper.getScreenWidth(context) / 4.5,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 new BoxShadow(
//                                     color: Colors.grey.withOpacity(.4),
//                                     // blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(
//                                       0.0,
//                                       1.0,
//                                     )),
//                               ],
//                               borderRadius: BorderRadius.circular(7),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 5, vertical: 4),
//                               child: Center(
//                                   child: Text(
//                                 '\$200 for two',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400),
//                               )),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             width: Helper.getScreenWidth(context) / 1.9,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 new BoxShadow(
//                                     color: Colors.grey.withOpacity(.4),
//                                     // blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(
//                                       0.0,
//                                       1.0,
//                                     )),
//                               ],
//                               borderRadius: BorderRadius.circular(7),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 6, vertical: 4),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.alarm,
//                                         size: 12,
//                                         color: Colors.green,
//                                       ),
//                                       Text(
//                                         '30 mins',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Container(
//                                         width: 2,
//                                         height: 12,
//                                         color:
//                                             Color.fromARGB(255, 165, 163, 163),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         '2 km away',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                       Spacer(),
//                                       Icon(
//                                         Icons.arrow_drop_down,
//                                         size: 13,
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             width: Helper.getScreenWidth(context) / 6.5,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 new BoxShadow(
//                                     color: Colors.grey.withOpacity(.4),
//                                     // blurRadius: 2.0,
//                                     spreadRadius: 2.0,
//                                     offset: Offset(
//                                       0.0,
//                                       1.0,
//                                     )),
//                               ],
//                               borderRadius: BorderRadius.circular(7),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 5, vertical: 4),
//                               child: Center(
//                                   child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.favorite_border_outlined,
//                                     size: 14,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     'Like',
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ],
//                               )),
//                             ),
//                           ),
//                           Spacer(),
//                           Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 4, vertical: 4),
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(4)),
//                               child: Text(
//                                 '10% off',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400),
//                               )),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//                SizedBox(
//                 height: 20,
//               ),
//                Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
//                     child: GestureDetector(
//                       onTap: () {
//                         _coupon();
//                       },
//                       child: Container(
//                         height: 35,
//                          decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(7),
//                                   color: Color(0xff26205EFE),
//                                   border: Border.all(width: 1,color: Color(0xff26205EFE),)
//                                 ),child: Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 2),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Icon(Icons.verified,color: Colors.blue,),
//                                       SizedBox(width: 7,),
//                                       Container(
//                                          decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(7),
//                                   color: Colors.white,
                                         
//                                 ),
//                                         width: Helper.getScreenWidth(context)/1.53,
//                                         height: 35,
//                                         child: CarouselSlider(
//                                                 options: CarouselOptions(
//                                                   onPageChanged: (index, reason) {
//                                                     setState(() {
//                                                 _selectindex=index;
//                                                     });
//                                                   },
//                                                    height: 25,viewportFraction: 0.99,initialPage: 0,
//                                                   ),
//                                                 items:[
//                                          Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                            children: const [
//                                                           Text('40% OFF up to ₹80',
//                                         style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),),
//                                           Text('use code TASTY',
//                                         style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color.fromARGB(66, 39, 39, 39)
//                                         ),),
//                                            ],
//                                          ),
                                        
//                                                 ]
//                                               ),
//                                       ),
//                                        Spacer(),
//                                               Container(
//                                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(7),
//                                   color: Colors.white,
                                         
//                                 ),
//                                         width: Helper.getScreenWidth(context)/7.5,
//                                          child: Padding(
//                                            padding: const EdgeInsets.symmetric(horizontal: 0.5,vertical: 12),
//                                            child: PageViewDotIndicator(
//                                                                   size: Size(6, 6),
//                                               currentItem:_selectindex,
//                                               count: 4,
//                                               unselectedColor: Colors.black26,
//                                               selectedColor: Colors.red,
//                                               duration: Duration(milliseconds: 200),
//                                               boxShape: BoxShape.circle,
//                                             ),
//                                          ),
//                                        )
//                                     ],
//                                   ),
//                                 ),
//                       ),
//                     ),
//                   ),

//                   //ahjajjhjghhhhhhjhhhhhjjhjjhjjhjjjj
//                   Row(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 1,
//                               spreadRadius: 1,
//                               offset: Offset(0, 1))
//                         ],
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 8),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.square,
//                               color: Colors.green,
//                               size: 15,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               'Veg',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 1,
//                               spreadRadius: 1,
//                               offset: Offset(0, 1))
//                         ],
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 8),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.square,
//                               color: Colors.red,
//                               size: 15,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               'Non-Veg',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const MenuSearch(
//                                   title: '',
//                                 )),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Container(
//                         height: 35,
//                         width: 100,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Color.fromARGB(255, 221, 221, 221)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.search,
//                               color: Colors.red,
//                               size: 15,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               'Search Menu',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               //sddddddddddddddddddddd
//               //hhhhhhhhhhhhhhhhhh