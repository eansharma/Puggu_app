import 'package:flutter/material.dart';

class MainSearch extends StatefulWidget {
  const MainSearch({super.key, required String title});

  @override
  State<MainSearch> createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    //  controller: number,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      prefixIcon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      hintText: 'Pizza',
                      hintStyle:
                          const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 153, 153, 153),
                              width: 1)
                          //<-- SEE HERE
                          ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 153, 153, 153),
                              width: 1)

                          //<-- SEE HERE
                          ),
                    ),
                  )),
              const TabBar(
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
                              Text('Karnavati Restaurent',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                                      SizedBox(height: 7,),
                              Text('Narayanpath, bhairahwa',
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
