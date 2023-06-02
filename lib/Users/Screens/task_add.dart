import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pugau/Users/Genie_Controller/Genie_Controller_send.dart';
import 'package:pugau/Users/Screens/Genie/genie_billing.dart';
import 'package:pugau/Users/Screens/select_task_category.dart';
import 'package:pugau/widget/customSnakebar.dart';

import '../../util/Helper/helper.dart';
import '../Controller/Roll_controller.dart';

class TaskAdd extends StatefulWidget {
  String km, tasktitel, package_type, task;
  TaskAdd({
    required this.km,
    required this.tasktitel,
    required this.package_type,
    required this.task,
  });

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  var _selectedrole;
  final List<String> _selectrole = ['Giver', 'Receiver']; // Option 2

  var _selectedTime;

  late File imageFile;

  TextEditingController taskTitle = TextEditingController();
  TextEditingController description = TextEditingController();
  // Future<DateTime?> _selectDateTime(BuildContext context) async {
  //   DateTime? selectedDateTime;
  //   await DatePicker.showDateTimePicker(context,
  //       showTitleActions: true,
  //       minTime: DateTime(2018, 3, 5),
  //       maxTime: DateTime(2023, 6, 7), onChanged: (date) {
  //     print('change $date');
  //     _selectedTime = date.toString();
  //   }, onConfirm: (date) {
  //     _selectedTime = date.toString();
  //     setState(() {});
  //   }, currentTime: DateTime.now());
  //   return selectedDateTime;
  // }

  final picker = ImagePicker();
  File? galleryFile;

