import 'package:flutter/material.dart';
import 'package:pugau/Users/Screens/Order/Order_status.dart';
import 'package:pugau/Users/Screens/review/Widget/complaint_feedback.dart';
import 'package:pugau/Users/Screens/Order/place_on_order.dart';
import 'package:pugau/util/Helper/helper.dart';


class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key, required String title});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                 child: Row(
                   children: [
                     Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11,),
                        child: GestureDetector(onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios,size: 18,),
                        ),
                      ),
                      const Spacer(),
                       GestureDetector(
                        onTap: () {
                           Navigator.pop(
                        context
                        
                      );
                        },
                         child: const Text('View All My Order ',textAlign: TextAlign.center, 
                             style: TextStyle( color: Colors.red,fontSize: 12,fontWeight: FontWeight.w500)),
                       ),
                   ],
                 ),
               ),
                 Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 17),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Container(height: 1.5,width: Helper.getScreenWidth(context)/4,
                        color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                        const SizedBox(width: 5,),
                         const Text('ORDER SUMMARY',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600)),
                             const SizedBox(width: 5,),
                      Container(height: 1.5,width: Helper.getScreenWidth(context)/4,
                      color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                       ],
                     ),
                   ), 
                   const SizedBox(height: 10,),
                   Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                       boxShadow: [
                           BoxShadow(
                              color: Colors.grey.withOpacity(.4),
                        // blurRadius: 2.0, 
                         spreadRadius: 2.0, 
                         offset: const Offset(0.0, 1.0,)
                           ),],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Container(
                          height: 105,width: Helper.getScreenWidth(context),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                            color: Colors.white
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     const SizedBox(
                                      width: 160,
                                      child: Text('Karnavati Fast Food',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderStatus(title: '')),
                      );
                                        },
                                        child: Container(
                                          height: 20,width: 74,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          child:  const Center(child: Text('DELIVERED',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),)),
                                        ),
                                      ),
                                   const SizedBox(height: 5,),
                                    GestureDetector(
                                      onTap: () =>   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ComplaintFeedback(title: '')),
                      ),
                                      child: const Text('View Review',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),))
                                  
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
                                       children: [
                                         const Text('Bhairahawa, Bank Road',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                      const SizedBox(height: 10,),
                                       Row(
                                        children: const [
                                           Text('Call Support',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.red),),
                                      SizedBox(width: 5,),
                                     // Icon(Icons.download,color: Colors.red,size: 12,)
                                        ],
                                       )
                                       ],
                                     ),
                                     const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlaceOnOrder(title: '')),
                      );
                                        },
                                        child: const Text('Track My Order',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.red),)),
                                      const Icon(Icons.arrow_drop_down,color: Colors.red,size: 18,)
                                  ],
                                 ),
                               ),
                               const Divider(thickness: 1,color: Colors.red,)
                            ],
                          ),
                        ),
                        const SizedBox(height: 40,),
                         Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 17),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Container(height: 1.5,width: Helper.getScreenWidth(context)/3.6,
                        color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                        const SizedBox(width: 5,),
                         const Text('ORDER ITEMS',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600)),
                             const SizedBox(width: 5,),
                      Container(height: 1.5,width: Helper.getScreenWidth(context)/3.6,
                      color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                       ],
                     ),
                   ), 
                   const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        children: [
                          Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                 Icon(Icons.square,color: Colors.green,size: 18,),
                                  SizedBox(width: 90,
                                   child: Text('Butter Vada Pav 1 x ₹30',style: TextStyle(fontSize:12,fontWeight: FontWeight.w500,color: Colors.black),)),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Menu Discription Menu Discription Menu Discription',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),),
                              )
                            ],
                          ),
                                   const Spacer(),
                                   Stack(
                                    children: [
                                      Container(
                                       height: 60,width:60 ,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(4),
                                         image: const DecorationImage(image: AssetImage('assets/images/pizza.png'),fit: BoxFit.cover)
                                       ),
                                      ),
                                   Positioned(
                                    bottom: 0,
                                    left: 7,
                                    child: Container(
                                      height: 15,width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(width: 0.5,color: Colors.red)
                                      ),
                                      child: const Center(child: Text('₹30',style: TextStyle(fontSize: 10),)),
                                    )
                                    )
                                    ],
                                   ),
                                   
                        ],
                      ),
                    ),
                    const Divider(thickness: 1,),
                     const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        children: [
                          Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                 Icon(Icons.square,color: Colors.green,size: 18,),
                                  SizedBox(width: 75,
                                   child: Text('Paneer Pizza 1 x ₹30',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),)),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 13),
                                child: Text('Menu Discription Menu Discription Menu Discription',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),),
                              )
                            ],
                          ),
                                   const Spacer(),
                                  const Text('₹30',style: TextStyle(fontSize: 12),)
                        ],
                      ),
                    ),
                    const Divider(thickness: 1,),
                    const SizedBox(height: 15,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 6),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: const [
                           Text('Order Or Cooking Intruction',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.black),),
                           Text('Order Or Cooking Intruction Details Hare',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
                         ],
                       ),
                     ),
                     const Divider(thickness: 1,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Column(
                          children: [
                            const SizedBox(height: 8,),
                            Row(
                              children: const [
                                Text('Item Total',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                              Spacer(),
                              Text('₹430',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                              ],
                            ),
                            const SizedBox(height: 8,),
                             Row(
                              children: const [
                                Text('Coupen(WELCOME)',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.blue),),
                              Spacer(),
                              Text('You Saved ₹60',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.blue),),
                              ],
                            ),
                            const SizedBox(height: 8,),
                             Row(
                              children: const [
                                Text('Texes',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.black),),
                              Spacer(),
                              Text('₹30',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.black),),
                              ],
                            ),
                            const SizedBox(height: 8,),
                             Row(
                              children: const [
                                Text('Delivery Charge for 1km',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.black),),
                              Spacer(),
                              Text('Free',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.black),),
                              ],
                            ),
                            const SizedBox(height: 8,),
                             Row(
                              children: const [
                                Text('Donetes ₹2 to Feeding India',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.black),),
                              Spacer(),
                              Text('₹50',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.black),),
                              ],
                            ),
                            const SizedBox(height: 8,),
                            const Divider(thickness: 1,),
                             Row(
                              children: const [
                                Text('Grand Total',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                              Spacer(),
                              Text('₹440',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ],
                    ),
                   ),
                   const SizedBox(height: 20,),
                    Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 17),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Container(height: 1.5,width: Helper.getScreenWidth(context)/3.7,
                        color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                        const SizedBox(width: 5,),
                         const Text('ORDER DETAILS',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600)),
                             const SizedBox(width: 5,),
                      Container(height: 1.5,width: Helper.getScreenWidth(context)/3.7,
                      color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                       ],
                     ),
                   ),
                   const SizedBox(height: 10,), 
                   Container(
                     margin: const EdgeInsets.symmetric(horizontal: 6),
                     width: Helper.getScreenWidth(context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                       boxShadow: [
                           BoxShadow(
                              color: Colors.grey.withOpacity(.4),
                        // blurRadius: 2.0, 
                         spreadRadius: 2.0, 
                         offset: const Offset(0.0, 1.0,)
                           ),],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text('Order Id',textAlign: TextAlign.center, 
                         style: TextStyle( color: Color.fromARGB(255, 143, 142, 142),fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 4,),
                             Text('43567999',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                             ],
                           ),
                           const SizedBox(height: 10,),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text('Payment',textAlign: TextAlign.center, 
                         style: TextStyle( color: Color.fromARGB(255, 143, 142, 142),fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 4,),
                             Text('Paid: Using Upi',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                             ],
                           ),
                           const SizedBox(height: 10,),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text('Order by',textAlign: TextAlign.center, 
                         style: TextStyle( color: Color.fromARGB(255, 143, 142, 142),fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 4,),
                             Text('Kishor Saha',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                             ],
                           ),
                           const SizedBox(height: 10,),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text('Phone Number',textAlign: TextAlign.center, 
                         style: TextStyle( color: Color.fromARGB(255, 143, 142, 142),fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 4,),
                             Text('43567999',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                             ],
                           ),
                           const SizedBox(height: 10,),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text('Delivery Address',textAlign: TextAlign.center, 
                         style: TextStyle( color: Color.fromARGB(255, 143, 142, 142),fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 4,),
                             Text('City, Street Full Address',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                             ],
                           ),
                           const SizedBox(height: 10,),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text('Call Confirmation',textAlign: TextAlign.center, 
                         style: TextStyle( color: Color.fromARGB(255, 143, 142, 142),fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 4,),
                             Text('Yes',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                             ],
                           ),
                           const SizedBox(height: 10,),
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text('Order Type',textAlign: TextAlign.center, 
                         style: TextStyle( color: Color.fromARGB(255, 143, 142, 142),fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 4,),
                             Text('Delivery',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                             ],
                           ),
                           const SizedBox(height: 10,),
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text('Schedule Delivery',textAlign: TextAlign.center, 
                         style: TextStyle( color: Color.fromARGB(255, 143, 142, 142),fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 4,),
                             Text('April 26,2023 at 5:00 PM',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                             ],
                           ),
                           const SizedBox(height: 10,),
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text('Date & Time',textAlign: TextAlign.center, 
                         style: TextStyle( color: Color.fromARGB(255, 143, 142, 142),fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 4,),
                             Text('April 26,2023 at 5:00 PM',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                             ],
                           ),
                        ],
                      ),
                    ),
                   ),
                   const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}