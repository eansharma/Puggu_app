import 'package:flutter/material.dart';

import '../../util/Helper/helper.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key, required String title});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool isOpen=false;
  bool isOpenA=false;
  bool isOpenB=false;
  bool isOpenC=false;
  bool isOpenD=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21,vertical: 10),
                  child: GestureDetector(onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios,size: 18,),
                  ),
                ),
                 Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 6),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                            Container(height: 1.5,width: Helper.getScreenWidth(context)/2.4,
                            color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                            const SizedBox(width: 5,),
                             const Text('FAQ',textAlign: TextAlign.center, 
                             style: TextStyle( color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600)),
                                 const SizedBox(width: 5,),
                          Container(height: 1.5,width: Helper.getScreenWidth(context)/2.4,
                          color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                           ],
                         ),
                       ), 
                       const SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isOpen=!isOpen;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 17),
                                  child: Row(
                                    children: [
                                      const Text('What is FoodyBazar ?',textAlign: TextAlign.center, 
                                           style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                                  const Spacer(),
                                  Icon( isOpen==true? Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_right_outlined,size: 19,)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3,),
                               if(isOpen)
                           Container(
                            margin: const EdgeInsets.symmetric(horizontal: 17),
                             child: const Text('What is FoodyBazar What is FoodyBazar What is FoodyBazar',textAlign: TextAlign.center, 
                                         style: TextStyle( color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500)),
                           ),
                           const Divider(thickness: 1,)
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isOpenA=!isOpenA;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 17),
                                  child: Row(
                                    children: [
                                      const Text('What is FoodyBazar ?',textAlign: TextAlign.center, 
                                           style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                                  const Spacer(),
                                  Icon( isOpenA==true? Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_right_outlined,size: 19,)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3,),
                               if(isOpenA)
                           Container(
                            margin: const EdgeInsets.symmetric(horizontal: 17),
                             child: const Text('What is FoodyBazar What is FoodyBazar What is FoodyBazar',textAlign: TextAlign.center, 
                                         style: TextStyle( color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500)),
                           ),
                           const Divider(thickness: 1,)
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isOpenB=!isOpenB;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 17),
                                  child: Row(
                                    children: [
                                      const Text('What is FoodyBazar ?',textAlign: TextAlign.center, 
                                           style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                                  const Spacer(),
                                  Icon( isOpenB==true? Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_right_outlined,size: 19,)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3,),
                               if(isOpenB)
                           Container(
                            margin: const EdgeInsets.symmetric(horizontal: 17),
                             child: const Text('What is FoodyBazar What is FoodyBazar What is FoodyBazar',textAlign: TextAlign.center, 
                                         style: TextStyle( color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500)),
                           ),
                           const Divider(thickness: 1,)
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isOpenC=!isOpenC;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 17),
                                  child: Row(
                                    children: [
                                      const Text('What is FoodyBazar ?',textAlign: TextAlign.center, 
                                           style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                                  const Spacer(),
                                  Icon( isOpenC==true? Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_right_outlined,size: 19,)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3,),
                               if(isOpenC)
                           Container(
                            margin: const EdgeInsets.symmetric(horizontal: 17),
                             child: const Text('What is FoodyBazar What is FoodyBazar What is FoodyBazar',textAlign: TextAlign.center, 
                                         style: TextStyle( color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500)),
                           ),
                           const Divider(thickness: 1,)
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isOpenD=!isOpenD;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 17),
                                  child: Row(
                                    children: [
                                      const Text('What is FoodyBazar ?',textAlign: TextAlign.center, 
                                           style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                                  const Spacer(),
                                  Icon( isOpenD==true? Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_right_outlined,size: 19,)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3,),
                               if(isOpenD)
                           Container(
                            margin: const EdgeInsets.symmetric(horizontal: 17),
                             child: const Text('What is FoodyBazar What is FoodyBazar What is FoodyBazar',textAlign: TextAlign.center, 
                                         style: TextStyle( color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500)),
                           ),
                           const Divider(thickness: 1,)
                            ],
                          ),
                        ),
                       
          ],
        ),
      ),
    );
  }
}