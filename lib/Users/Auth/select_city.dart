import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Auth/DashBoard.dart';
import 'package:pugau/Users/Controller/city_controller.dart';
import 'package:pugau/Users/Screens/Location/select_location.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/util/theme/Pugau_images.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Screens/Location/clear_map.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({super.key, required String title});

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  final CityController _cityController = Get.put(CityController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
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
                child: Text(
              'SELECT YOUR CITY',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.4),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                      offset: const Offset(
                        10.0,
                        0.0,
                      )),
                  BoxShadow(
                      color: Colors.grey.withOpacity(.4),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                      offset: const Offset(
                        5,
                        5,
                      )),
                ],
              ),
              child: Card(
                child: SizedBox(
                  height: Helper.getScreenHeight(context) / 1.75,
                  child: GridView.builder(
                      itemCount: _cityController.CityList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 2 / 2.19),
                      itemBuilder: (Context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home(
                                        title: '',
                                      )),
                            );
                            showModalBottomSheet<void>(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  child: SizedBox(
                                    height: 230,
                                    child: Center(
                                      child: Column(children: <Widget>[
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 58,
                                          width: 58,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      Pugau_Images.location))),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Device Location Not Enable',
                                          style: TextStyle(
                                              fontSize: 12.21,
                                              fontWeight: FontWeight.w600,
                                              color: PugauColors.BLACK),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Enable your device location for a better delivery experience',
                                          style: TextStyle(
                                              fontSize: 10.21,
                                              fontWeight: FontWeight.w600,
                                              color: PugauColors.BLACK),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Center(
                                            child: MaterialButton(
                                              minWidth: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  18.2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              textColor: PugauColors.BLACK,
                                              color: PugauColors.themeColor,
                                              onPressed: (() {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CurrentLocationScreen(
                                                            title: '',
                                                          )),
                                                );
                                              }),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    'Enable location permission',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            PugauColors.WHITE),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SelectLocation(
                                                        title: '',
                                                      )),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.search,
                                                color: PugauColors.themeColor,
                                                size: 18,
                                              ),
                                              Text(
                                                'Search location manually',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        PugauColors.themeColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 144.px,
                            width: 137.px,
                            margin: EdgeInsets.only(
                                top: 30.px,
                                bottom: 15.px,
                                right: 18.px,
                                left: 18.px),
                            decoration: BoxDecoration(
                                color: PugauColors.grey,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      color: PugauColors.GREY,
                                      spreadRadius: 1,
                                      blurRadius: 5)
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5.px),
                                  width: 104.px,
                                  height: 98.px,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(AppContent
                                                  .BASE_URL +
                                              '/public/uploads/city/' +
                                              '${_cityController.CityList[index].image}'),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  height: 8.px,
                                ),
                                Container(
                                  height: 18.px,
                                  width: 123.px,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          stops: [
                                            0.0,
                                            0.33,
                                            0.66,
                                            1.0
                                          ],
                                          colors: [
                                            Gradiant.blue1,
                                            Gradiant.blue2,
                                            Gradiant.blue3,
                                            Gradiant.blue4
                                          ])
                                      // color:  Color.fromARGB(

                                      //     255, 85, 27, 247),
                                      ),
                                  child: Center(
                                      child: Text(
                                    '${_cityController.CityList[index].name}',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        );
      }),
    ));
  }
}
