import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddGeniePicupDetail extends StatefulWidget {
  const AddGeniePicupDetail({Key? key, required String title}) : super(key: key);

  @override
  _AddGeniePicupDetailState createState() => _AddGeniePicupDetailState();
}

class _AddGeniePicupDetailState extends State<AddGeniePicupDetail> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(26.87874142119288, 81.0025438078592), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios,color: Colors.black,size: 22,)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("ADD MORE DETAILS",style: TextStyle(color: Colors.black,fontSize: 14),),
      ),
      body:
       GoogleMap(
         initialCameraPosition: initialCameraPosition,
         markers: markers,
         zoomControlsEnabled: false,
         mapType: MapType.normal,
         onMapCreated: (GoogleMapController controller) {
           googleMapController = controller;
         },
       ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended( 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        backgroundColor: Colors.white,
        onPressed: () {},
        label: Row(
          children: [
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
            const SizedBox(width: 65,),
             GestureDetector(
              onTap: () {
                                        
              },
               child: const Text(
                                        'EDIT',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red,
                                        ),
                                  ),
             ),
          ],
        ),
          icon: const Icon(Icons.location_pin,color: Colors.red,size: 18,),
    ));
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
