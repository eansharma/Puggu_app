import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Screens/Location/select_location.dart';

import '../../util/Helper/helper.dart';
import '../Controller/my_address_controller.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({super.key, required String title});

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  MyAddressListController myAddressListController =
  Get.put(MyAddressListController());


  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                    ),
                    Text(
                      'My Address',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Spacer(),
                     InkWell(
                      onTap: () {

                         Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => SelectLocation  (title: '',)),
                 );
                      },
                       child: Row(
                         children: const [
                          Icon(Icons.add,color: Colors.red,size: 12,),
                           Text(
                            'Add Address',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                                       ),
                         ],
                       ),
                     )
                  ],
                ),
              ),
              const Divider(thickness: 1,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
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
                              child: Center(
                                child:Obx((){
                                  return  myAddressListController.list.length>0? Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: myAddressListController.list.length,
                                      separatorBuilder: (context, index) =>   const Divider(thickness: 1,),
                                      itemBuilder: (context, index) {
                                        return    Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.home,size: 18,),
                                            const SizedBox(width: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:  [
                                                 Text('Home',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500)),
                                                // City
                                                myAddressListController.list[index].city!=null?
                                                Row(
                                                  children:  [
                                                    Text('City :',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w500)),
                                                    Text('${myAddressListController.list[index].city}',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 180, 180, 180),
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w500)),
                                                  ],
                                                ):Container(),

                                                // Full Address

                                                Row(
                                                  children: [


                                                    Text('Full Address :',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w500)),


                                                    Text('${myAddressListController.list[index].streetAddress}',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 180, 180, 180),
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w500)),
                                                  ],
                                                ),
                                                // Map Address
                                                Row(
                                                  children: [
                                                    Text('Map Address :',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w500)),
                                                    Text(myAddressListController.list[index].address.toString(),
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 180, 180, 180),
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w500)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: [
                                                const SizedBox(height: 5,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(width: 1,color: const Color.fromARGB(255, 119, 118, 118))
                                                  ),
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(3.0),
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.red,
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },

                                    ),
                                  ):Container(child: Text("No Address Added"),);
                                }),
                              ),
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
