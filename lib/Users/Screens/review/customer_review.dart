import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pugau/util/Helper/helper.dart';
import '../../Controller/Order/customer_review_controller.dart';

class CustomerReview extends StatefulWidget {
  const CustomerReview({Key? key, required String title}) : super(key: key);

  @override
  State<CustomerReview> createState() => _CustomerReviewState();
}

class _CustomerReviewState extends State<CustomerReview> {
  final CustomerReviewController custController = Get.put<CustomerReviewController>(CustomerReviewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios, size: 18,),
                  ),
                  const Text(
                    'Customer Review',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color.fromARGB(255, 168, 167, 167)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color.fromARGB(255, 168, 167, 167)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: GetBuilder<CustomerReviewController>(
                  builder: (cusController) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: cusController.review_list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 168, 167, 167),
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/customerreview.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  width: Helper.getScreenWidth(context) / 1.24,
                                  color: Colors.pink.withOpacity(0.1),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cusController.review_list[index].restrorentDetails!.name.toString(),
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                // 'JAN 26 2023 SUNDAY 06:00 PM',
                                                cusController.review_list[index].restrorentDetails!.timing.toString(),
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(255, 143, 142, 142),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 20,
                                            width: 68,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 252, 206, 221),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  RatingBar.builder(
                                                    itemSize: 10,
                                                    // initialRating: 3,
                                                    initialRating: double.parse(custController.review_list[index].rating.toString(),),
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                                                    itemBuilder: (context, _) => Icon(
                                                      Icons.star,
                                                      size: 10,
                                                      color: Colors.red,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10,),
                                      Text(
                                        custController.review_list[index].comment.toString(),
                                        
                                        
                                        // 'This is the review description This is the review description This is the review',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 148, 146, 146),
                                        ),
                                      ),
                                      const SizedBox(height: 3,),
                                       Text(
                                       cusController.review_list[index].restrorentDetails!.description.toString(),
                                        // 'This is the review description This is the review description This is the review',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 148, 146, 146),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
