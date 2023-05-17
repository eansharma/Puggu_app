import 'package:flutter/material.dart';
import 'package:pugau/Users/Auth/Forget/set_new_password.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required String title});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21,vertical: 10),
                child: GestureDetector(onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios,size: 18,),
                ),
              ),
               const Center(child: Text('Reset Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),)),
         const SizedBox(height: 10,),
         const Divider(thickness: 2,),
            Container(
              decoration: BoxDecoration(
               boxShadow: [
            BoxShadow(
               color: Colors.grey.withOpacity(.4),
          blurRadius: 2.0, // soften the shadow
          spreadRadius: 2.0, //extend the shadow
          offset: const Offset(
            10.0, // Move to right 10  horizontally
            01.0,)
            ),
          ],
            ),
              child: Card(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                elevation: 5,
                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                               const Text('Number',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),),
                        const SizedBox(height: 10,),
                          SizedBox(height: 30,
                                                    child: TextFormField(
                                                      
                                                      keyboardType: TextInputType.phone,
                                                      textAlign: TextAlign.start,
                                                  //  controller: number,
                                                  textAlignVertical: TextAlignVertical.bottom,
                                                  style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                                       decoration: InputDecoration(
                                                        hintText: 'Number',
                                                        hintStyle: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
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
                                                     const SizedBox(height: 16,),
                      Center(
                       child: MaterialButton(minWidth: MediaQuery.of(context).size.width,
                       
                        height: MediaQuery.of(context).size.height/18.2,
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7),),
                        textColor: Colors.black,
                        color: Colors.red,
                        onPressed: (() {
                                 Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const SetNewPassword  (title: '',)),
                       );
                       }
                       
                       ),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: const [
                         
                           Text('Send Password Reset Code',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),),
                          
                         ],
                       ),
                       ),
                         ),
                             
                    ],
                  ),
                )
                   ),
            ) ],
        ),
      ),
    );
  }
}