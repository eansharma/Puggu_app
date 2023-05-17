import 'package:flutter/material.dart';
import 'package:pugau/Users/Screens/Restaurants/restaurent_datails.dart';
import 'package:pugau/util/Helper/helper.dart';
import 'package:pugau/util/theme/Pugau_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Food_Type_List extends StatefulWidget {
  const Food_Type_List({super.key});

  @override
  State<Food_Type_List> createState() => _Food_Type_ListState();
}

class _Food_Type_ListState extends State<Food_Type_List> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const RestaurentDetails(
                  // title: '',
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: Helper.getScreenWidth(context),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.4),
              blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: const Offset(
                0.0,
                2.0,
              )),
        ], borderRadius: BorderRadius.circular(11), color: Colors.green),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              child: Center(
                child: Text('PURE VEG RESRAURENT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Container(
              height: 25.h,
              width: Helper.getScreenWidth(context),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/burger.png'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _isFavorite = !_isFavorite;
                      }),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _isFavorite == true
                              ? const Icon(Icons.favorite,
                                  color: Colors.red, size: 30)
                              : const Icon(Icons.favorite_border,
                                  color: Colors.red, size: 30)),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 4.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                color: Colors.blue.withOpacity(0.9)),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                '30 % Of on entire menu',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 4.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                color: Colors.blue.withOpacity(0.9)),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                '30 % Of on entire menu',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 17),
                        child: Container(
                          height: 25,
                          width: 88,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.alarm,
                                color: Colors.green,
                                size: 18,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                '30 min | 2 km',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 15.h,
              width: Helper.getScreenWidth(context),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(11),
                      bottomRight: Radius.circular(11))),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Burger House',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '4.5',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.white,
                              ),
                              Text(
                                'Rating',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Text(
                          'Fast food ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.circle,
                          size: 7,
                        ),
                        Text(
                          ' Desserts ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.circle,
                          size: 7,
                        ),
                        Text(
                          ' Beverages',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          decoration: BoxDecoration(
                              color: PugauColors.pinkCard,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(
                              'BESTSELLER',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          height: 25,
                          decoration: BoxDecoration(
                              color: PugauColors.pinkCard,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(
                              'MUSTRY',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          height: 25,
                          decoration: BoxDecoration(
                              color: PugauColors.pinkCard,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(
                              'NEWLYOPEN',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 25,
                          decoration: BoxDecoration(
                              color: PugauColors.blueCard,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Text(
                              'OPEN NOW',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: PugauColors.BLACK,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 18,
                      width: Helper.getScreenWidth(context),
                      decoration: BoxDecoration(
                          color: Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Best burger in the town',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: PugauColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}