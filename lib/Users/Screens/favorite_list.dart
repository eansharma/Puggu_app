import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Controller/fav_controller_show.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:pugau/widget/View/food_type.dart';
import 'package:pugau/widget/fav_restrorent_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../util/Helper/helper.dart';
import 'Search/main_search.dart';

class FevoriteList extends StatefulWidget {

  @override
  State<FevoriteList> createState() => _FevoriteListState();
}

class _FevoriteListState extends State<FevoriteList> {
  FavRestaurantShowController favRestaurantShowController = Get.put(FavRestaurantShowController());
  @override
  Widget build(BuildContext context) {
    favRestaurantShowController.fechData();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.red.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(7)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: PugauColors.themeColor,
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
                          color: PugauColors.themeColor,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.5,
                      width: Helper.getScreenWidth(context) / 3.8,
                      color: PugauColors.GREY,
                      padding: const EdgeInsets.only(
                        top: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(favRestaurantShowController.list.length.toString()+' FAVORITES RESRAURENTS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: PugauColors.BLACK,
                            fontSize: 10,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 1.5,
                        width: Helper.getScreenWidth(context) / 3.8,
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
              
              // Food_Type_List()
              FavRestrorentList()
            ],
          ),
        ),
      ),
    );
  }
}
