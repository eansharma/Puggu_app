import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pugau/Users/Screens/Order/Order_status.dart';
import 'package:pugau/Users/Screens/Order/order_summry.dart';
import 'package:pugau/Users/Screens/Location/tracking_location.dart';
import 'package:pugau/util/Helper/helper.dart';

class PlaceOnOrder extends StatefulWidget {
  const PlaceOnOrder({super.key, required String title});

  @override
  State<PlaceOnOrder> createState() => _PlaceOnOrderState();
}

class _PlaceOnOrderState extends State<PlaceOnOrder> {
   success()
   {
      AwesomeDialog(
          dismissOnTouchOutside: true,
                      context: context,
                      dialogType: DialogType.success,
                      headerAnimationLoop: true,
                      animType: AnimType.bottomSlide,
                      //title: 'Password Reset',
                      desc: 'YOUR ORDER HAS BEEN PLACED SUCCESSFULLY',
                      reverseBtnOrder: true,
                     
                             ).show();
   }
  @override
  void initState() {
    super.initState();
    
    
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) => success());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 147,
                color: Colors.green,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          const Text(
                            'My Address',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Cancel Order 1:59',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'ORDER ID :',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ' 123456778909',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const Text(
                      'Order Placed at 6:00 PM',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderStatus(title: '')),
                      );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Column(
                            children: const [
                              Text(
                                'PENDING',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'VIEW MORE',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Column(
                          children: const [
                            Text(
                              'Food preparation will begin shortly & deliver soon',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.refresh,
                        size: 25,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'We  recycle and more plastic than used in our\n orders',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.close,
                        size: 20,
                        color: Color.fromARGB(255, 83, 82, 82),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                 onTap: () {
                         Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TrackingLocationScreen(title: '')),
                      );
                      },
                child: Container(
                  height: 210,
                  width: Helper.getScreenWidth(context),
                  color: const Color(0xFFE5DAB2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TrackingLocationScreen(title: '')),
                        );
                        },
                        child: const Icon(
                          Icons.location_pin,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/google.png"))),
                          ),
                          const Spacer(),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.location_searching,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_city_outlined,
                          size: 25,
                          color: Color.fromARGB(255, 247, 114, 105),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Karnavati Fast Food ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              'Bhairhwa Bank road ',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 100, 99, 99),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: Helper.getScreenWidth(context) / 1.5,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Order is Ready to Pick',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 151, 151, 151))),
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Icon(
                                    Icons.call,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Image(
                                  image: AssetImage('assets/images/send.png')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const Image(
                            image: AssetImage(
                                'assets/images/deliverypartner.png')),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'I am Ramesh , Your delivery partner ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              'Bhairhwa Bank road ',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 100, 99, 99),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: Helper.getScreenWidth(context) / 1.5,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Order is Ready to Pick',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 151, 151, 151))),
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Icon(
                                    Icons.call,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Image(
                                  image: AssetImage('assets/images/send.png')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const Image(
                            image: AssetImage(
                                'assets/images/deliverypartner.png')),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Helper.getScreenWidth(context) / 1.3,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    
                                   BlinkText(
	'Pugau rider will assign soon...loading animation',
	style: TextStyle(fontSize: 12.0, color: Colors.redAccent),
	beginColor: Colors.white,
	endColor: Colors.red,
	times: 100,
	duration: Duration(seconds: 1)
),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1, color: Color.fromARGB(255, 201, 199, 199))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.square,
                            color: Colors.green,
                            size: 10,
                          ),
                          Text(
                            'Vada Pav 1x100=100',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 160, 159, 159),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: const [
                          Icon(
                            Icons.square,
                            color: Colors.green,
                            size: 10,
                          ),
                          Text(
                            'Vada Pav 1x100=100',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 160, 159, 159),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '+1 More',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 160, 159, 159),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderSummary(title: '')),
                      );
                        },
                        child: const Center(
                          child: Text(
                            'View Order Summary',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Image(
                                image: AssetImage(
                                    'assets/images/deliverypartner.png')),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 const Text(
                              'Hardik | 123456789',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                             Row(
                               children: const [
                                 Text(
                                  'Add Alternet Contact',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                  ),
                            ),
                            Icon(Icons.arrow_right,color: Colors.red,size: 15,)
                               ],
                             ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                         Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/location1.png'),height: 15,),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 const Text(
                              'Delivery Address',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                             const Text(
                              'Bhairahwa Gallamandi Rupandehi map address',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                             Row(
                               children: const [
                                 Text(
                                  'Change Address',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                  ),
                            ),
                            Icon(Icons.arrow_right,color: Colors.red,size: 15,)
                               ],
                             ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                         Row(
                          children: [
                            const Image(
                                image: AssetImage(
                                    'assets/images/question.png')),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 const Text(
                              'Need help & support ?',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                             Row(
                               children: const [
                                 Text(
                                  'call in oagau office 9826490661',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                  ),
                            ),
                            Icon(Icons.arrow_right,color: Colors.red,size: 15,)
                               ],
                             ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                     Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/emoji.png'),height: 15,),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                      'Do you like our services ?',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                ),
                                Text(
                                  'Do rate us on playstore',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 134, 134, 134),
                                  ),
                            ),
                              ],
                            ),
                            const SizedBox(width: 10,),
                             Container(
                              width: Helper.getScreenWidth(context) / 5.5,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Not Now',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 99, 98, 98),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                             Container(
                              width: Helper.getScreenWidth(context) / 3.5,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Rate Pagau App',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                  ],
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
