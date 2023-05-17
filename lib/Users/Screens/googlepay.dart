
import 'package:flutter/material.dart';
import 'package:pugau/Users/Screens/Order/placing_your_order.dart';

import '../../util/Helper/helper.dart';

class GooglePay extends StatefulWidget {
  const GooglePay({super.key, required String title});

  @override
  State<GooglePay> createState() => _GooglePayState();
}

class _GooglePayState extends State<GooglePay> {
 
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1.5,
                  width: Helper.getScreenWidth(context) / 3.8,
                  color: const Color.fromARGB(255, 153, 153, 153),
                  padding: const EdgeInsets.only(
                    top: 2,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('SELECT PAYMENT METHODE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  width: 5,
                ),
                Container(
                    height: 1.5,
                    width: Helper.getScreenWidth(context) / 3.8,
                    color: const Color.fromARGB(255, 153, 153, 153),
                    padding: const EdgeInsets.only(
                      top: 2,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Image(image: AssetImage('assets/images/gpay.png'),height: 20,width: 20,fit: BoxFit.cover,),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Khalti',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,size: 15,)
                      ],
                    ),
                  ),
                   const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
             GestureDetector(
              onTap: () {
                             Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const PlacingYourOrder  (title: '',)),
                                        );
                                        //_placingorder();
              },
               child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Image(image: AssetImage('assets/images/gpay.png'),height: 20,width: 20,fit: BoxFit.cover,),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Esewa',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,size: 15,)
                        ],
                      ),
                    ),
             ),
                   const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Image(image: AssetImage('assets/images/gpay.png'),height: 20,width: 20,fit: BoxFit.cover,),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Cash on Delivery',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,size: 15,)
                      ],
                    ),
                  ),
                   const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
         
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
  //  void _placingorder() {
  //   showModalBottomSheet<void>(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10), topRight: Radius.circular(10))),
  //       context: context,
  //       builder: (BuildContext context) {
  //         return         });
  // }

}
