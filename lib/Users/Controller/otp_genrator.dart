// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:pugau/utll/Base/base_api.dart';

// class OTPController extends GetxController {
//   RxString otp = ''.obs;
//   RxBool isLoading = false.obs;

//   Future<void> generateOTP(String phone) async {
//     try {
//       isLoading.value = true;

//       final response = await http.post(
//           Uri.parse(AppContent.BASE_URL + AppContent.OTP_GENRATION_URL),
//           body: {'phone': phone});
//       var res = jsonDecode(response.body);

//       if (res['code'] == 200) {
//       } else {}
//     } catch (e) {
//       throw Exception('Error generating OTP: $e');
//     } finally {
//       isLoading.value = false;
//       // print('OTP: ${otp.value}');
//     }
//   }
// }
