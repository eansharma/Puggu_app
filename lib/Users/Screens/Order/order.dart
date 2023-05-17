import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pugau/Users/Screens/Genie/genie_order_details.dart';
import 'package:pugau/Users/Screens/Order/order_summry.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../util/Helper/helper.dart';
import '../review/add_delivery_review.dart';

class Order extends StatefulWidget {
  const Order({super.key, required String title});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21,vertical: 10),
                child: GestureDetector(onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios,size: 18,),
                ),
              ),
               Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 17),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Container(height: 1.5,width: Helper.getScreenWidth(context)/3.2,
                      color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                      const SizedBox(width: 5,),
                       const Text('MY ORDER',textAlign: TextAlign.center, 
                       style: TextStyle( color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600)),
                           const SizedBox(width: 5,),
                    Container(height: 1.5,width: Helper.getScreenWidth(context)/3.2,
                    color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                     ],
                   ),
                 ), 
                 const SizedBox(height: 14,),
                 GestureDetector(
                  onTap: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderSummary(title: '')),
                        );
                  },
                   child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 260,width: Helper.getScreenWidth(context),
                    decoration: BoxDecoration(
                       color: Colors.white,
                       boxShadow: [
                           BoxShadow(
                              color: Colors.grey.withOpacity(.4),
                        // blurRadius: 2.0, 
                         spreadRadius: 2.0, 
                         offset: const Offset(0.0, 1.0,)
                           ),
                          
                         ],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 95,width: Helper.getScreenWidth(context),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                            color: Color.fromARGB(255, 223, 223, 223)
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     const SizedBox(
                                      width: 250,
                                      child: Text('Sardar jii ke Mashoor Chhole Bhature',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(4)
                                        ),
                                        child:  const Center(child: Text('DELIVERED',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),)),
                                      ),
                                      const SizedBox(height: 10,),
                                       const Text('VIEW DETAILS',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),),
                                  
                                    ],
                                  ),
                                  ],
                                ),
                              ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 6),
                                 child: Row(
                                  children: [
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: const [
                                         Text('Bhairahawa, Bank Road',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                      SizedBox(height: 10,),
                                       Text('13 Jan 2023 at 6:00 PM',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),), 
                                       ],
                                     ),
                                     const Spacer(),
                                      const Text('Track My Order',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.red),),
                                      const Icon(Icons.arrow_drop_down,color: Colors.red,size: 18,)
                                  ],
                                 ),
                               )
                            ],
                          ),
                        ),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            const SizedBox(height: 9,),
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 6),
                               child: Row(
                                 children: const [
                                  Icon(Icons.square,color: Colors.green,size: 15,),
                                   Text('Double Burger 1 x 100 = 100',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                 ],
                               ),
                             ),
                             const SizedBox(height: 9,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Row(
                                 children: const [
                                  Icon(Icons.square,color: Colors.green,size: 15,),
                                   Text('Double Burger 1 x 100 = 100',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                 ],
                                                       ),
                              ),
                             const SizedBox(height: 9,),
                             const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22),
                               child: Text('Seen More...',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                             ), 
                         
                           ],
                         ),
                         const Divider(thickness: 1,color: Color.fromARGB(255, 126, 125, 125),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                                 children: [
                                  const Icon(Icons.location_pin,color: Colors.grey,size: 15,),
                                  const SizedBox(width: 5,),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                     children: const [
                                       Text('Bhairahwa , Bank Road Rupandehi',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                   SizedBox(height: 5,),
                                    Text('GC44XX Siddharthnagar Nepal',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                     ],
                                   ),
                                   const Spacer(),
                                 const Text('\$250.79',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                 ],
                               ),
                      ),
                             const Divider(thickness: 1,color: Color.fromARGB(255, 126, 125, 125),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          children: [
                            Container(
                                              height: 22,width: 167,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 252, 206, 221),
                                                borderRadius: BorderRadius.circular(4)
                                              ),
                                              child:  const Center(child: Text('Deliverd by Rider Rakesh Sharma',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),)),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                               onTap: () {
                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddDeliveryReview(title: '')),
                        );
                          },
                                              child: Container(
                                                height: 22,width: 120,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(4)
                                                ),
                                                child:  const Center(child: Text('Rate Order Or Rider',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),)),
                                              ),
                                            ),
                          ],
                        ),
                      ),
                      ],
                    ),
                   ),
                 ),
         const SizedBox(height: 14,),
                 Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 260,width: Helper.getScreenWidth(context),
                  decoration: BoxDecoration(
                     color: Colors.white,
                     boxShadow: [
            BoxShadow(
               color: Colors.grey.withOpacity(.4),
               // blurRadius: 2.0, 
          spreadRadius: 2.0, 
          offset: const Offset(0.0, 1.0,)
            ),
           
          ],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 95,width: Helper.getScreenWidth(context),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                          color: Color.fromARGB(255, 223, 223, 223)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   const SizedBox(
                                    width: 250,
                                    child: Text('Sardar jii ke Mashoor Chhole Bhature',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 20,width: 74,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(4)
                                      ),
                                      child:  const Center(child: Text('DELIVERED',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),)),
                                    ),
                                    const SizedBox(height: 10,),
                                     const Text('VIEW DETAILS',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),),
                                
                                  ],
                                ),
                                ],
                              ),
                            ),
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 6),
                               child: Row(
                                children: [
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                     children: const [
                                       Text('Bhairahawa, Bank Road',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                    SizedBox(height: 10,),
                                     Text('13 Jan 2023 at 6:00 PM',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),), 
                                     ],
                                   ),
                                   const Spacer(),
                                    const Text('Track My Order',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.red),),
                                    const Icon(Icons.arrow_drop_down,color: Colors.red,size: 18,)
                                ],
                               ),
                             )
                          ],
                        ),
                      ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          const SizedBox(height: 9,),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 6),
                             child: Row(
                               children: const [
                                Icon(Icons.square,color: Colors.green,size: 15,),
                                 Text('Double Burger 1 x 100 = 100',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                               ],
                             ),
                           ),
                           const SizedBox(height: 9,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Row(
                               children: const [
                                Icon(Icons.square,color: Colors.green,size: 15,),
                                 Text('Double Burger 1 x 100 = 100',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                               ],
                                                     ),
                            ),
                           const SizedBox(height: 9,),
                           const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                             child: Text('Seen More...',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                           ), 
                       
                         ],
                       ),
                       const Divider(thickness: 1,color: Color.fromARGB(255, 126, 125, 125),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                               children: [
                                const Icon(Icons.location_pin,color: Colors.grey,size: 15,),
                                const SizedBox(width: 5,),
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                   children: const [
                                     Text('Bhairahwa , Bank Road Rupandehi',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                 SizedBox(height: 5,),
                                  Text('GC44XX Siddharthnagar Nepal',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                   ],
                                 ),
                                 const Spacer(),
                               const Text('\$250.79',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                               ],
                             ),
                    ),
                           const Divider(thickness: 1,color: Color.fromARGB(255, 126, 125, 125),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        children: [
                          Container(
                                            height: 22,width: 167,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 252, 206, 221),
                                              borderRadius: BorderRadius.circular(4)
                                            ),
                                            child:  const Center(child: Text('Deliverd by Rider Rakesh Sharma',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),)),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 22,width: 68,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 252, 206, 221),
                                              borderRadius: BorderRadius.circular(4)
                                            ),
                                            child:  Center(child:   Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
        
                                              children: [
                                                RatingBar.builder(
                    itemSize: 10,
           initialRating: 3,
           minRating: 1,
           direction: Axis.horizontal,
           allowHalfRating: true,
           itemCount: 5,
           itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
           itemBuilder: (context, _) => const Icon(
             Icons.star,size: 10,
             color: Colors.orange,
           ),
           onRatingUpdate: (rating) {
             print(rating);
           },
              ),
              const Text('SEE MORE',style: TextStyle(fontSize: 4,fontWeight: FontWeight.w600,color: Colors.black),)
                                              ],
                                            ),),
                                          ),
                                          
                        ],
                      ),
                    ),
                    ],
                  ),
                 ),
                 const SizedBox(height: 14,),
                 GestureDetector(
                  onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GenieOrderDetails(title: '')),
                      );
                  },
                   child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 260,width: Helper.getScreenWidth(context),
                    decoration: BoxDecoration(
                       color: Colors.white,
                       boxShadow: [
                             BoxShadow(
                                color: Colors.grey.withOpacity(.4),
                                // blurRadius: 2.0, 
                           spreadRadius: 2.0, 
                           offset: const Offset(0.0, 1.0,)
                             ),
                            
                           ],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 95,width: Helper.getScreenWidth(context),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                            color: Color.fromARGB(255, 223, 223, 223)
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     const SizedBox(
                                      width: 250,
                                      child: Text('Food Items',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,width: 74,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(4)
                                        ),
                                        child:  const Center(child: Text('DELIVERED',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),)),
                                      ),
                                      const SizedBox(height: 5,),
                                       const Text('VIEW DETAILS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.grey),),
                                  
                                    ],
                                  ),
                                  ],
                                ),
                              ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 6),
                                 child: Row(
                                  children: [
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: const [
                                         Text('My Role : Receiver',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                                      SizedBox(height: 10,),
                                       Text('13 Jan 2023 at 6:00 PM',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),), 
                                       ],
                                     ),
                                     const Spacer(),
                                      const Text('Track My Order',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.red),),
                                      const Icon(Icons.arrow_drop_down,color: Colors.red,size: 18,)
                                  ],
                                 ),
                               )
                            ],
                          ),
                        ),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            const SizedBox(height: 9,),
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 6),
                               child: Row(
                                 children: [
                                   const Text('Pickup Detail :',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                         SizedBox(width: 1.h,),
                           const Text('City, Street, Landmark,Others',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),      
                                 ],
                               ),
                             ),
                             const SizedBox(height: 9,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Row(
                                 children: [
                                   const Text('Pickup Detail :',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                         SizedBox(width: 1.h,),
                           const Text('City, Street, Landmark,Others',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
                                 ],
                                                       ),
                              ),
                             const SizedBox(height: 9,),
                             const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22),
                               child: Text('Seen More...',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                             ), 
                         
                           ],
                         ),
                         const Divider(thickness: 1,color: Color.fromARGB(255, 126, 125, 125),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                                 children: [
                                  const SizedBox(width: 5,),
                                  const Text('Service Charge',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                 SizedBox(width: 2.h,),
                                   Container(color: Colors.black,
                                    height: 2.h,width: 1.5,
                                   ),
                                   SizedBox(width: 2.h,),
                                   const Text('5 KM',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                  const Spacer(),
                                 const Text('\$250.79',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                 ],
                               ),
                      ),
                             const Divider(thickness: 1,color: Color.fromARGB(255, 126, 125, 125),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          children: [
                            Container(
                                              height: 22,width: 167,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 252, 206, 221),
                                                borderRadius: BorderRadius.circular(4)
                                              ),
                                              child:  const Center(child: Text('Deliverd by Rider Rakesh Sharma',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),)),
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 22,width: 68,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 252, 206, 221),
                                                borderRadius: BorderRadius.circular(4)
                                              ),
                                              child:  Center(child:   Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                         
                                                children: [
                                                  RatingBar.builder(
                      itemSize: 10,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,size: 10,
                              color: Colors.orange,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                               ),
                               const Text('SEE MORE',style: TextStyle(fontSize: 4,fontWeight: FontWeight.w600,color: Colors.black),)
                                                ],
                                              ),),
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
        ),
      ),
    );
  }
}