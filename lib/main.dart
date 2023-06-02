import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Controller/Restaurent_Product_Controller.dart';
import 'package:pugau/widget/splashscreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Users/Controller/AuthController/login_controller.dart';
import 'helper/get_di.dart' as di;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  Get.put(AuthController()); // Register the AuthController
     Get.put(Resaurent_Product_Controller());
    
    return ResponsiveSizer(
      builder: (context, Orientation, ScreenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pagau',
          navigatorKey: Get.key,
          home: Splash_screen(),
        );
      },
    );
  }
}
