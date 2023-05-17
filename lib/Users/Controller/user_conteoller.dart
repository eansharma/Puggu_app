// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;


// import '../Model/user_mode.dart';

// class NearbyPlacesResponse extends GetxController {
//   var detailsList = <Offices>[].obs;

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     FetchData();
//     // SportsFetchData();
//   }

//   Future FetchData() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://about.google/static/data/locations.json'));
//       if (response.statusCode == 200) {
//         var temp = jsonDecode(response.body)['offices'];

//         if (temp.isNotEmpty) {
//           for (var i = 0; i < temp.length; i++) {
//             if (temp[i] != null) {
//               Map<String, dynamic> map = temp[i];
//               detailsList.add(
//                 Offices.fromJson(map),
//               );
//             }
//           }

//           print("Data is rescive");
//           print(detailsList.length);
//         }
//       }
//       update();
//       return detailsList;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }