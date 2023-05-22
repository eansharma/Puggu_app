import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Screens/Genie/genie_billing.dart';
import 'package:pugau/Users/Screens/select_task_category.dart';
import 'package:intl/intl.dart';
import '../../util/Helper/helper.dart';
import '../../util/theme/Pugau_theme_colors.dart';
import '../Controller/Roll_controller.dart';

class TaskAdd extends StatefulWidget {
  const TaskAdd({super.key, required String title});

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  final List<String> _package = ['ABCD', 'EFGH', 'IJKL']; // Option 2
  var _selectedpackage;
  final List<String> _role = ['ABCD', 'EFGH', 'IJKL']; // Option 2
  var _selectedrole;
  final List<String> _date = ['ABCD', 'EFGH', 'IJKL']; // Option 2
  var _selecteddate;
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  final RoleController _roleController = Get.put(RoleController());
  @override
  Widget build(BuildContext context) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GenieBilling(
                            title: '',
                          )),
                );
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
                              builder: (context) => const SelectTaskCategory(
                                    title: '',
                                  )),
                        );
                      },
                      child: Container(
                        height: 35,
                        width: Helper.getScreenWidth(context),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: const [
                              Text(
                                'Food Items',
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
                            child: Obx(() {
                              return DropdownButton(
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 15,
                                ),
                                hint: const Text(
                                  'Select Your Role',
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
                                items: _roleController.roleData.map((location) {
                                  return DropdownMenuItem(
                                    value: location,
                                    child: Text(location.name.toString()),
                                  );
                                }).toList(),
                              );
                            })),
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
                      child: const Text('Schedule picup Date-Time(Option)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
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
                    //         items: _date.map((location) {
                    //           return DropdownMenuItem(
                    //             value: location,
                    //             child: Text(location),
                    //           );
                    //         }).toList(),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        _selectTime(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border:
                                Border.all(width: 1, color: PugauColors.BLACK)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          child: Text(_selectedTime != null
                              ? '${DateFormat.jm().format(DateTime(2023, 1, 1, _selectedTime!.hour, _selectedTime!.minute))}'
                              : "Pick Time"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
                            //  controller: number,
                            textAlignVertical: TextAlignVertical.top,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                              hintText: 'Enter Task Details',
                              border: InputBorder.none,
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(7),
                              //     borderSide: BorderSide(color: Colors.red.withOpacity(0.4),width: 1)
                              //<-- SEE HERE
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 6),
                          width: Helper.getScreenWidth(context) / 4,
                          color: Colors.pinkAccent.withOpacity(0.4),
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
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: Helper.getScreenWidth(context) / 1.14,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.red.withOpacity(0.4))),
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
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
