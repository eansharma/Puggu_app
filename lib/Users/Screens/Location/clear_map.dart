import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pugau/Data/Model/prediction_model.dart';
import 'package:pugau/Users/Controller/AuthController/login_controller.dart';
import 'package:pugau/Users/Controller/city_controller.dart';
import 'package:pugau/Users/Controller/my_address_controller.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key,}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(26.87874142119288, 81.0025438078592), zoom: 14);

  final CityController _cityController = Get.put(CityController());
  int? _selectedLocation;

  Set<Marker> markers = {};
 bool value=true;
  String? name_add;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController complete = TextEditingController();
  final TextEditingController landmark = TextEditingController();
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
            // SizedBox(height: 25,),
            SizedBox(
                height: 30,
                width: Helper.getScreenWidth(context),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _controller,
                    textInputAction: TextInputAction.search,
                    autofocus: true,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      hintText: 'Search for city area street name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(style: BorderStyle.none, width: 0),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).disabledColor,
                      ),
                      filled: true, fillColor: Theme.of(context).cardColor,
                    ),

                  ),
                  suggestionsCallback: (pattern) async {
                    return await Get.find<AuthController>().searchLocation(context, pattern);
                  },
                  itemBuilder: (context, Predictions suggestion) {
                    return Padding(
                      padding: EdgeInsets.all(9),
                      child: Row(children: [
                        Icon(Icons.location_on),
                        Expanded(
                          child: Text(suggestion.description.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, ),
                        ),
                      ]),
                    );
                  },
                  onSuggestionSelected: (Predictions suggestion) async {
                    Position _position = await Get.find<AuthController>().setSuggestedLocation(suggestion.placeId.toString(), suggestion.description.toString());
                    print(suggestion.placeId.toString()+"hijifjnvnbvvbmn");
                    setState(() {
                      name_add=suggestion.description.toString();
                    });
                  },
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
        heroTag: "1",
        backgroundColor: Colors.white,
        onPressed: () {},
        label: Container(
          width: Helper.getScreenWidth(context),
          height: 200,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.location_pin,size: 30,color: Colors.red,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name_add??"",
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
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
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

/*  Future<Position> _determinePosition() async {
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
  }*/
  
    Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return GetBuilder<MyAddressListController>(
      builder: (add_address){
      return Container(
        child: ListView(
          controller: scrollController,
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 10,),
                      Center(
                        child: Text(
                          'ENTER ADDRESS DETAILS',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SELECT CITY',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 128, 127, 127),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              height: 30,
                              width: Helper.getScreenWidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(width: 1)),
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Obx(
                                          () => DropdownButton(
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 15,
                                        ),
                                        value: _selectedLocation,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedLocation = newValue;
                                          });
                                        },
                                        items: _cityController.CityList.map(
                                                (location) {
                                              return DropdownMenuItem(
                                                value: location.id,
                                                child: Text(location.name??"Select City"),
                                              );
                                            }).toList(),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Complete this address (house no, lane no etc)',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 128, 127, 127),
                              ),
                            ),
                            SizedBox(height: 5,),
                            SizedBox(
                                height: 5.h,
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.start,
                                   controller: complete,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  style: TextStyle(
                                      fontSize: 15.sp, fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    hintText: 'Complete this address (house no, lane no etc)',
                                    hintStyle: TextStyle(
                                        fontSize: 15.sp, fontWeight: FontWeight.w500),
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(255, 153, 153, 153),
                                            width: 1)

                                      //<-- SEE HERE
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Landmark ,additional info, etc(optional)',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 128, 127, 127),
                              ),
                            ),
                            SizedBox(height: 5,),
                            SizedBox(
                                height: 5.h,
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.start,
                                   controller: landmark,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  style: TextStyle(
                                      fontSize: 15.sp, fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    hintText: 'Landmark ,additional info, etc(optional)',
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
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.red,
                                fillColor: MaterialStateProperty.all(Colors.white),
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(width: 1.0, color: Colors.red),),
                                value: value,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value =value!;
                                  });
                                },
                              ),
                              Text(
                                'HOME',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(width: Helper.getScreenWidth(context)/12,),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.red,
                                fillColor: MaterialStateProperty.all(Colors.white),
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(width: 1.0, color: Colors.red),),
                                value: value,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                              Text(
                                'OFFICE',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(width: Helper.getScreenWidth(context)/12,),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.red,
                                fillColor: MaterialStateProperty.all(Colors.white),
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(width: 1.0, color: Colors.red),),
                                value: value,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                              const Text(
                                'OTHER',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Center(
                        child: MaterialButton(minWidth: MediaQuery.of(context).size.width,

                          height: MediaQuery.of(context).size.height/18.2,
                          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7),),
                          textColor: Colors.black,
                          color: Colors.red,
                          onPressed: (() {
                            if(complete.text.isEmpty)
                              {
                                showCustomSnackBar("Complete this Address is Empty", isError: true);
                              }
                            else if(landmark.text.isEmpty)
                              {
                                showCustomSnackBar("Landmark this Address is Empty", isError: true);
                              }
                            else if(_selectedLocation==null)
                              {
                                showCustomSnackBar("City is Empty", isError: true);
                              }
                            else{
                              add_address.add_address(
                                  name_add.toString(),
                                  Get.find<AuthController>().long.toString(),
                                  Get.find<AuthController>().lat.toString(),
                                  landmark.text,
                                  complete.text,
                                  _selectedLocation.toString());
                            }
                          }

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('SAVE ADDRESSS',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],

        ),
      );
    }
    );
  }

}