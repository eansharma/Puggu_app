import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:pugau/widget/customSnakebar.dart';

import '../../Controller/rate_delivery_partner.dart';
import '../Order/order.dart';

class AddDeliveryReview extends StatefulWidget {
  String rider_id,order_id;
  AddDeliveryReview({required this.rider_id,required this.order_id});

  @override
  State<AddDeliveryReview> createState() => _AddDeliveryReviewState();
}
class _AddDeliveryReviewState extends State<AddDeliveryReview> {

  RateDeliveryController  rateDeliveryController = Get.put(RateDeliveryController());
  @override
  int? rate;
  TextEditingController comment=TextEditingController();
  Widget build(BuildContext context) {
    return GetBuilder<RateDeliveryController>(builder: (rating){
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      GestureDetector(onTap: () {
                        Navigator.pop(context);
                      },
                        child: Icon(Icons.arrow_back_ios,size: 18,),
                      ),
                      Text('Add Review',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rate Your Delivery Partner',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Container(
                          height: 20,
                          child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index) {
                                return InkWell(
                                  onTap: (){
                                    setState(() {
                                      rate=index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: index==0?0:5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(width: 1, color: Colors.black)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(index.toString(), textAlign: TextAlign.center,
                                                style: TextStyle(color: Color.fromARGB(
                                                    255, 160, 159, 159),
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w500)),
                                          ),
                                          Icon(Icons.star,
                                            color: Color.fromARGB(255, 160, 159, 159),
                                            size: 10,)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(4),
                      //         border: Border.all(width: 1,color: Colors.black)
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                      //         child: Row(
                      //           children: [
                      //              Container(
                      //                    child: const Text('1',textAlign: TextAlign.center,
                      //                                style: TextStyle( color: Color.fromARGB(255, 160, 159, 159),fontSize: 9,fontWeight: FontWeight.w500)),
                      //                  ),
                      //                  const Icon(Icons.star,color:Color.fromARGB(255, 160, 159, 159),size: 10,)
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 7,),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(4),
                      //         border: Border.all(width: 1,color: Colors.black)
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                      //         child: Row(
                      //           children: [
                      //              Container(
                      //                    child: const Text('2',textAlign: TextAlign.center,
                      //                                style: TextStyle( color: Color.fromARGB(255, 160, 159, 159),fontSize: 9,fontWeight: FontWeight.w500)),
                      //                  ),
                      //                  const Icon(Icons.star,color:Color.fromARGB(255, 160, 159, 159),size: 10,)
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 7,),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(4),
                      //         border: Border.all(width: 1,color: Colors.black)
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                      //         child: Row(
                      //           children: [
                      //              Container(
                      //                    child: const Text('3',textAlign: TextAlign.center,
                      //                                style: TextStyle( color: Color.fromARGB(255, 160, 159, 159),fontSize: 9,fontWeight: FontWeight.w500)),
                      //                  ),
                      //                  const Icon(Icons.star,color:Color.fromARGB(255, 160, 159, 159),size: 10,)
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 7,),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(4),
                      //         border: Border.all(width: 1,color: Colors.black)
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                      //         child: Row(
                      //           children: [
                      //              Container(
                      //                    child: const Text('4',textAlign: TextAlign.center,
                      //                                style: TextStyle( color: Color.fromARGB(255, 160, 159, 159),fontSize: 9,fontWeight: FontWeight.w500)),
                      //                  ),
                      //                  const Icon(Icons.star,color:Color.fromARGB(255, 160, 159, 159),size: 10,)
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 20),
                      Container(
                        child: Text('Share your experience with us',textAlign: TextAlign.center,
                            style: TextStyle( color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(height: 5),

                      Container(
                          child: TextFormField(
                            maxLines: 5,
                            minLines: 5,
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.start,
                            controller: comment,
                            textAlignVertical: TextAlignVertical.top,
                            style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(color: Color.fromARGB(255, 153, 153, 153),width: 1)
                                //<-- SEE HERE
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(color: Color.fromARGB(255, 153, 153, 153),width: 1)

                                //<-- SEE HERE
                              ),
                            ),
                          )),
                      SizedBox(height: 10,),
                      Center(
                        child: MaterialButton(minWidth: MediaQuery.of(context).size.width,

                          height: MediaQuery.of(context).size.height/21,
                          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7),),
                          textColor: Colors.black,
                          color: Colors.green,
                          onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Order(title: '',)),
                              );

                            rating.rateDelivary(rate.toString(), widget.rider_id, widget.order_id, comment.text);

                            /* if(rate==0){
                              showCustomSnackBar("Select rating", isError: true);
                            }
                            else if(comment.text.isEmpty){
                              showCustomSnackBar("Comment is Empty", isError: true);
                            }
                            else{
                            }*/
                          }

                          ),
                          child: Center(child: Text('SUBMIT',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),)),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(child: Image(image: AssetImage('assets/images/deliveryreview.png'),fit: BoxFit.cover,height: 270,width: 237,)),
                    const SizedBox(height: 10,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width/1.7,
                        child: const Text('Your rating reviews help people goinga long sway in desingwhat to eat',textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 197, 195, 195)),)),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}