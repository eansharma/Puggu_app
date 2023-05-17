import 'package:flutter/material.dart';
import 'package:pugau/Users/Screens/task_add.dart';

import '../../util/Helper/helper.dart';

class SetYourTask extends StatefulWidget {
  const SetYourTask({super.key, required String title});

  @override
  State<SetYourTask> createState() => _SetYourTaskState();
}

class _SetYourTaskState extends State<SetYourTask> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1.5,
                width: Helper.getScreenWidth(context) / 3,
                color: const Color.fromARGB(255, 153, 153, 153),
                padding: const EdgeInsets.only(
                  top: 2,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text('SET YOUR TASK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                width: 5,
              ),
              Container(
                  height: 1.5,
                  width: Helper.getScreenWidth(context) / 3,
                  color: const Color.fromARGB(255, 153, 153, 153),
                  padding: const EdgeInsets.only(
                    top: 2,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Container(
                  height: 117,
                  width: Helper.getScreenWidth(context),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: Helper.getScreenWidth(context) / 2.3,
                        child: const Text(
                            'Sending high value / fragile items is not recommended',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/geniepicup.png'))),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 23,
                    child: Container(
                      height: Helper.getScreenHeight(context)/7.5,
                      width: Helper.getScreenWidth(context) / 1.15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1,color: const Color.fromARGB(255, 141, 140, 140)),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                      
                                    ),
                                     child: const Padding(
                                       padding: EdgeInsets.all(5.0),
                                       child: Text('A',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)),
                                     ),
                                   ),
                                   const SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('Pick Up From',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 180, 180, 180),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500)),
                                              Text('Choose Pickup Address',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)),
                                              Text('Test kiraby Delhi, contoment New Delhi',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 180, 180, 180),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                          const Spacer(),
                                  const Icon(
                                    Icons.arrow_right,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ],
                              ),
                              const Divider(thickness: 1,),
                               Row(
                                 children: [
                                   const Icon(
                                    Icons.call_outlined,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                     children: const [
                                       Text('User Name',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w500)),
                                      Text('982445899',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500)),
                                     ],
                                   ),
                                 ],
                               ),
                                            
 
                            ],
                          ),
                        ),
                      ),
                    ),)
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: Container(
                        height: Helper.getScreenHeight(context)/7.5,
                        width: Helper.getScreenWidth(context) / 1.15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1,color: const Color.fromARGB(255, 141, 140, 140)),
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                     Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                        
                                      ),
                                       child: const Padding(
                                         padding: EdgeInsets.all(5.0),
                                         child: Text('B',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                       ),
                                     ),
                                     const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text('Drop',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 180, 180, 180),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500)),
                                                Text('Others',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                                Text('Test kiraby Delhi, contoment New Delhi',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 180, 180, 180),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                            const Spacer(),
                                    const Icon(
                                      Icons.arrow_right,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ],
                                ),
                                const Divider(thickness: 1,),
                                 Row(
                                   children: [
                                     const Icon(
                                      Icons.call_outlined,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: const [
                                         Text('User Name',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w500)),
                                        Text('982445899',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500)),
                                       ],
                                     ),
                                   ],
                                 ),
                                              
           
                              ],
                            ),
                          ),
                        ),
                      ),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const TaskAdd (title: '',)),
               );
            },
            child: Center(
              child: Container(
                          height: 46,
                          width: Helper.getScreenWidth(context) / 1.15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1,color: Colors.red),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                   Icon(
                                  Icons.edit_document,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                   SizedBox(width: 10,),
                                  Text('Add task details',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 121, 120, 120),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                               Spacer(),
                               Icon(
                                  Icons.add_circle,
                                  color: Colors.orange,
                                  size: 18,
                                ),
                                ],
                              ),
                            ),
                          ),
                        ),
            ),
          ),
        ]),
      ),
    );
  }
}