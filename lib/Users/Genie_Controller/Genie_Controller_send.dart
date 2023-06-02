import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Data/Model/Genie_model/genie_model.dart';
import 'package:pugau/Users/Screens/Genie/genie_billing.dart';
import 'package:pugau/Users/Screens/Genie/genie_picup.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Genie_Controller extends GetxController implements GetxService {
  bool isLoading = false;
  var show_genie=show_genies_model();

  @override
  void onInit() {
    super.onInit();
    genies();
  }
  void _setValue(value) async {
    final pref = await SharedPreferences.getInstance();
    var set1 = pref.setString('genie_id', value);
  }
  Future<void> genie_drop_pid(String pickup_name,pickup_phone,pickup_map_address,pickup_latitude,pickup_longitude,
      pickup_city,pickup_landmark_address,pickup_street_address,drop_name,drop_phone,drop_map_address,drop_latitude,
      drop_longitude,drop_city,drop_landmark_address,drop_street_address,id,type
      ) async {
    isLoading = true;
    update();
    final pref = await SharedPreferences.getInstance();
    var userId = pref.getString('user_id');

    final response = await http.post(
        Uri.parse(AppContent.BASE_URL + AppContent.ADD_GENIE),
        body: id!=null?{
          "user_id":userId,
          'pickup_name': pickup_name,
          'pickup_phone': pickup_phone,
          'pickup_map_address': pickup_map_address,
          'pickup_latitude': pickup_latitude,
          'pickup_longitude': pickup_longitude,
          'pickup_city': pickup_city,
          'pickup_landmark_address': pickup_landmark_address,
          'pickup_street_address': pickup_street_address,
          'drop_name': drop_name,
          'drop_phone': drop_phone,
          'drop_map_address': drop_map_address,
          'drop_latitude': drop_latitude,
          'drop_longitude': drop_longitude,
          'drop_city': drop_city,
          'drop_landmark_address': drop_landmark_address,
          'drop_street_address': drop_street_address,
          "type":type,
         "id":id,

        }:{
          "user_id":userId,
          'pickup_name': pickup_name,
          'pickup_phone': pickup_phone,
          'pickup_map_address': pickup_map_address,
          'pickup_latitude': pickup_latitude,
          'pickup_longitude': pickup_longitude,
          'pickup_city': pickup_city,
          'pickup_landmark_address': pickup_landmark_address,
          'pickup_street_address': pickup_street_address,
          'drop_name': drop_name,
          'drop_phone': drop_phone,
          'drop_map_address': drop_map_address,
          'drop_latitude': drop_latitude,
          'drop_longitude': drop_longitude,
          'drop_city': drop_city,
          'drop_landmark_address': drop_landmark_address,
          'drop_street_address': drop_street_address,
          "type":type,
        });
    var res = jsonDecode(response.body);

    print(res);
    if (res['success'] == true) {
        Get.off(()=>GeniePicup(title: '',));
      showCustomSnackBar(res['message'].toString(), isError: false);
      _setValue(res['data']['id'].toString());
        genies();
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }



  Future<void> add_task_details(String category,task_title,description,schedule,km,role,type
      ) async {
    isLoading = true;
    update();
    final pref = await SharedPreferences.getInstance();
    var userId = pref.getString('user_id');
    var genie_id = pref.getString('genie_id');

    final response = await http.post(
        Uri.parse(AppContent.BASE_URL + AppContent.ADD_GENIE),
        body: {
          "id":genie_id,
          "user_id":userId,
          'category': category,
          'task': task_title,
          'description': description,
          'schedule': schedule,
          'km': km,
          'role': role.toString(),
          'type': type,
        });
    var res = jsonDecode(response.body);

    print(res);
    if (res['success'] == true) {
      genies();
      Get.off(()=>GenieBilling(title: 'Title',));
      showCustomSnackBar(res['message'].toString(), isError: false);
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }


  Future<void> genies() async {
    try {
      isLoading = true;
      update();
      final pref = await SharedPreferences.getInstance();
      var genie_id = pref.getString('genie_id');
      final url = AppContent.BASE_URL + AppContent.SHOW_GENIE;
      final body = {
        'id': genie_id,
      };
      final response = await http.post(Uri.parse(url), body: body);
      var res=jsonDecode(response.body);
      print(res.toString());
      if (res['success'] == true) {
        show_genie = show_genies_model.fromJson(res);
        update();
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

}