  getLocalImage() async {
    var _galleryFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      galleryFile = File(_galleryFile!.path);
      print(galleryFile.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Genie_Controller>(builder: (genie) {
      taskTitle.text = widget.tasktitel != null ? widget.tasktitel : "";
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height / 16,
            child: Center(
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 16,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                textColor: Colors.black,
                color: Colors.red,
                onPressed: (() {
                  if (taskTitle.text.isEmpty) {
                    showCustomSnackBar("Task title is Empty", isError: true);
                  } else if (widget.package_type == null) {
                    showCustomSnackBar("Package type is Empty", isError: true);
                  } else if (_selectedTime == null) {
                    showCustomSnackBar("Time is Empty", isError: true);
                  } else if (description.text.isEmpty) {
                    showCustomSnackBar("Description is Empty", isError: true);
                  } else {
                    genie.add_task_details(
                        widget.package_type.toString(),
                        taskTitle.text,
                        description.text,
                        _selectedTime.toString(),
                        widget.km.toString(),
                        _selectedrole.toString(),
                        widget.task.toString());
                  }
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SAVE TASK DETAILS',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
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
                const Center(
                  child: Text('Task Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 117,
                  width: Helper.getScreenWidth(context),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 151, 18, 8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: Helper.getScreenWidth(context) / 2,
                        child: const Text(
                            'Delivery of alchohol or any illegal items is prohibitated by law.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/taskaddbottle.png'))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('assets/images/taskadd.png'),
                              height: 50,
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),

                // TextFormField
                Padding(
                  padding: const EdgeInsets.only(
                    left: 22,
                    right: 22,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        child: Text('Task Title',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  height: 35,
                                  width: Helper.getScreenWidth(context),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.1)),
                                  child: Center(
                                    child: TextFormField(
                                      textAlign: TextAlign.start,
                                      controller: taskTitle,
                                      textAlignVertical: TextAlignVertical.top,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                      decoration: const InputDecoration(
                                        hintText: 'Task Title',
                                        hintStyle:
                                            TextStyle(color: Colors.black54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        child: const Text('Select Package Type',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectTaskCategory(
                                      km: widget.km,
                                      tasktitel: taskTitle.text,
                                      package_type: '',
                                      task: 'task',
                                    )),
                          );
                        },
                        child: Container(
                          height: 35,
                          width: Helper.getScreenWidth(context),
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                Text(
                                  widget.package_type ?? 'Food Items',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        child: const Text('Select Your Role',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 35,
                        width: Helper.getScreenWidth(context),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: DropdownButton(
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 15,
                                ),
                                hint: Text(
                                  'Role',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                value: _selectedrole,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedrole = newValue!;
                                  });
                                },
                                // items: _roleController.roleData.map((location) {
                                items: _selectrole.map((location) {
                                  return DropdownMenuItem(
                                    value: location.toString(),
                                    child: Text(location.toString()),
                                  );
                                }).toList(),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),

                // Select Role
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),

                      // Container(
                      //   height: 35,
                      //   width: Helper.getScreenWidth(context),
                      //   decoration: BoxDecoration(border: Border.all(width: 1)),
                      //   child: DropdownButtonHideUnderline(
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 5, vertical: 5),
                      //       child: DropdownButton(
                      //         style: const TextStyle(
                      //             fontSize: 13, color: Colors.black),
                      //         icon: const Icon(
                      //           Icons.keyboard_arrow_down_outlined,
                      //           size: 15,
                      //         ),
                      //         hint: const Text(
                      //           'Date & Time',
                      //           style: TextStyle(
                      //               fontSize: 12,
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.w400),
                      //         ),
                      //         value: _selecteddate,
                      //         onChanged: (newValue) {
                      //           setState(() {
                      //             _selecteddate = newValue!;
                      //           });
                      //         },
                      //         items: _selectrole.map((location) {
                      //           return DropdownMenuItem(
                      //             value: location,
                      //             child: Text(location),
                      //           );
                      //         }).toList(),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),

                // Pick Time
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        child: const Text('Schedule pickup Date-Time(Option)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          // _selectedTime = _selectDateTime(context).toString();
                        },
                        child: Container(
                          height: 35,
                          width: Helper.getScreenWidth(context),
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                Text(
                                  _selectedTime != null
                                      ? '${_selectedTime.toString()}'
                                      : 'No time selected'.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          //  child: DropdownButtonHideUnderline (
                          //                         child: Padding(
                          //                           padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          //                           child: DropdownButton(
                          //                             style: TextStyle(fontSize: 12,color: Colors.black),
                          //                             icon: Icon( Icons.keyboard_arrow_down_outlined,size: 15,),
                          //                             hint: Text('Food Items',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w400),),
                          //                                     value: _selectedpackage,
                          //                                     onChanged: (newValue) {
                          //                                       setState(() {
                          //                                         _selectedpackage = newValue!;
                          //                                       });
                          //                                     },
                          //                                     items: _package.map((location) {
                          //                                       return DropdownMenuItem(
                          //                                         child: new Text(location),
                          //                                         value: location,
                          //                                       );
                          //                                     }).toList(),
                          //                                   ),
                          //                         ),
                          //                       ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(child: StopwatchWidget()),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 10),
                  child: Container(
                    child: const Text('Add Task Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Container(
                    width: Helper.getScreenWidth(context) / 1.15,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.red.withOpacity(0.4))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 19),
                            width: Helper.getScreenWidth(context) / 1.15,
                            child: TextFormField(
                              maxLines: 11,
                              minLines: 11,
                              keyboardType: TextInputType.multiline,
                              textAlign: TextAlign.start,
                              controller: description,
                              textAlignVertical: TextAlignVertical.top,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                hintText: 'Enter Task Details',
                                border: InputBorder.none,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 6),
                            width: Helper.getScreenWidth(context) / 4,
                            color: Colors.pinkAccent.withOpacity(0.4),
                            child: GestureDetector(
                              // print("PICK IMAGE");
                              onTap: () {
                                getLocalImage();
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('ADD PHOTOS',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400)),
                                  Icon(
                                    Icons.camera_enhance,
                                    color: Colors.pinkAccent.withOpacity(0.4),
                                    size: 17,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Show PICK Image
                galleryFile == null
                    ? Center(
                        child: Container(
                          height: 60,
                          width: Helper.getScreenWidth(context) / 1.14,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.red.withOpacity(0.4))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: Helper.getScreenWidth(context) / 1.6,
                                child: const Text(
                                    'For order involving payments , please pay to thestore or seller directly .',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 57,
                                width: 57,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/taskaddpayment.png'))),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.blue),
                                    child: Image(
                                        image: FileImage(galleryFile!),
                                        width: Helper.getScreenWidth(context) /
                                            1.14,
                                        height: 60,
                                        fit: BoxFit.cover)),
                                Positioned(
                                    right: 20,
                                    top: 20,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          galleryFile = null;
                                        });
                                      },
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),

                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
