import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Users/Controller/food_controller.dart';
import 'package:pugau/Users/Screens/favorite.dart';
import 'package:pugau/util/theme/Pugau_Styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class category_food extends StatefulWidget {
  const category_food({super.key});

  @override
  State<category_food> createState() => _category_foodState();
}

class _category_foodState extends State<category_food> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 32.h,
        child: GetBuilder<FoodController>(
          builder: (controller) {
            return GridView.builder(
                itemCount: controller.myFood.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 3.54 / 2.3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Fevorite(title: '')),
                        );
                      },
                      child: Column(children: [
                        Container(
                          width: 18.w,
                          height: 12.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(AppContent.BASE_URL +
                                      AppContent.food_imgae +
                                      controller.myFood[index].image
                                          .toString()),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(controller.myFood[index].title.toString(),
                            textAlign: TextAlign.center, style: regularTitle)
                      ]));
                });
          },
        ));
  }
}
