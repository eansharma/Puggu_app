import 'package:flutter/material.dart';
import 'package:pugau/Users/Screens/Genie/select_genie_drop_location.dart';
import 'package:pugau/Users/Screens/Genie/select_genie_picup_location.dart';
import 'package:pugau/Users/Screens/set_your_task.dart';

import '../../../util/Helper/helper.dart';

class GeniePicup extends StatefulWidget {
  const GeniePicup({super.key, required String title});

  @override
  State<GeniePicup> createState() => _GeniePicupState();
}

class _GeniePicupState extends State<GeniePicup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1.5,
                width: Helper.getScreenWidth(context) / 4,
                color: const Color.fromARGB(255, 153, 153, 153),
                padding: const EdgeInsets.only(
                  top: 2,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text('SET PIC & DROP DETAILS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                width: 5,
              ),
              Container(
                  height: 1.5,
                  width: Helper.getScreenWidth(context) / 4,
                  color: const Color.fromARGB(255, 153, 153, 153),
                  padding: const EdgeInsets.only(
                    top: 2,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Container(
                  height: 117,
                  width: Helper.getScreenWidth(context),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: Helper.getScreenWidth(context) / 2.3,
                        child: const Text(
                            'Sending high value / fragile items is not recommended',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/geniepicup.png'))),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 75,
                  left: 40,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SelectGeniePicupLocation(
                                      title: '',
                                    )),
                          );
                        },
                        child: Container(
                          height: 36,
                          width: Helper.getScreenWidth(context) / 1.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 141, 140, 140)),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 1,
                                        )),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Text('A',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text('Choose Pickup Address',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  const Spacer(),
                                  const Icon(
                                    Icons.add_circle,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SelectGenieDropLocation(
                                      title: '',
                                    )),
                          );
                        },
                        child: Center(
                          child: Container(
                            height: 36,
                            width: Helper.getScreenWidth(context) / 1.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 141, 140, 140)),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 1,
                                          )),
                                      child: const Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Text('B',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text('Choose drop Address',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SetYourTask(
                                      title: '',
                                    )),
                          );
                        },
                        child: Center(
                          child: Container(
                            height: 36,
                            width: Helper.getScreenWidth(context) / 1.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 141, 140, 140)),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.edit_document,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Add task details',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
