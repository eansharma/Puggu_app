import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/Helper/helper.dart';
import '../../Controller/login_controller.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key, required String title});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

   final AuthController _authController = Get.put(AuthController());

  TextEditingController current_password = TextEditingController();
  TextEditingController new_password = TextEditingController();
  TextEditingController new_confirm_password = TextEditingController();

 

 

   
  bool isTrue=false;
  @override
  Widget build(BuildContext context) {
   return GetBuilder<AuthController>(builder: ( _authController){

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
                        Container(height: 1.5,width: Helper.getScreenWidth(context)/3.55,
                        color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                        const SizedBox(width: 5,),
                         const Text('CHANGE PASSWORD',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                             const SizedBox(width: 5,),
                      Container(height: 1.5,width: Helper.getScreenWidth(context)/3.55,
                      color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                       ],
                     ),
                   ), 
      
      
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
            shadowColor: Colors.black,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text('Current Password',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),),
                  const SizedBox(height: 10,),
                    SizedBox(height: 30,
                                              child: TextFormField(
                                                keyboardType: TextInputType.text,
                                                textAlign: TextAlign.start,
                                                controller: current_password,
                                            //  controller: number,
                                            textAlignVertical: TextAlignVertical.bottom,
                                            style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                                 decoration: InputDecoration(
                                                  hintText: 'Current Password',
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
                                             
                                             
                                              const SizedBox(height: 10,),
                                              const Text('New Password',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),),
                                                  const SizedBox(height: 10,),
                                                   SizedBox(height: 30,
                                              child: TextFormField(
                                                obscureText: true,
                                                keyboardType: TextInputType.text,
                                                textAlign: TextAlign.start,
                                                controller: new_password,
                                            //  controller: number,
                                            textAlignVertical: TextAlignVertical.bottom,
                                            style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                                 decoration: InputDecoration(
                                                  hintText: 'New Password',
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
                                              
                                               Row(
                                                 children: [
                                                  Checkbox(
                                                    
                                                    value: isTrue, onChanged:(value){
                                                    setState(() {
                                                      isTrue!=value;
                                                    });
                                                  }),
                                                   const Text('Show Password',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),),
                                                 ],
                                               ),
                                              
                                              const Text('Confirm Password',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black),),
                                                  const SizedBox(height: 10,),
                                                    SizedBox(height: 30,
                                              child: TextFormField(
                                                obscureText: true,
                                                keyboardType: TextInputType.text,
                                                textAlign: TextAlign.start,
                                                controller: new_confirm_password,
                                            //  controller: number,
                                            textAlignVertical: TextAlignVertical.bottom,
                                            style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                                 decoration: InputDecoration(
                                                  hintText: 'Confirm Password',
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

                                if (current_password.text.isEmpty) {
                                  showCustomSnackBar('Current Password is Empty', isError: true);
                                } 
                                else if (new_password.text.isEmpty) {
                                  showCustomSnackBar('New Password is Empty', isError: true);
                                } 
                                else if (new_confirm_password.text.isEmpty) {
                                  showCustomSnackBar('Confirm password is empty', isError: true);
                                } 
                                else if (new_password.text == new_confirm_password.text) {
                                  _authController.changePassword(
                                    current_password.text,
                                    new_password.text,
                                    new_confirm_password.text,
                                  );
                                }
                                else {
                                  showCustomSnackBar('New Password and Confirm Password do not match', isError: true);
                                }


                //            Navigator.push(
                //    context,
                //    MaterialPageRoute(builder: (context) => const ResetPassword  (title: '',)),
                //  );
              
                // _popup();
                 }
                 
                 ),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: const [
                   
                     Text('Update Password',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),),
                    
                   ],
                 ),
                 ),
                  
                  
                  
                   ),
                ],
              ),
            ),
          ),
        )
          ],
        ),
    ));
 
 

   });
  }
 
 
 
 
  void _popup(){
     AwesomeDialog(
          dismissOnTouchOutside: true,
                      context: context,
                      dialogType: DialogType.success,
                      headerAnimationLoop: true,
                      animType: AnimType.bottomSlide,
                      title: 'Password Reset',
                      desc: 'Your password has been reset sucessfully',
                      reverseBtnOrder: true,
                     
                             ).show();
  }
}