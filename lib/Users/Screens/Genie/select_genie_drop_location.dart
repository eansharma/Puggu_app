import 'package:flutter/material.dart';
import 'package:pugau/Users/Screens/Location/add_genie_drop_location.dart';
import 'package:pugau/Users/Screens/add_more_details.dart';
import 'package:pugau/util/Helper/helper.dart';


class SelectGenieDropLocation extends StatefulWidget {
  const SelectGenieDropLocation({super.key, required String title});

  @override
  State<SelectGenieDropLocation> createState() => _SelectGenieDropLocationState();
}

class _SelectGenieDropLocationState extends State<SelectGenieDropLocation> {
  @override
  Widget build(BuildContext context) {
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
                    const Text('Change City',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                              shape:const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10) )
                              ) ,
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 17),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(height: 1.5,width: Helper.getScreenWidth(context)/4.1,
                                            color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                                          const SizedBox(width: 5,),
                                          const Text('SELECT YOUR LOCATION',textAlign: TextAlign.center,
                                              style: TextStyle( color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600)),
                                          const SizedBox(width: 5,),
                                          Container(height: 1.5,width: Helper.getScreenWidth(context)/4.1,
                                              color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(.4),
                                              blurRadius: 1.0,
                                              spreadRadius: 1.0,
                                              offset: const Offset(1.0, 0.0,)
                                          ),
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(.4),
                                              blurRadius: 1.0,
                                              spreadRadius: 1.0,
                                              offset: const Offset(0,1,)
                                          ),
                                        ],
                                      ),
                                      child: Card(
                                        child:
                                        SizedBox(
                                          height: Helper.getScreenHeight(context)/2.1,
                                          child: GridView.builder(itemCount: 4,
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/1.87),
                                              itemBuilder: (Context,index){
                                                return

                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => const AddMoreDetails  (title: '',)),
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          boxShadow: [

                                                          ]
                                                      ),
                                                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                                                      child: Card(
                                                        elevation: 5,
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                width: 104,
                                                                height: 98,
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    image: DecorationImage(image: AssetImage('assets/images/cityimage.png'),fit: BoxFit.cover)
                                                                ),
                                                              ),
                                                              const SizedBox(height: 5,),
                                                              Container(
                                                                height: 17,
                                                                width: 123,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(6),
                                                                  color: const Color.fromARGB(255, 85, 27, 247),
                                                                ),
                                                                child: const Center(child: Text('KOLKATA',style: TextStyle(fontSize: 10.21,fontWeight: FontWeight.w600,color: Colors.white),)),
                                                              ),
                                                              const SizedBox(height: 9,),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                              }),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: const Text('Change City',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.red),)),
                  ],
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,
                      //  controller: number,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        enabled: true,
                        hintText: 'Search for area Street name',
                        hintStyle:TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 153, 153, 153),
                                width: 1)
                          //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:  BorderSide(
                                color: Color.fromARGB(255, 153, 153, 153),
                                width: 1)
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_searching,color: Colors.red,),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: Helper.getScreenWidth(context)/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Device Location Not Enable',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 7,),
                          Text('Top Here to enable your device location for batter experience',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 170, 168, 168),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(Icons.arrow_forward_ios,size: 15,),
                    )
                  ],
                ),
              ),
              const Divider(thickness: 1,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Nearby Locations',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ),
              GestureDetector(
                onTap: () =>  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddGenieDropLocation (title: '')),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_pin,color: Colors.black,size: 20,),
                      const SizedBox(width: 5,),
                      SizedBox(
                        width: Helper.getScreenWidth(context)/1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Bhairhwa, Bank Road',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 7,),
                            Text('Nepal',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 170, 168, 168),
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_pin,color: Colors.black,size: 20,),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: Helper.getScreenWidth(context)/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Padsari',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 7,),
                          Text('Nepal',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 170, 168, 168),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_pin,color: Colors.black,size: 20,),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: Helper.getScreenWidth(context)/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Butwal',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 7,),
                          Text('Nepal',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 170, 168, 168),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_pin,color: Colors.black,size: 20,),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: Helper.getScreenWidth(context)/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Manigram',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 7,),
                          Text('Nepal',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 170, 168, 168),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_pin,color: Colors.black,size: 20,),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: Helper.getScreenWidth(context)/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Tillotama',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 7,),
                          Text('Nepal',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 170, 168, 168),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1,),
            ],
          ),
        ),
      ),
    );
  }
  
}