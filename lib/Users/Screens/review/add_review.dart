import 'package:flutter/material.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key, required String title});

  @override
  State<AddReview> createState() => _AddReviewState();
}
enum OS { mac, windows, }
class _AddReviewState extends State<AddReview> {
  int? selectedRadio;
  @override
  Widget build(BuildContext context) {
    OS? os = OS.mac;
    return SafeArea(
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
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Padding(
                   padding: EdgeInsets.symmetric(horizontal: 17),
                   child: Text('Rate Your Experience For',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),),
                 ),
             ButtonBar(
              buttonPadding: EdgeInsets.zero,
              overflowButtonSpacing: 0,
  alignment: MainAxisAlignment.start,
  children: <Widget>[
    Radio(
      value: 1,
      groupValue: selectedRadio,
      activeColor: Colors.green,
      onChanged: (val) {
        setState(() {
          selectedRadio=val;
        });
      },
    ),
    const Text('Food'),
    Radio(
      value: 2,
      groupValue: selectedRadio,
      activeColor: Colors.green,
      onChanged: (val) {
       setState(() {
         selectedRadio=val;
       });
      },
    ),
    const Text('Mart'),
  ],
),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
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
              ),
              const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Container(
                                 child: const Text('Share your experience with us',textAlign: TextAlign.center, 
                                             style: TextStyle( color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500)),
                               ),
                ),
                             const SizedBox(height: 5),
                             
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 17),
                                child: Container(
                                              child: TextFormField(
                                                
                                                maxLines: 5,
                                                minLines: 5,
                                                keyboardType: TextInputType.multiline,
                                                textAlign: TextAlign.start,
                                            //  controller: number,
                                            textAlignVertical: TextAlignVertical.bottom,
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
                              ),
                                             const SizedBox(height: 10,),
                                                 Padding(
                                                   padding: const EdgeInsets.symmetric(horizontal: 17),
                                                   child: Center(
                                                                  child: MaterialButton(minWidth: MediaQuery.of(context).size.width,
                                                                  
                                                                   height: MediaQuery.of(context).size.height/21,
                                                                   shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7),),
                                                                   textColor: Colors.black,
                                                                   color: Colors.green,
                                                                   onPressed: (() {
                                                                  //           Navigator.push(
                                                                  //   context,
                                                                  //   MaterialPageRoute(builder: (context) => const AddDeliveryReview (title: '',)),
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
                                                 ),
               ],
             ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: Image(image: AssetImage('assets/images/review.png'),fit: BoxFit.cover,height: 220,width: 220,)),
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