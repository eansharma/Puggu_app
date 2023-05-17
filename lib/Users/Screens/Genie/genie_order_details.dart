import 'package:flutter/material.dart';
import 'package:pugau/Users/Screens/Order/place_on_order.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swipe_button_widget/swipe_button_widget.dart';

import '../../../util/Helper/helper.dart';
import '../Order/Order_status.dart';
import '../review/Widget/complaint_feedback.dart';

class GenieOrderDetails extends StatefulWidget {
  const GenieOrderDetails({super.key, required String title});

  @override
  State<GenieOrderDetails> createState() => _GenieOrderDetailsState();
}

class _GenieOrderDetailsState extends State<GenieOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  SizedBox(
        height: 10.h,
        child: Column(
          children: [
            SwipeButtonWidget(
                acceptPoitTransition: 0.7,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color.fromRGBO(197, 197, 197, 0.25),
                    spreadRadius: 1.5,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                colorBeforeSwipe: Colors.green,
                colorAfterSwiped: Colors.green,
                height: 45,
                childBeforeSwipe: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  width: 50,
                  height: 30,
                  child: const Center(
                    child: Text(
                      '>>',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
                childAfterSwiped: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  width: 50,
                  height: 30,
                  child: const Center(
                    child: Text(
                      '>>',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
                leftChildren: const [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ORDER DELIVERED',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )
                ],
                rightChildren: const [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Order Accepted',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )
                ],
                onHorizontalDragUpdate: (e) {},
                onHorizontalDragRight: (e) {
                  return areYouSureDialog(context);
                },
                onHorizontalDragleft: (e) async {
                  return false;
                }
                ),
           
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h,),
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
                                      child: Text('Gift Items',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)),
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
                              // Divider(thickness: 1,color: Colors.red,)
                            ],
                          ),
                        ),
                       
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 16.h,width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              shape: BoxShape.circle
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.person,size: 18,),
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Text('Tanishi Bansal ',style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black
                                        ),),
                                        Container(height: 3.h,width: 1.5,color: Colors.black,),
                                         const Text(' Giver',style: TextStyle(
                                      fontSize: 12,fontWeight: FontWeight.w500,color: Colors.green
                                    ),),
                                ],
                              ),
                                    SizedBox(height: 0.5.h,),
                                     const Text('Rating 0.0',style: TextStyle(
                                      fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black
                                    ),),
                            ],
                          ),
                          const Spacer(),
                         const Icon(Icons.keyboard_arrow_up,size: 25,),
                        ],
                      ),
                       const Divider(thickness: 1,),
                        Row(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('City, Street, Landmark other',style: TextStyle(
                                          fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black
                                        ),),
                                        SizedBox(height: 0.5.h,),
                                         const Text('Delivery Time: JAN 12 2022 5:30 PM',style: TextStyle(
                                          fontSize: 10,fontWeight: FontWeight.w400,color: Colors.black
                                        ),),
                                ],
                              ),
                              const Spacer(),
                             // Icon(Icons.keyboard_arrow_up,size: 25,),
                             const Icon(Icons.location_searching,size: 25,color: Colors.blue,),
                             SizedBox(width: 2.h,),
                             const Icon(Icons.call,size: 25,color: Colors.blue,),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 16.h,width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              shape: BoxShape.circle
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.person,size: 18,),
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Tanishi Bansal',style: TextStyle(
                                      fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black
                                    ),),
                                    SizedBox(height: 0.5.h,),
                                     const Text('Rating 0.0',style: TextStyle(
                                      fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black
                                    ),),
                            ],
                          ),
                          const Spacer(),
                          
                         const Icon(Icons.keyboard_arrow_up,size: 25,),
                        ],
                      ),
                       const Divider(thickness: 1,),
                        Row(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('City, Street, Landmark other',style: TextStyle(
                                          fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black
                                        ),),
                                        SizedBox(height: 0.5.h,),
                                         const Text('Delivery Time: JAN 12 2022 5:30 PM',style: TextStyle(
                                          fontSize: 10,fontWeight: FontWeight.w400,color: Colors.black
                                        ),),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.location_searching,size: 25,color: Colors.blue,),
                             SizedBox(width: 2.h,),
                              const Icon(Icons.call,size: 25,color: Colors.blue,),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          
           SizedBox(height: 2.h,),
            Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          Container(height: 1.5,width: Helper.getScreenWidth(context)/3.4,
                          color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                          const SizedBox(width: 5,),
                           const Text('ORDER DETAILS',textAlign: TextAlign.center, 
                           style: TextStyle( color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500)),
                               const SizedBox(width: 5,),
                        Container(height: 1.5,width: Helper.getScreenWidth(context)/3.4,
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
                                const Text('Type',style: TextStyle(fontSize:12,fontWeight: FontWeight.w500,color: Colors.black),),
                                const SizedBox(height: 5,),
                                const Text('Documents',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                             SizedBox(height: 1.h,),
                             const Text('Note',style: TextStyle(fontSize:12,fontWeight: FontWeight.w500,color: Colors.black),),
                                const SizedBox(height: 5,),
                                const Text('Menu Discription',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),)
                              ],
                            ),
                                     const Spacer(),
                                     Container(
                                      height: 70,width:110 ,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: const DecorationImage(image: AssetImage('assets/images/imge.png'),fit: BoxFit.cover)
                                      ),
                                     ),
                                     
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
                                  Text('Item Total',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                                Spacer(),
                                Text('₹430',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                                ],
                              ),
                              const SizedBox(height: 8,),
                               Row(
                                children: const [
                                  Text('Coupen(WELCOME)',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.blue),),
                                Spacer(),
                                Text('You Saved ₹60',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.blue),),
                                ],
                              ),
                              const SizedBox(height: 8,),
                               Row(
                                children: const [
                                  Text('Texes',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
                                Spacer(),
                                Text('₹30',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                              const SizedBox(height: 8,),
                               Row(
                                children: const [
                                  Text('Delivery Charge for 1km',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
                                Spacer(),
                                Text('Free',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                              const SizedBox(height: 8,),
                               Row(
                                children: const [
                                  Text('Donetes ₹2 to Feeding India',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
                                Spacer(),
                                Text('₹50',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              const Divider(thickness: 1,),
                               Row(
                                children: const [
                                  Text('Grand Total',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                                Spacer(),
                                Text('₹440',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h,),
                         Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          Container(height: 1.5,width: Helper.getScreenWidth(context)/3.4,
                          color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                          const SizedBox(width: 5,),
                           const Text('ORDER DETAILS',textAlign: TextAlign.center, 
                           style: TextStyle( color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500)),
                               const SizedBox(width: 5,),
                        Container(height: 1.5,width: Helper.getScreenWidth(context)/3.4,
                        color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                         ],
                       ),
                     ), 
                     SizedBox(height: 2.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text('Order Id',style: TextStyle(
                                                  fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black
                                                ),),
                                                SizedBox(height: 0.5.h,),
                                                 const Text('123456789',style: TextStyle(
                                                  fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black
                                                ),),
                                        ],
                                      ),
                                      SizedBox(height: 1.5.h,),
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text('Payment',style: TextStyle(
                                                  fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black
                                                ),),
                                                SizedBox(height: 0.5.h,),
                                                 const Text('Paid : Using UPI',style: TextStyle(
                                                  fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black
                                                ),),
                                        ],
                                      ),
                                      SizedBox(height: 1.5.h,),
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text('Order By',style: TextStyle(
                                                  fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black
                                                ),),
                                                SizedBox(height: 0.5.h,),
                                                 const Text('Kishor Saha',style: TextStyle(
                                                  fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black
                                                ),),
                                        ],
                                      ),
                                      SizedBox(height: 1.5.h,),
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text('Phone Number',style: TextStyle(
                                                  fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black
                                                ),),
                                                SizedBox(height: 0.5.h,),
                                                 const Text('123456789',style: TextStyle(
                                                  fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black
                                                ),),
                                        ],
                                      ),
                                     
                                      SizedBox(height: 1.5.h,),
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text('Order Time',style: TextStyle(
                                                  fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black
                                                ),),
                                                SizedBox(height: 0.5.h,),
                                                 const Text('April 26,2023 at 5:00pm',style: TextStyle(
                                                  fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black
                                                ),),
                                        ],
                                      ),
                                      
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      
          ],
        ),
      ),
    ])));
  }
  Future<bool> areYouSureDialog(BuildContext context) async {
  bool isActive = false;
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      child: Container(
        color: Colors.white,
        height: 140,
        width: 150,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Are you sure?'),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    isActive = true;
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes'),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    isActive = false;
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  return isActive;
}
}