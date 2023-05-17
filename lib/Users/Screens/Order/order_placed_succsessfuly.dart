
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:pugau/Users/Screens/Order/place_on_order.dart';


class OrderPlacedSuccsessfuly extends StatefulWidget {
  const OrderPlacedSuccsessfuly({super.key, required String title});

  @override
  State<OrderPlacedSuccsessfuly> createState() => _OrderPlacedSuccsessfulyState();
}

class _OrderPlacedSuccsessfulyState extends State<OrderPlacedSuccsessfuly> {
 
  void success(){
   AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      headerAnimationLoop: true,
                      animType: AnimType.bottomSlide,
                      title: 'YOUR ORDER HAS BEEN PLACED SUCCESSFULLY',
                      reverseBtnOrder: true,
                     
                             ).show(); 
                              Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const PlaceOnOrder(title: '',)),
  ); 
  }
  @override
  Widget build(BuildContext context) {
    success();
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
      ),
    );
  }
}