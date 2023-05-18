import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Data/Model/restaurent_model.dart';
import 'package:http/http.dart' as http;

class RestaurentControlleer extends GetxController {

  var restaurentList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    restaurentData();
  }


  Future restaurentData() async{
    try{
      var request = http.Request('GET', Uri.parse(AppContent.BASE_URL+ AppContent.RESTAURENT_PAGE));


          http.StreamedResponse response = await request.send();

          if (response.statusCode == 200) {
            print(await response.stream.bytesToString());
          }

    }catch(e){
      print(e);
    }

  }

}