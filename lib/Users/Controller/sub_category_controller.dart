import 'dart:convert';

import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';

import '../../Data/Model/sub_category_model.dart';
import 'package:http/http.dart' as http;

class SubCategoryController extends GetxController{
  var subList = <Data>[].obs;

  var isloading = true;


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }


  Future subDataFetch() async{
    try{
            var request = http.Request('GET', Uri.parse(AppContent.BASE_URL+ AppContent.SUB_MENU_URL));
            http.StreamedResponse response = await request.send();

            if (response.statusCode == 200) {
              print(await response.stream.bytesToString());
              var jsonResponse = await response.stream.bytesToString();
              SubCategoryModel categoryModel = SubCategoryModel.fromJson(jsonDecode(jsonResponse));
              subList.assignAll(categoryModel.data);

            }
            else {
              print(response.reasonPhrase);
            }

    }catch(e){print(e);}
  }

}