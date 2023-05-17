import 'package:flutter/material.dart';
import 'package:pugau/Users/Screens/Order/place_on_order.dart';
import '../../../util/Helper/helper.dart';


class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key, required this.title});
   final String title;
  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  int _index=0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                          //      Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const AddDeliveryReview(title: '')),
                          // );
                            },
                             child: const Text('Call Support ',textAlign: TextAlign.center, 
                                 style: TextStyle( color: Colors.red,fontSize: 9,fontWeight: FontWeight.w500)),
                           ),
                       ],
                     ),
                   ),
                     Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                            Container(height: 1.5,width: Helper.getScreenWidth(context)/3,
                            color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                            const SizedBox(width: 5,),
                             const Text('ORDER STATUS',textAlign: TextAlign.center, 
                             style: TextStyle( color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600)),
                                 const SizedBox(width: 5,),
                          Container(height: 1.5,width: Helper.getScreenWidth(context)/3,
                          color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                           ],
                         ),
                       ), 
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                          children: [
                            const Spacer(),
                             GestureDetector(
                                          onTap: () {
                                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlaceOnOrder(title: '')),
                                             );
                                          },
                                          child: const Text('Track My Order',style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500,color: Colors.red),)),
                                        const Icon(Icons.arrow_drop_down,color: Colors.red,size: 18,)
                          ],
                         ),
                       ),
              Stepper(
                physics: const ClampingScrollPhysics(),
              currentStep: _index,
              onStepCancel: () {
                if (_index > 0) {
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              onStepContinue: () {
                if (_index <= 0) {
                  setState(() {
                    _index += 1;
                  });
                }
              },
              onStepTapped: (int index) {
                setState(() {
                  _index = index;
                });
              },
              steps: <Step>[
                Step(
                  title: Row(
                    children: [
                      Container(
                        color: _index==0?const Color(0xffCECECE):const Color(0xffA6FF97),
                        height: 30,width: 200,
                        child: const Center(child: Text('YOUR ORDER IS CONFURMED',style: TextStyle(
                          fontSize: 10
                        ),)),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7,color:const Color(0xffCECECE) ),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('MANAGER',style: TextStyle(
                              fontSize: 9,color: Colors.blue
                            ),),
                        ),
                      )
                    ],
                  ),
                  content:const Text('') ,
                ),
                 Step(
                  title: Row(
                    children: [
                      Container(
                        color: _index==1? const Color(0xffCECECE):const Color(0xffA6FF97),
                        height: 30,width: 200,
                        child: const Center(child: Text('YOUR ORDER IS KITCHEN(EXT TIME: 20MINUTE)',style: TextStyle(
                          fontSize: 10
                        ),)),
                      ),
                       const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7,color:const Color(0xffCECECE) ),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('SELLER',style: TextStyle(
                              fontSize: 9,color: Colors.blue
                            ),),
                        ),
                      )
                    ],
                  ),
                  content: const Text('1'),
                ),
                 Step(
                  title: Row(
                    children: [
                      Container(
                        color: _index==2?const Color(0xffCECECE):const Color(0xffA6FF97),
                        height: 30,width: 200,
                         child: const Center(child: Text('YOUR ORDER READY FOR PICKUP',style: TextStyle(
                          fontSize: 10
                        ),)),
                      ),
                       const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7,color:const Color(0xffCECECE) ),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('SELLER',style: TextStyle(
                              fontSize: 9,color: Colors.blue
                            ),),
                        ),
                      )
                    ],
                  ),
                  content: const Text('2'),
                ),
                 Step(
                  title: Row(
                    children: [
                      Container(
                        color: _index==3?const Color(0xffCECECE):const Color(0xffA6FF97),
                        height: 30,width: 200,
                         child: const Center(child: Text('YOUR ORDER PICKED BY RIDER',style: TextStyle(
                          fontSize: 10
                        ),)),
                      ),
                       const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7,color:const Color(0xffCECECE) ),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('RIDER',style: TextStyle(
                              fontSize: 9,color: Colors.blue
                            ),),
                        ),
                      )
                    ],
                  ),
                  content: const Text('3'),
                ),
                 Step(
                  title: Row(
                    children: [
                      Container(
                        color: _index==4?const Color(0xffCECECE):const Color(0xffA6FF97),
                        height: 30,width: 200,
                         child: const Center(child: Text('RIDER ON THE WAY FOR DELIVERY',style: TextStyle(
                          fontSize: 10
                        ),)),
                      ),
                       const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7,color:const Color(0xffCECECE) ),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('RIDER',style: TextStyle(
                              fontSize: 9,color: Colors.blue
                            ),),
                        ),
                      )
                    ],
                  ),
                  content: const Text('4'),
                ),
                 Step(
                  title: Row(
                    children: [
                      Container(
                        color: _index==5?const Color(0xffCECECE):const Color(0xffA6FF97),
                        height: 30,width: 200,
                         child: const Center(child: Text('RECHED YOUR DELIVERY LOCATION',style: TextStyle(
                          fontSize: 10
                        ),)),
                      ),
                       const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7,color:const Color(0xffCECECE) ),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('RIDER',style: TextStyle(
                              fontSize: 9,color: Colors.blue
                            ),),
                        ),
                      )
                    ],
                  ),
                  content: const Text('5'),
                ),
                 Step(
                  title: Row(
                    children: [
                      Container(
                        color: _index==6?const Color(0xffCECECE):const Color(0xffA6FF97),
                        height: 30,width: 200,
                         child: const Center(child: Text('YOUR ORDER HAS BEEN DELIVERED',style: TextStyle(
                          fontSize: 10
                        ),)),
                      ),
                       const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7,color:const Color(0xffCECECE) ),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('RIDER',style: TextStyle(
                              fontSize: 9,color: Colors.blue
                            ),),
                        ),
                      )
                    ],
                  ),
                  content: const Text('6'),
                ),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}