import 'package:flutter/material.dart';

import '../../util/Helper/helper.dart';


class NoInternet extends StatefulWidget {
  const NoInternet({super.key, required String title});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 142,width: 186,
              decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/nointernet.png'))
              ),
            ),
            const SizedBox(height: 60,),
            Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Center(
                     child: MaterialButton(minWidth: MediaQuery.of(context).size.width/3,
                      height: MediaQuery.of(context).size.height/18.2,
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7),),
                      textColor: Colors.black,
                      color: const Color(0xffFF0000),
                      onPressed: (() {
              //            Navigator.push(
              //    context,
              //    MaterialPageRoute(builder: (context) => const SelectCity (title: '',)),
              //  );
                     }
                     
                     ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: const [
                         Text('NO INTERNET',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
                       ],
                     ),
                     ),
                 ),
                  ),
                  const SizedBox(height: 5,),
                   const Text('You are offline',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
         const SizedBox(height: 5,),
          const SizedBox(
            width: 250,
            child: Center(child: Text('There is no internet connection\n please check your internet connection',textAlign: TextAlign.center,
             style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),))),
        const SizedBox(height: 10,),
         Container(
          height: 25,width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.blue
          ),
          child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: const [
                        Icon(Icons.refresh,color: Colors.white,size:15),
                        SizedBox(width: 5,),
                         Text('REFRESH',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),),
                       ],
                     ),
         ),
         const SizedBox(height: 30,),
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(height: 0.5,width: Helper.getScreenWidth(context)/3.85,
             color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
             const SizedBox(width: 5,),
              const Text('ORDER FROM CALL',textAlign: TextAlign.center, 
              style: TextStyle( color: Color.fromARGB(255, 158, 157, 157),fontSize: 12,fontWeight: FontWeight.w600)),
                  const SizedBox(width: 5,),
           Container(height: 0.5,width: Helper.getScreenWidth(context)/3.85,
           color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
            ],
          ),
          const SizedBox(height: 20,), 
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.7,color: const Color.fromARGB(255, 197, 196, 196)),
              borderRadius: BorderRadius.circular(4)
            ),
            child:const Padding(
              padding: EdgeInsets.all(3.0),
              child: Text('9826490661',textAlign: TextAlign.center, 
                style: TextStyle( color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700)),
            ),
          )
          ],
        ),
      ),
    );
  }
}