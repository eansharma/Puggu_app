import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pugau/Users/Screens/add_more_details.dart';
import 'package:pugau/util/Helper/helper.dart';

class TrackingLocationScreen extends StatefulWidget {
  const TrackingLocationScreen({Key? key, required String title}) : super(key: key);

  @override
  _TrackingLocationScreenState createState() => _TrackingLocationScreenState();
}

class _TrackingLocationScreenState extends State<TrackingLocationScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(26.87874142119288, 81.0025438078592), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: const [
              Icon(Icons.arrow_back_ios,color: Colors.black,size: 22,),
              Text("Live Tracking",style: TextStyle(color: Colors.black,fontSize: 14),),
            ],
          ),
        ),
      ),
      body:
       SizedBox(
        height: 455,
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
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const [
                Text(
                                 'Total Amount: 500',
                                 style: TextStyle(
                                   fontSize: 12,
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black,
                                 ),
                           ),
                Spacer(),
                 Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Text(
                                        'Payment: Paid Online',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                  ),
                 ),
              ],
            ),
          ),
         GestureDetector(
          onTap: () {
             Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const AddMoreDetails  (title: '',)),
               );
          },
           child: Container(
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          const Image(
                              image: AssetImage(
                                  'assets/images/deliverypartner.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'I am Ramesh your Delivery partner',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: Helper.getScreenWidth(context) / 1.5,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Order is on the way to deliver',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 151, 151, 151))),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.call,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              )),
                        ],
                      ),
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
  
}