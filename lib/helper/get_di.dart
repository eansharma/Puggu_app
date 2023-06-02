import 'package:get/get.dart';
import 'package:pugau/Users/Controller/AuthController/login_controller.dart';
import 'package:pugau/Users/Controller/Restaurent_Product_Controller.dart';
import 'package:pugau/Users/Controller/TopOffers_Controller.dart';
import 'package:pugau/Users/Controller/banner_controller.dart';
import 'package:pugau/Users/Controller/categorycontroller.dart';
import 'package:pugau/Users/Controller/fav_controller_show.dart';
import 'package:pugau/Users/Controller/view_card_controller.dart';
import 'package:pugau/Users/Genie_Controller/Genie_Controller_send.dart';

import '../Users/Controller/Order/customer_review_controller.dart';

Future<Map<String, Map<String, String>>> init() async {
  Get.lazyPut(() => TopOfferController());
  Get.lazyPut(()=>Genie_Controller());
  Get.lazyPut(()=>ViewCardController());
  Get.put(AuthController().login_check());
  Get.put(CategoryController().fetchRestaurentData());
  Get.put(BannerController().fetchData());
  Get.put(FavRestaurantShowController().fechData());
  Get.put(Resaurent_Product_Controller().product('',"All"));
  Get.put(CustomerReviewController().review());
  
  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  return _languages;
}
