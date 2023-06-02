import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import '../../Data/Api/API_URLs.dart';
import '../../Data/Model/city_model.dart';

class CityController extends GetxController {

  var CityList = <Data> [].obs;

  var _isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    CityName();
  }
    
    // Select
  Future CityName() async{
    try{
      _isLoading();
      var request = http.Request('GET', Uri.parse(AppContent.BASE_URL+ AppContent.SELECT_CITY_IMAGE));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) { var jsonResponse = await response.stream.bytesToString();
        CityModeles cityModels = CityModeles.fromJson(jsonDecode(jsonResponse));
        CityList.value = cityModels.data!; }
      update();                
    } catch(e){
      print(e);
    } finally{
      _isLoading(false);
    }
  }

   





}

  


   
