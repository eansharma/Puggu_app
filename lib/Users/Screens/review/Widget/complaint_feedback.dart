import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Controller/AuthController/login_controller.dart';
import 'package:pugau/Users/Controller/Feedback_form_controller.dart';

import 'package:pugau/Users/Controller/city_controller.dart';
import 'package:pugau/Users/Screens/review/Widget/feedback.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComplaintFeedback extends StatefulWidget {
  const ComplaintFeedback({super.key, required String title});

  @override
  State<ComplaintFeedback> createState() => _ComplaintFeedbackState();
}

class _ComplaintFeedbackState extends State<ComplaintFeedback> {
  final List<String> Type = ['Complaint', 'Feedback']; // Option 2
  var _selectedLocation;
  var _selectedType;
  bool isOpen = false;
  var _selectedLocationId;
  final ComplaintFeedController _feedbackController =
      Get.put(ComplaintFeedController());
  final TextEditingController feedback = TextEditingController();
  final CityController _cityController = Get.put(CityController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: GetBuilder<ComplaintFeedController>(
          builder: (_feedbackController) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.5,
                      width: Helper.getScreenWidth(context) / 6.65,
                      color: const Color.fromARGB(255, 153, 153, 153),
                      padding: const EdgeInsets.only(
                        top: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('Complaint & Feedback Form',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 1.5,
                        width: Helper.getScreenWidth(context) / 6.65,
                        color: const Color.fromARGB(255, 153, 153, 153),
                        padding: const EdgeInsets.only(
                          top: 2,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Type',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Aditya
                          Container(
                            height: 30,
                            width: Helper.getScreenWidth(context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(width: 1)),
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: DropdownButton(
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 15,
                                    ),
                                    hint: const Text(
                                      'Select Type',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    value: _selectedType,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedType = newValue!;
                                      });
                                    },
                                    items: Type.map((location) {
                                      return DropdownMenuItem(
                                        value: location,
                                        child: Text(location.toString()),
                                      );
                                    }).toList(),
                                  )),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            child: const Text('Write Your Feedback',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(height: 5),
                          Container(
                              child: TextFormField(
                            maxLines: 11,
                            minLines: 11,
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.start,
                            controller: feedback,
                            textAlignVertical: TextAlignVertical.top,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 153, 153, 153),
                                      width: 1)
                                  //<-- SEE HERE
                                  ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 153, 153, 153),
                                      width: 1)

                                  //<-- SEE HERE
                                  ),
                            ),
                          )),
                          const SizedBox(height: 15),
                          Container(
                            child: const Text('Select City',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 30,
                            width: Helper.getScreenWidth(context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(width: 1)),
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Obx(
                                    () => DropdownButton(
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 15,
                                      ),
                                      hint: Text(
                                        'Choose City',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      value: _selectedLocation,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedLocation = newValue!;
                                          // _selectedLocationId =
                                          //     newValue; // Assign the selected location ID
                                        });
                                      },
                                      items: _cityController.CityList.map(
                                          (location) {
                                        return DropdownMenuItem(
                                          value: location.id,
                                          child: Text(location.name.toString()),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Center(
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 23,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    textColor: Colors.black,
                    color: Colors.green,
                    onPressed: () {
                      if (_selectedType == null) {
                        showCustomSnackBar('Please select your type!',
                            isError: true);
                      } else if (feedback.text.isEmpty) {
                        showCustomSnackBar('Complaint box is empty!',
                            isError: true);
                      } else if (_selectedLocation == null) {
                        showCustomSnackBar('Please select your city!',
                            isError: true);
                      } else {
                        _feedbackController.complain_fedd(
                            _selectedType.toString(),
                            feedback.text.toString(),
                            _selectedLocation.toString(),
                            "",
                            "");
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'SUBMIT',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void _popup() {
    AwesomeDialog(
      dialogBackgroundColor: Colors.white,
      transitionAnimationDuration: Duration(milliseconds: 400),
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        child: Column(
          children: [
            Text(
              'Test Usertest Your feedback has been successfully submitted',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/submitfeedback.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              'Your feedback is in review',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        // blurRadius: 2.0,
                        spreadRadius: 2.0,
                        offset: const Offset(
                          0.0,
                          1.0,
                        )),
                  ],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Feedback Type:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text('Feedback',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text('Feedback Message:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 20,
                          ),
                          Text('This is Feedback Description',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const Text('Thank You We Love Your Review',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyFeedback(title: '')),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 228, 228),
                    borderRadius: BorderRadius.circular(4)),
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text('VIEW MY FEEDBACK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    ).show();
  }
}
