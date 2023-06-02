import 'dart:convert';

import 'package:get/get.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Data/Api/API_URLs.dart';
import '../../Data/Model/Comp_Feed_Model.dart';

class ComplaintFeedController extends GetxController {
  bool isLoading = false;
  Future complain_fedd(
    String _selectedType,
    String feedback,
    String _selectedLocation,
    // int selectedLocationId,
    String name,
    String phone,
  ) async {
    isLoading = true;
    update();
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');

    final response = await http
        .post(Uri.parse(AppContent.BASE_URL + AppContent.COMPLAINT), body: {
      'user_id': userid,
      'type': _selectedType,
      'message': feedback,
      // 'city_id': selectedLocationId,
      'city_id': _selectedLocation,
      'name': name,
      'phone': phone,
    });
    print(response.body.toString());
    var res = jsonDecode(response.body);

    print(res);
    if (res['success'] == true) {
      showCustomSnackBar(res['message'].toString(), isError: true);
    } else {
      showCustomSnackBar(res['message'].toString(), isError: false);
    }
    isLoading = false;
    update();
  }

// For complaint Show
  var compFeedList = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchComplaintData();
  }

  Future fetchComplaintData() async {
    try {
      final res = await http
          .get(Uri.parse(AppContent.BASE_URL + AppContent.SHOW_COMPLAINT));
      if (res.statusCode == 200) {
        var temp = jsonDecode(res.body)['data'];
        if (temp.isNotEmpty) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i] != null) {
              Map<String, dynamic> map = temp[i];
              compFeedList.add(Data.fromJson(map));
            }
          }
        }
      }
      update();
      return compFeedList;
    } catch (e) {
      print(e.toString());
    }
  }
}
