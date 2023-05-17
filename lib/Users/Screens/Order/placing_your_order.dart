import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pugau/Users/Screens/Order/place_on_order.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlacingYourOrder extends StatefulWidget {
  const PlacingYourOrder({super.key, required String title});

  @override
  State<PlacingYourOrder> createState() => _PlacingYourOrderState();
}

class _PlacingYourOrderState extends State<PlacingYourOrder> {
  double _initeal = 0.0;
  update() {
    Timer.periodic(const Duration(milliseconds: 330), (Timer timer) {
      if (mounted) {
        setState(() {
          if (_initeal > 1) {
            timer.cancel();
            Future.delayed( Duration.zero, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PlaceOnOrder(
                          title: '',
                        )),
              );
            });
          } else {
            _initeal = _initeal + 0.1;
          }
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Placing Your Order',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Image(
                          image: AssetImage('assets/images/geniehome.png'),
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Pay \$84 cash on delivery',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/geniehome.png'),
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Delivery to home',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              'Bhairahawa, Bank Road',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      LinearPercentIndicator(
                        lineHeight: 15,
                        animateFromLastPercent: true,
                        width: 230,
                        barRadius: const Radius.circular(7),
                        progressColor: Colors.green,
                        percent:
                            _initeal > 1 ? 1.0 : _initeal, //meeting me aana
                      ),
                      const Spacer(),
                      const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
