import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Users/Controller/categorycontroller.dart';
import 'package:pugau/Users/Screens/Search/mart_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../util/Helper/helper.dart';
import '../../util/theme/Pugau_theme_colors.dart';
import '../Controller/sub_category_controller.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({super.key, required String title});

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
     
   final CategoryController _categoryController = Get.put(CategoryController());
   final SubCategoryController _subCategoryController = Get.put(SubCategoryController());
     

  bool _isSelected=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
        backgroundColor: PugauColors.WHITE,
        toolbarHeight: 70,
        elevation: 0,
        leading: GestureDetector(onTap: () {
                                         Navigator.pop(context);
                                       },
                                       child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),
                                       ),
                                      
                                      title: GestureDetector(
                    onTap: () {
                    
                     _dialog();
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 5.10.h,width: 20.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/martflower.png'),fit: BoxFit.cover)
                          ),
                        ),const SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Hot Deals',textAlign: TextAlign.center, 
                             style: TextStyle( color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700)),
                           Text('510 items',textAlign: TextAlign.center, 
                             style: TextStyle( color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(width: 3,),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 207, 207, 207)
                          ),
                          child: Icon(Icons.arrow_drop_down,size: 20,),
                        ),
                      ],
                    ),
                  ),

                  actions: [
                    
                     GestureDetector(
                    onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MartSearch(title: '')));
                    },
                     child: Padding(
                       padding: const EdgeInsets.all(12),
                       child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 207, 207, 207)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.search,size: 19,),
                            ),
                          ),
                     ),
                   )                   
                
                  ],
                 
                 
      ),
    
        body: SingleChildScrollView(
          child: Column(
            children: [
             
               SizedBox(height: 2.h,),
                Stack(
                  children: [
                    Container(
                      
                      height: 0.15.h,width: MediaQuery.of(context).size.width,color:  Color.fromARGB(255, 207, 207, 207),),
                  ],
                ),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(
                    width: MediaQuery.of(context).size.width/4.9,
                    height: 85.h,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSelected=!_isSelected;
                        });
                      },
                      child: Obx(() {
                        return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemCount: _categoryController.categoryList.length,
                        itemBuilder:(context,index){
                        return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                                  child: Column(
                                    children: [
                                       Container(
                                    height: 8.h,
                                    width:15.w,
                                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(AppContent.BASE_URL +
                            '/public/uploads/menu/' +'${_categoryController.categoryList[index].image}'),
                        fit: BoxFit.cover,
                      ),
                                    )
                                  ),
                                  SizedBox(height: 0.3.h,),
                                   SizedBox(
                                    width: 12.w,
                                     child: Text('${_categoryController.categoryList[index].title}',textAlign: TextAlign.center, 
                                         style: TextStyle( color: _isSelected==false? Colors.black:Colors.red,fontSize: 14.sp,fontWeight: FontWeight.w700)),
                                   ),
                                    ],
                                  ),
                               
                               
                               
                                ),
                      
                      
                      
                      
                        );
                      });
                   
                  
                      })
                   
                    ),
                   ), 
                   Container(width: 0.5.w,height: MediaQuery.of(context).size.height/1.16,color: const Color.fromARGB(255, 207, 207, 207),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 23,top: 10,bottom: 7),
                      child: Row(
                        children: [
                          Text('79 Items',textAlign: TextAlign.center, 
                                           style: TextStyle( color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w700)),
                      Text(' In Hot Deals',textAlign: TextAlign.center, 
                                           style: TextStyle( color: Colors.black,fontSize: 13.sp,fontWeight: FontWeight.w400)), 
                        ],
                      ),
                    ),
                 Container(
                  color: const Color.fromARGB(255, 207, 207, 207), height: 0.2.h,width: 20) ,
                  
                  Row(
            
                    children: [
              
                     SizedBox(
                        width: MediaQuery.of(context).size.width-21.6.w,
                        height: MediaQuery.of(context).size.height,
          
                        child:
                     SingleChildScrollView(
                        child: Obx(() {
                          return GridView.builder(
                          scrollDirection: Axis.vertical,
                          // itemCount: 10,
                          itemCount: _subCategoryController.subList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2.4 / 3.4,
                          ),
                          itemBuilder: (context, index) {
                            var data = _subCategoryController.subList[index];
                            return GestureDetector(
                              onTap: () {
                                category();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(1),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.5, color: Color.fromARGB(255, 207, 207, 207)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: SizedBox(
                                                width: 9.w,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                                                  child: Text(
                                                    '${data.discount}'+'% OFF',
                                                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.only(left: 30),
                                              child: Container(
                                                height: 9.h,
                                                width: 10.w,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage('${data.image}'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          // 'Anuj',
                                          '${data.title}',
                                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '${data.type}',
                                          style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '${data.qty}',
                                          style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${data.actualPrice}',
                                              style: TextStyle(color: Color.fromARGB(255, 207, 207, 207), fontSize: 14, fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              '\$'+'${data.unit}',
                                              style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(width: 5),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  width: 13.w,
                                                  height: 4.h,
                                                  child: Card(
                                                    child: Center(child: Text('ADD', style: TextStyle(color: Colors.green, fontSize: 15, fontWeight: FontWeight.w500))),
                                                  ),
                                                ),
                                                Text(
                                                  'Options',
                                                  style: TextStyle(color: Color.fromARGB(255, 185, 185, 185), fontSize: 14, fontWeight: FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                     
                     
                        })
                     
                      )
                  
        
                      ),
                  
                  
                  
                    ],
                  ), 
                 
                 
                  ],
                ),
                 ],
               ),
            ],
          ),
        ),
      ),
    );
  }
  void category(){
     showModalBottomSheet<void>(
                                  shape:const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10) )
                                    ) ,
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 350,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       SizedBox(height: 10.h,),
                       const Padding(
                         padding: EdgeInsets.symmetric(horizontal: 6,vertical: 10),
                         child: Text('FORTUNE BEASAN FLOUR',textAlign: TextAlign.center, 
                         style: TextStyle( color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600)),
                       ),
                        SizedBox(height: 10.w,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: Helper.getScreenWidth(context),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: const Color.fromARGB(255, 185, 185, 185)),
                            borderRadius: BorderRadius.circular(7)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6,right: 20,top: 6,bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                 Container(
                                                                    decoration: BoxDecoration(
                                                                      color: Colors.orange,
                                                                      borderRadius: BorderRadius.circular(4)
                                                                    ),
                                                                    child:   SizedBox(
                                                                      width: 20.w,
                                                                      child: Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: 2,vertical: 1),
                                                                        child: Text('18% OFF',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.w500),),
                                                                      )),
                                                                  ),
                                 Container(
                                  height: 60.w,width: 50.w,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/images/martrice.png'),fit: BoxFit.cover)
                                  ),
                                 ),
                                 const SizedBox(width: 10,),
                                 const Text('500g',textAlign: TextAlign.center, 
                                                   style: TextStyle( color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400)),          
                              const SizedBox(width: 40,),
                                        Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Text('\$660',textAlign: TextAlign.center, 
                                   style: TextStyle( color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500)),
                                             Text('\$760',textAlign: TextAlign.center, 
                                                   style: TextStyle( color: Color.fromARGB(255, 185, 185, 185),fontSize: 10,fontWeight: FontWeight.w500)),
                                              ],
                                            ),
                                            const Text('\$82.4/100g',textAlign: TextAlign.center, 
                                                   style: TextStyle( color: Colors.red,fontSize: 10,fontWeight: FontWeight.w500)),
                                          ],
                                        ), 
                                        const Spacer(),    
                                         const Text('ADD',textAlign: TextAlign.center, 
                                                   style: TextStyle( color: Colors.green,fontSize: 12,fontWeight: FontWeight.w500)),     
                                           ],
                            ),
                          ),
                        ),
                      ),
                       const SizedBox(height: 20,),
                        Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: Helper.getScreenWidth(context),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: const Color.fromARGB(255, 185, 185, 185)),
                            borderRadius: BorderRadius.circular(7)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6,right: 20,top: 6,bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                 Container(
                                                                    decoration: BoxDecoration(
                                                                      color: Colors.orange,
                                                                      borderRadius: BorderRadius.circular(4)
                                                                    ),
                                                                    child:  const SizedBox(
                                                                      width: 20,
                                                                      child: Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: 2,vertical: 1),
                                                                        child: Text('18% OFF',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.w500),),
                                                                      )),
                                                                  ),
                                 Container(
                                  height: 60,width: 50,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/images/martrice.png'),fit: BoxFit.cover)
                                  ),
                                 ),
                                 const SizedBox(width: 10,),
                                 const Text('500g',textAlign: TextAlign.center, 
                                                   style: TextStyle( color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400)),          
                              const SizedBox(width: 40,),
                                        Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Text('\$660',textAlign: TextAlign.center, 
                                   style: TextStyle( color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500)),
                                             Text('\$760',textAlign: TextAlign.center, 
                                                   style: TextStyle( color: Color.fromARGB(255, 185, 185, 185),fontSize: 10,fontWeight: FontWeight.w500)),
                                              ],
                                            ),
                                            const Text('\$82.4/100g',textAlign: TextAlign.center, 
                                                   style: TextStyle( color: Colors.red,fontSize: 10,fontWeight: FontWeight.w500)),
                                          ],
                                        ), 
                                        const Spacer(),    
                                         const Text('ADD',textAlign: TextAlign.center, 
                                                   style: TextStyle( color: Colors.green,fontSize: 12,fontWeight: FontWeight.w500)),     
                                           ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                     Center(
                                    child: MaterialButton(minWidth: MediaQuery.of(context).size.width,
                                    
                                     height: MediaQuery.of(context).size.height/18.2,
                                     textColor: Colors.black,
                                     color: Colors.green,
                                     onPressed: (() {
                                   //            Navigator.push(
                                   //    context,
                                   //    MaterialPageRoute(builder: (context) => const ResetPassword  (title: '',)),
                                   //  );
                                    }
                                    
                                    ),
                                    child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                      
                     Text('Item total\$0',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),),
                     Spacer(),
                                       Text('Done',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),),
                                      ],
                                    ),
                                    ),
                                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
   void _dialog() {
   AwesomeDialog(
    transitionAnimationDuration: const Duration(milliseconds: 400),
    width: Helper.getScreenWidth(context),
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.noHeader,
            body:   SizedBox(
              
              height: Helper.getScreenHeight(context)/2,
              child: Column(
                children: [
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Container(height: 1,width: Helper.getScreenWidth(context)/4.4,
                     color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,),),
                     const SizedBox(width: 5,),
                      const Text('SHOP BY CATEGORY',textAlign: TextAlign.center, 
                      style: TextStyle( color: Colors.black,fontSize: 10,fontWeight: FontWeight.w600)),
                          const SizedBox(width: 5,),
                   Container(height: 1,width: Helper.getScreenWidth(context)/4.4,
                   color: const Color.fromARGB(255, 153, 153, 153),padding: const EdgeInsets.only(top: 2,)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Column(
                                                    children: [
                                                      Container(
                                                        height: 80,width: 80,
                                                        decoration: BoxDecoration(
                                                          gradient: LinearGradient(
                                                            begin: Alignment.topCenter,
                                                            end: Alignment.bottomCenter,
                                                            colors: [
                                                            Colors.white,Colors.pinkAccent.withOpacity(0.2),
                                                          ]),
                                                          borderRadius: BorderRadius.circular(4)
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.orange,
                                                                    borderRadius: BorderRadius.circular(4)
                                                                  ),
                                                                  child:  const SizedBox(
                                                                    width: 20,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.symmetric(horizontal: 2,vertical: 1),
                                                                      child: Text('18% OFF',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.w500),),
                                                                    )),
                                                                ),
                                                                const Spacer(),
                                                                const Padding(
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Icon(Icons.favorite_border_outlined,color: Color.fromARGB(255, 133, 132, 132),size: 18,),
                                                                )
                                                              ],
                                                            ),
                                                            Container(
                                                              height: 50,
                                                              width: 50,
                                                              decoration: const BoxDecoration(
                                                                image: DecorationImage(image: AssetImage('assets/images/creammart.png'),fit: BoxFit.cover)
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2,),
                                                       const Text('Hot Deals',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                                                    ],
                                                  ),
                                                   Column(
                                                children: [
                                                  Container(
                                                    height: 80,width: 80,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                        colors: [
                                                        Colors.white,Colors.pinkAccent.withOpacity(0.2),
                                                      ]),
                                                      borderRadius: BorderRadius.circular(4)
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                color: Colors.orange,
                                                                borderRadius: BorderRadius.circular(4)
                                                              ),
                                                              child:  const SizedBox(
                                                                width: 20,
                                                                child: Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 2,vertical: 1),
                                                                  child: Text('18% OFF',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.w500),),
                                                                )),
                                                            ),
                                                            const Spacer(),
                                                            const Padding(
                                                              padding: EdgeInsets.all(5.0),
                                                              child: Icon(Icons.favorite_border_outlined,color: Color.fromARGB(255, 133, 132, 132),size: 18,),
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 50,
                                                          decoration: const BoxDecoration(
                                                            image: DecorationImage(image: AssetImage('assets/images/creammart.png'),fit: BoxFit.cover)
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 2,),
                                                   const Text('Hot Deals',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                                                ],
                                              ),
                                               Column(
                                                children: [
                                                  Container(
                                                    height: 80,width: 80,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                        colors: [
                                                        Colors.white,Colors.pinkAccent.withOpacity(0.2),
                                                      ]),
                                                      borderRadius: BorderRadius.circular(4)
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                color: Colors.orange,
                                                                borderRadius: BorderRadius.circular(4)
                                                              ),
                                                              child:  const SizedBox(
                                                                width: 20,
                                                                child: Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 2,vertical: 1),
                                                                  child: Text('18% OFF',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.w500),),
                                                                )),
                                                            ),
                                                            const Spacer(),
                                                            const Padding(
                                                              padding: EdgeInsets.all(5.0),
                                                              child: Icon(Icons.favorite_border_outlined,color: Color.fromARGB(255, 133, 132, 132),size: 18,),
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 50,
                                                          decoration: const BoxDecoration(
                                                            image: DecorationImage(image: AssetImage('assets/images/creammart.png'),fit: BoxFit.cover)
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 2,),
                                                   const Text('Hot Deals',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                                                ],
                                              ),
                     ],
                   ),
                ],
              ),
            ),
            
            ).show();}

}