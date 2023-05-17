import 'package:flutter/material.dart';

import '../Search/menu_search.dart';

class RestaurentCategory extends StatefulWidget {
  const RestaurentCategory({super.key, required String title});

  @override
  State<RestaurentCategory> createState() => _RestaurentCategoryState();
}

class _RestaurentCategoryState extends State<RestaurentCategory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 17),
                child: Row(
                  children: [
                     GestureDetector(onTap: () {
                         Navigator.pop(context);
                       },
                       child: const Icon(Icons.arrow_back_ios,size: 18,),
                       ),
                                  const Text('Hoichoi Restaurent',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
                const Spacer(),
                 const Icon(Icons.more_horiz,size: 20,)
                  ],
                ),
              ),
              Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                   child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(0, 1)
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                      child: Row(
                        children: const [
                          Icon(Icons.square_outlined,color: Colors.green,size: 10,),
                          SizedBox(width: 5,),
                          Text('Veg',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                   ),
                 ),
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                   child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(0, 1)
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                      child: Row(
                        children: const [
                          Icon(Icons.square_outlined,color: Colors.green,size: 10,),
                          SizedBox(width: 5,),
                          Text('Non-Veg',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                        
                        ],
                      ),
                    ),
                   ),
                 ),
                 const Spacer(),
                  GestureDetector(
                     onTap: () {
                       Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const MenuSearch (title: '',)),
               );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromARGB(255, 221, 221, 221)
                      ),
                                  
                                              child:Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Icon(Icons.search,color: Colors.red,size: 15,),
                                                  SizedBox(width: 5,),
                                                  Text('Search Menu',
                                                  style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                                                ],
                                              ), ),
                    ),
                  ),
               ],
             ),
              const SizedBox(height: 20,),
             GestureDetector(
              onTap: () {
                //             Navigator.push(
                //    context,
                //    MaterialPageRoute(builder: (context) => const RestaurentCategory  (title: '',)),
                //  );
              },
               child: Card(
                elevation: 5,
                 child: Column(
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          child: Text('Recommanded(30)',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),),
                        ),
                    Spacer(),
                     Icon(Icons.arrow_drop_down,size: 15,)
                      ],
                    ),
                    const SizedBox(height: 7,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Regular Sandwich',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                           const SizedBox(height: 5,),
                           Row(
                            children: [
                               const Icon(Icons.square_outlined,color: Colors.green,size: 23,),
                            const SizedBox(width: 5,),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('BESTSELLER',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                              )),
                            ],
                           ),
                           const SizedBox(height: 5,),
               Row(
                 children: const [
                       Text('₹ 162 / Plate',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                  SizedBox(width: 10,),
                  Text('₹180',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                   SizedBox(width: 10,),
                   Text('10 % off',style: TextStyle(color: Colors.blue,fontSize: 10,fontWeight: FontWeight.w500),),
                 ],
               ),
               const SizedBox(height: 5,),
               const Text('With tartar souce and tomato souce',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
               const SizedBox(height: 5,),
               const Text('This is some Special note for some items',style: TextStyle(color: Colors.blueAccent,fontSize: 10,fontWeight: FontWeight.w500),),
                           
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 100,width: 70,
                            child: Stack(
                              children: [
                                 Container(
                              height: 70,width: 70,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/pizza.png'),fit: BoxFit.cover)
                              ),
                            ),
                            Positioned(
                              bottom: 17,
                              left: 10,
                              child: Container(
                              color: Colors.red,
                              height: 20,width: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('ADD',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w500),),
                                Icon(Icons.add,color: Colors.white,size: 15,)
                                ],
                              ),
                            ),
                            )
                              ],
                            ),
                          )
                         
                        ],
                      ),
                    ),
                  ],
                 ),
               ),
             ),
              const SizedBox(height: 20,),
             Card(
              elevation: 5,
               child: Column(
                children: [
                 
                  const SizedBox(height: 7,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Regular Sandwich',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                         const SizedBox(height: 5,),
                         Row(
                          children: [
                             const Icon(Icons.square_outlined,color: Colors.green,size: 23,),
                          const SizedBox(width: 5,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('BESTSELLER',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                            )),
                          ],
                         ),
                         const SizedBox(height: 5,),
             Row(
               children: const [
                     Text('₹ 162 / Plate',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                SizedBox(width: 10,),
                Text('₹180',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                 SizedBox(width: 10,),
                 Text('10 % off',style: TextStyle(color: Colors.blue,fontSize: 10,fontWeight: FontWeight.w500),),
               ],
             ),
             const SizedBox(height: 5,),
             const Text('With tartar souce and tomato souce',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
            
                         
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 100,width: 70,
                          child: Stack(
                            children: [
                               Container(
                            height: 70,width: 70,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/pizza.png'),fit: BoxFit.cover)
                            ),
                          ),
                          Positioned(
                            bottom: 17,
                            left: 10,
                            child: Container(
                            color: Colors.white,
                            height: 20,width: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('OUT OF STOCK',style: TextStyle(color: Colors.grey,fontSize: 6,fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                          )
                            ],
                          ),
                        )
                       
                      ],
                    ),
                  ),
                ],
               ),
             ),
            ],
          ),
        ),
      )
    );
  }
}