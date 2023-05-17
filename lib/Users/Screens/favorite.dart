import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pugau/Users/Controller/food_controller.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:pugau/widget/View/food_type.dart';

import '../../util/Helper/helper.dart';
import 'Search/main_search.dart';

class Fevorite extends StatefulWidget {
  const Fevorite({super.key, required String title});

  @override
  State<Fevorite> createState() => _FevoriteState();
}

class _FevoriteState extends State<Fevorite> {
  bool _isSelect = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainSearch(
                            title: '',
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.red.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(7)),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.red,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search rastaurent name or dish name',
                        style: TextStyle(fontSize: 12),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_voice,
                        color: Colors.red,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const PlaceOnOrder(
                //             title: '',
                //           )),
                // );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.4, color: Colors.black),
                          borderRadius: BorderRadius.circular(7),
                          color: PugauColors.litePink),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.location_pin,
                              color: Colors.red,
                              size: 12,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Near by',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w700),
                            ),
                            Spacer(),
                            Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: GridView.builder(
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, childAspectRatio: 2 / 6),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Container(
                                height: 25,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.4, color: Colors.black),
                                    borderRadius: BorderRadius.circular(7)),
                                child: const Center(
                                  child: Text(
                                    'Fast Delivery',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: Helper.getScreenHeight(context) / 6.1,
                child: GetBuilder<FoodController>(builder: (controller) {
                  return GridView.builder(
                      itemCount: controller.myFood.length,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 3.3 / 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => setState(() {
                            _isSelect = !_isSelect;
                          }),
                          child: Column(
                            children: [
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: _isSelect == true
                                            ? Colors.red
                                            : Colors.black),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            AppContent.BASE_URL +
                                                AppContent.food_imgae +
                                                controller.myFood[index].image
                                                    .toString()),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(controller.myFood[index].title.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: _isSelect == true
                                          ? Colors.red
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        );
                      });
                })),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.5,
                    width: Helper.getScreenWidth(context) / 2.9,
                    color: PugauColors.GREY,
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('30 RESRAURENTS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 1.5,
                      width: Helper.getScreenWidth(context) / 2.9,
                      color: PugauColors.GREY,
                      padding: const EdgeInsets.only(
                        top: 2,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Food_Type_List(),
          ],
        ),
      ),
    );
  }
}
