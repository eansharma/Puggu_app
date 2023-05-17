import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddGeniePicupLocation extends StatefulWidget {
  const AddGeniePicupLocation({Key? key, required String title}) : super(key: key);

  @override
  _AddGeniePicupLocationState createState() => _AddGeniePicupLocationState();
}

class _AddGeniePicupLocationState extends State<AddGeniePicupLocation> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(26.87874142119288, 81.0025438078592), zoom: 14);

  Set<Marker> markers = {};
 bool value=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios,color: Colors.black,size: 22,),
                  Text("Choose Delivery location",style: TextStyle(color: Colors.black,fontSize: 14),),
                ],
              ),
            ),
            SizedBox(
                height: 30,width: Helper.getScreenWidth(context),

                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  //  controller: number,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.close,size: 20,
                      color: Colors.black,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,size: 20,
                      color: Colors.red,
                    ),
                    hintText: 'Search for city area street name..',
                    hintStyle:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 153, 153, 153),
                            width: 1)
                      //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 153, 153, 153),
                            width: 1)

                      //<-- SEE HERE
                    ),
                  ),
                )),
          ],
        ),
      ),
      body:
       SizedBox(
        height: 427,
         child: GoogleMap(
           initialCameraPosition: initialCameraPosition,
           markers: markers,
           zoomControlsEnabled: false,
           mapType: MapType.normal,
           onMapCreated: (GoogleMapController controller) {
             googleMapController = controller;
           },
         ),
       ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended( 
        backgroundColor: Colors.white,
        onPressed: () {},
        label: Container(
          width: Helper.getScreenWidth(context),
          height: 200,
          color: Colors.white,
          child: Column(
            children: [
          //     GestureDetector(
          //       onTap: () async{
          //          Position position = await _determinePosition();

          // googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          //     CameraPosition(
          //         target: LatLng(position.latitude, position.longitude),
          //         zoom: 14)));

          // markers.clear();

          // markers.add(Marker(
          //     markerId: const MarkerId('currentLocation'),
          //     position: LatLng(position.latitude, position.longitude)));

          // setState(() {});
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(7),
          //           border: Border.all(width: 1,color: Colors.red)
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: const Text("Use Current Location",style: TextStyle(color: Colors.red,fontSize: 10),),
          //         )),
          //     ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(Icons.location_pin,size: 30,color: Colors.red,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                     Text(
                                      'Delhi Reilway Station',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                ),
                                 Text(
                                      'Address',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 141, 140, 140),
                                      ),
                                ),
                  ],
                ),
                const Spacer(),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                     child: const Text(
                                          'Change',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.red,
                                          ),
                                    ),
                   ),
                 ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Center(
                     child: MaterialButton(minWidth: MediaQuery.of(context).size.width,
                     
                      height: MediaQuery.of(context).size.height/18.2,
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7),),
                      textColor: Colors.black,
                      color: Colors.red,
                      onPressed: (() {
                          showFlexibleBottomSheet(
  decoration: const BoxDecoration(
    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
  ),                               
  minHeight: 0,
  initHeight: 0.5,
  maxHeight: 1,
  context: context,
  builder: _buildBottomSheet,
  anchors: [0, 0.5, 1],
  isSafeArea: true,
);
              // _pizzapopup();
                     }
                     
                     ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: const [
                       
                         Text('CONFIRM LOCATION',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.white),),
                        
                       ],
                     ),
                     ),
                 ),
                  ),
            ],
          ),
        ),
        icon: const Icon(Icons.location_searching,color: Colors.red,size: 15,),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
  // void _pizzapopup() {
  //   showModalBottomSheet<void>(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10), topRight: Radius.circular(10))),
  //       context: context,
  //       builder: (BuildContext context) {
  //         return SingleChildScrollView(
  //           child: SizedBox(
  //               height: 280,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     SizedBox(height: 10,),
  //                     Center(
  //                       child: Text(
  //                                         'ENTER ADDRESS DETAILS',
  //                                         style: TextStyle(
  //                                           fontSize: 14,
  //                                           fontWeight: FontWeight.w600,
  //                                           color: Colors.black,
  //                                         ),
  //                                       ),
  //                     ),
  //                                     SizedBox(height: 10,),
  //                                     Divider(thickness: 1,),
  //                    Text(
  //                                       'Complete this address (STREET ADDRESS, house no, lane no etc)',
  //                                       style: TextStyle(
  //                                         fontSize: 11,
  //                                         fontWeight: FontWeight.w500,
  //                                         color: Color.fromARGB(255, 119, 118, 118),
  //                                       ),
  //                                     ),
  //                                     SizedBox(height: 5,),
  //                                      Text(
  //                                       'Test',
  //                                       style: TextStyle(
  //                                         fontSize: 13,
  //                                         fontWeight: FontWeight.w500,
  //                                         color: Colors.black,
  //                                       ),
  //                                     ),
  //                                      Divider(thickness: 1,),
  //                    Text(
  //                                       'Complete this address (STREET ADDRESS, house no, lane no etc)',
  //                                       style: TextStyle(
  //                                         fontSize: 11,
  //                                         fontWeight: FontWeight.w500,
  //                                         color: Color.fromARGB(255, 119, 118, 118),
  //                                       ),
  //                                     ),
  //                                     SizedBox(height: 5,),
  //                                      Text(
  //                                       'Test',
  //                                       style: TextStyle(
  //                                         fontSize: 13,
  //                                         fontWeight: FontWeight.w500,
  //                                         color: Colors.black,
  //                                       ),
  //                                     ),
  //                                     Row(
  //                                   children: [
  //                                     Row(
  //                                       children: [
  //                                         Checkbox(
  //                                           checkColor: Colors.red,
  //                                           fillColor: MaterialStateProperty.all(Colors.white),
  //                                           side: MaterialStateBorderSide.resolveWith(
  //                         (states) => BorderSide(width: 1.0, color: Colors.red),),
  //                           value: this.value,
  //                           onChanged: (bool? value) {
  //                             setState(() {
  //                               this.value =value!;
  //                             });
  //                           },
  //                         ),
  //                         Text(
  //                                                 'HOME',
  //                                                 style: TextStyle(
  //                                                     color: Colors.black,
  //                                                     fontSize: 14,
  //                                                     fontWeight: FontWeight.w500),
  //                                               ),
  //                                       ],
  //                                     ),
  //                                     SizedBox(width: Helper.getScreenWidth(context)/12,),
  //                                      Row(
  //                                   children: [
  //                                     Checkbox(
  //                                       checkColor: Colors.red,
  //                                       fillColor: MaterialStateProperty.all(Colors.white),
  //                                       side: MaterialStateBorderSide.resolveWith(
  //                         (states) => BorderSide(width: 1.0, color: Colors.red),),
  //                           value: this.value,
  //                           onChanged: (bool? value) {
  //                             setState(() {
  //                               this.value = value!;
  //                             });
  //                           },
  //                         ),
  //                         Text(
  //                                             'OFFICE',
  //                                             style: TextStyle(
  //                                                 color: Colors.black,
  //                                                 fontSize: 14,
  //                                                 fontWeight: FontWeight.w500),
  //                                           ),
  //                                   ],
  //                                 ),
  //                                  SizedBox(width: Helper.getScreenWidth(context)/12,),
  //                                      Row(
  //                                   children: [
  //                                     Checkbox(
  //                                       checkColor: Colors.red,
  //                                       fillColor: MaterialStateProperty.all(Colors.white),
  //                                       side: MaterialStateBorderSide.resolveWith(
  //                         (states) => BorderSide(width: 1.0, color: Colors.red),),
  //                           value: this.value,
  //                           onChanged: (bool? value) {
  //                             setState(() {
  //                               this.value = value!;
  //                             });
  //                           },
  //                         ),
  //                         Text(
  //                                             'OTHER',
  //                                             style: TextStyle(
  //                                                 color: Colors.black,
  //                                                 fontSize: 14,
  //                                                 fontWeight: FontWeight.w500),
  //                                           ),
  //                                   ],
  //                                 ),
  //                                   ],
  //                                 ),
  //                                 Spacer(),
  //                                 Center(
  //                child: MaterialButton(minWidth: MediaQuery.of(context).size.width,
                 
  //                 height: MediaQuery.of(context).size.height/18.2,
  //                 shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7),),
  //                 textColor: Colors.black,
  //                 color: Colors.red,
  //                 onPressed: (() {
  //               //            Navigator.push(
  //               //    context,
  //               //    MaterialPageRoute(builder: (context) => const ResetPassword  (title: '',)),
  //               //  );
  //                }
                 
  //                ),
  //                child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                  children: const [
                   
  //                    Text('SAVE ADDRESSS',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),),
                    
  //                  ],
  //                ),
  //                ),
  //                  ),
  //                   ],
  //                 ),
  //               )),
  //         );
  //       });
  // }
   Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
        child: Container(
          child: ListView(
            controller: scrollController,
            children: [
              SizedBox(
                height: 700,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                                'SELECT CITY',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(255, 128, 127, 127),
                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                               SizedBox(
                            height: 6.h,
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.start,
                          //  controller: number,
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: 'Enter City Name',
                            hintStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                                //<-- SEE HERE
                                ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                          
                                //<-- SEE HERE
                                ),
                          ),
                            )),
                            ],
                          ),
                        ),
                       const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                                'SELECT CITY',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(255, 128, 127, 127),
                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                               SizedBox(
                            height: 6.h,
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.start,
                          //  controller: number,
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: 'Enter City Name',
                            hintStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                                //<-- SEE HERE
                                ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                          
                                //<-- SEE HERE
                                ),
                          ),
                            )),
                            ],
                          ),
                        ),
                         const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                                'SELECT CITY',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(255, 128, 127, 127),
                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                               SizedBox(
                            height: 6.h,
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.start,
                          //  controller: number,
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: 'Enter City Name',
                            hintStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                                //<-- SEE HERE
                                ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                          
                                //<-- SEE HERE
                                ),
                          ),
                            )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                                'SELECT CITY',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(255, 128, 127, 127),
                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                               SizedBox(
                            height: 6.h,
                            width: MediaQuery.of(context).size.width/2.4,
                            child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.start,
                          //  controller: number,
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: 'Enter City Name',
                            hintStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                                //<-- SEE HERE
                                ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                          
                                //<-- SEE HERE
                                ),
                          ),
                            )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                                'SELECT CITY',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(255, 128, 127, 127),
                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                               SizedBox(
                            height: 6.h,
                            width: MediaQuery.of(context).size.width/2.4,
                            child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.start,
                          //  controller: number,
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: 'Enter City Name',
                            hintStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                                //<-- SEE HERE
                                ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    width: 1)
                          
                                //<-- SEE HERE
                                ),
                          ),
                            )),
                            ],
                          ),
                        ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Center(
                       child: MaterialButton(minWidth: MediaQuery.of(context).size.width,
                       
                        height: MediaQuery.of(context).size.height/18.2,
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7),),
                        textColor: Colors.black,
                        color: Colors.red,
                        onPressed: (() {
                             Navigator.pop(
                        context
                            );
                       }
                       
                       ),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: const [
                         
                           Text('SAVE PIC UP ADDRESS',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white),),
                          
                         ],
                       ),
                       ),
                   ),
                    ),
                      ],
                    ),
                  ),
              )
            ],
          
          ),
        ),
      );
  }
}