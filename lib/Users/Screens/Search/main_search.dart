import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Users/Controller/Data/restaurentcontroller.dart';
import 'package:pugau/Users/Controller/Restaurent_Product_Controller.dart';
import 'package:pugau/Users/Screens/Restaurants/restaurent_datails.dart';

class MainSearch extends StatefulWidget {
  const MainSearch({super.key, required String title});

  @override
  State<MainSearch> createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
  final ReataurentController rscontroller = Get.put(ReataurentController());
  String? search;
  var focusNode = FocusNode();
  TextEditingController searching=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    focusNode: focusNode,
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    controller: searching,
                    onChanged: (String? value){
                      print(value);
                      setState(() {
                        search=value.toString();
                      });
                    },
                    textAlign: TextAlign.start,
                    //  controller: number,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      hintText: 'Pizza',
                      hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 153, 153, 153),
                              width: 1)
                          ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 153, 153, 153),
                              width: 1)
                          ),
                    ),
                  )
              ),
              TabBar(
                  indicatorColor: Colors.red,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Text('Restaurent'),
                    ),
                    Tab(
                      child: Text('Dish'),
                    )
                  ]),
              Expanded(
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Obx(() {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: rscontroller.restaurentList.length,
                        itemBuilder: (context, index) {
                          String? postion=rscontroller.restaurentList[index].userDetail!.name.toString();
                          if(searching.text.isEmpty)
                            {
                              return SizedBox();
                            }
                          else if(postion.toLowerCase().contains(searching.text.toLowerCase()))
                            {
                              return InkWell(
                                onTap: () async{
                                  await  Get.find<Resaurent_Product_Controller>().product(rscontroller.restaurentList[index].userDetail!.sellerId.toString(),"All");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RestaurentDetails(
                                          title: rscontroller.restaurentList[index].name,
                                          image: AppContent.BASE_URL +
                                              "/public/uploads/user/" +
                                              rscontroller
                                                  .restaurentList[index].image
                                                  .toString(),
                                          address: rscontroller.restaurentList[index].address, seller_id: '',
                                        )),
                                  );
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Card(
                                        elevation: 3,
                                        child: Container(
                                          height: 60,width: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(7)
                                          ),
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(AppContent.BASE_URL+"/public/uploads/user/"+rscontroller.restaurentList[index].image.toString()),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),),
                                      ),
                                      SizedBox(width: 10,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(rscontroller.restaurentList[index].userDetail!.name.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600)),
                                            SizedBox(height: 7,),
                                            Text(rscontroller.restaurentList[index].address.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }

                        },
                      );
                    }),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 3,
                          child: Container(
                            height: 60,width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)
                            ),
                            child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/pizza.png'),
                                      fit: BoxFit.cover)),
                            ),
                          ),),
                        ),
                        const SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Cheezy Pizza',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                                      SizedBox(height: 7,),
                              Text('Dish',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
