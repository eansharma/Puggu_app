import 'package:flutter/material.dart';

class AddDeliveryReview extends StatefulWidget {
  const AddDeliveryReview({super.key, required String title});

  @override
  State<AddDeliveryReview> createState() => _AddDeliveryReviewState();
}
class _AddDeliveryReviewState extends State<AddDeliveryReview> {
  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
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
                               child: const Icon(Icons.arrow_back_ios,size: 18,),
                               ),
                                          const Text('Add Review',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),     
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text('Rate Your Delivery Partner',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),),
               const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1,color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        child: Row(
                          children: [
                             Container(
                                   child: const Text('1',textAlign: TextAlign.center, 
                                               style: TextStyle( color: Color.fromARGB(255, 160, 159, 159),fontSize: 9,fontWeight: FontWeight.w500)),
                                 ),
                                 const Icon(Icons.star,color:Color.fromARGB(255, 160, 159, 159),size: 10,)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 7,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1,color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        child: Row(
                          children: [
                             Container(
                                   child: const Text('2',textAlign: TextAlign.center, 
                                               style: TextStyle( color: Color.fromARGB(255, 160, 159, 159),fontSize: 9,fontWeight: FontWeight.w500)),
                                 ),
                                 const Icon(Icons.star,color:Color.fromARGB(255, 160, 159, 159),size: 10,)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 7,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1,color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        child: Row(
                          children: [
                             Container(
                                   child: const Text('3',textAlign: TextAlign.center, 
                                               style: TextStyle( color: Color.fromARGB(255, 160, 159, 159),fontSize: 9,fontWeight: FontWeight.w500)),
                                 ),
                                 const Icon(Icons.star,color:Color.fromARGB(255, 160, 159, 159),size: 10,)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 7,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1,color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        child: Row(
                          children: [
                             Container(
                                   child: const Text('4',textAlign: TextAlign.center, 
                                               style: TextStyle( color: Color.fromARGB(255, 160, 159, 159),fontSize: 9,fontWeight: FontWeight.w500)),
                                 ),
                                 const Icon(Icons.star,color:Color.fromARGB(255, 160, 159, 159),size: 10,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                  Container(
                                 child: const Text('Share your experience with us',textAlign: TextAlign.center, 
                                             style: TextStyle( color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500)),
                               ),
                               const SizedBox(height: 5),
                               
                                Container(
                                              child: TextFormField(
                                                
                                                maxLines: 5,
                                                minLines: 5,
                                                keyboardType: TextInputType.multiline,
                                                textAlign: TextAlign.start,
                                            //  controller: number,
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
                                               const SizedBox(height: 10,),
                                                   Center(
                                                                  child: MaterialButton(minWidth: MediaQuery.of(context).size.width,
                                                                  
                                                                   height: MediaQuery.of(context).size.height/21,
                                                                   shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7),),
                                                                   textColor: Colors.black,
                                                                   color: Colors.green,
                                                                   onPressed: (() {
                                                                  //           Navigator.push(
                                                                  //   context,
                                                                  //   MaterialPageRoute(builder: (context) => const CustomerReview (title: '',)),
                                                                  // );
                                                                  }
                                                                  
                                                                  ),
                                                                  child: Row(
                                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: const [
                                                                    
                                                                      Text('SUBMIT',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),),
                                                                     
                                                                    ],
                                                                  ),
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
  }
}