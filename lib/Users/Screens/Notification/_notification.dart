import 'package:flutter/material.dart';


class Appnotification extends StatefulWidget {
  const Appnotification({super.key});

  @override
  State<Appnotification> createState() => _AppnotificationState();
}

class _AppnotificationState extends State<Appnotification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                 GestureDetector(onTap: () {
                               Navigator.pop(context);
                             },
                             child: const Icon(Icons.arrow_back_ios,size: 18,),
                             ),
                                        const Text('Notifications',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),)     
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 6),
             child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1.5,color:const Color.fromARGB(255, 197, 193, 193))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                     Text('Your order is',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                               Text('CONFIRMED',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.blueAccent),),     
                                   Text('and deliver in',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                                  Text('30 MINUTES',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.blueAccent),),
                                  ],
                                ),
                                const SizedBox(height: 5,),
                                 Row(
                                   children: const [
                                     Text('Restaurent:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),
                                  SizedBox(width: 5,),
                                   Text('The Burger House & Crunchey Fried Chicken',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 177, 176, 176)),),
                                   ],
                                 ),
                                 const SizedBox(height: 5,),
                                  const Text('JAN 26 2023 SUNDAY 05:00 PM',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),
                              ],
                            ),
                          ),
                        ),
           )   
          ],
        ),
      ),
    );
  }
}