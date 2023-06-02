import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pugau/Users/Screens/googlepay.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../util/Helper/helper.dart';
import '../../Controller/view_card_controller.dart';

class Cart extends StatefulWidget {
  const Cart({super.key, required String title});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var itemCount = 0;
  int? check;

  List<int> selectedItemscount = [];
  bool _isopen = false;
  final List<String> _locations = ['Yes', 'No']; // Option 2
  var _selectedLocation;
  final List<String> _ordertype = ['Delivery', 'NoDelivery']; // Option 2
  var _selectedordertype;
  // final ViewCardController _cartController = Get.put(ViewCardController());
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: GetBuilder<ViewCardController>(
            builder: (_cartController)
            {
              var billSummary = _cartController.viewcardList.billSummary;
              var result = double.parse(billSummary!.km.toString())* double.parse(billSummary.charge.toString());
              var multipliedValue = '${result}';
              String price =_cartController.viewcardList.cart!.cartItem![0].submenu!.price.toString() ?? "0";
              check = int.tryParse(price) ?? 0;
              String itemTotal =  ((check ?? 0) * (itemCount ?? 0)).toString();
              return  Scaffold(

                  bottomNavigationBar: SizedBox(
                    height: 45,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.1,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const GooglePay(
                                title: '',
                              )),
                        );
                      },
                      backgroundColor: Colors.red,
                      shape:
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      child: const Text(
                        ' Add Personal Details',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                ),
                              ),
                              const Text(
                                'Kantavai Fast Food',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  _available();
                                },
                                child: Container(
                                  height: 22,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          width: 1, color: Colors.blue)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 8.50,
                                        width: 15.70,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                2)),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Text(
                                        'Coupen',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1.5,
                                width: Helper.getScreenWidth(context) / 3,
                                color: const Color.fromARGB(255, 153, 153, 153),
                                padding: const EdgeInsets.only(
                                  top: 2,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('ITEM ADDED',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                  height: 1.5,
                                  width: Helper.getScreenWidth(context) / 3,
                                  color: const Color.fromARGB(
                                      255, 153, 153, 153),
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: Helper.getScreenWidth(context),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.4),
                                    // blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: const Offset(
                                      0.0,
                                      1.0,
                                    )),
                              ],
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Padding(
                                padding:
                                const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 6),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _cartController.viewcardList.cart!.cartItem!.length,
                                  itemBuilder: (context, index) {

                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.square,
                                              color: Colors.green,
                                              size: 18,
                                            ),
                                            Text(
                                              _cartController.viewcardList
                                                  .cart!.cartItem![index]
                                                  .submenu!.title.toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    // Update the specific item's itemCount
                                                    if (selectedItemscount
                                                        .contains(index)) {
                                                      selectedItemscount.remove(
                                                          index);
                                                      itemCount = 1;
                                                    } else {
                                                      selectedItemscount.add(
                                                          index);
                                                      itemCount = 1;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  width: 17.w,
                                                  height: 5.h,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.0,
                                                      vertical: 5),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        width: 0.3,
                                                        color: Colors.red),
                                                    borderRadius: BorderRadius
                                                        .circular(5),
                                                  ),
                                                  child: selectedItemscount
                                                      .contains(index)
                                                      ? Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      itemCount != 1
                                                          ? InkWell(
                                                        onTap: () =>
                                                            setState(() => itemCount--),
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.red,
                                                          size: 18,
                                                        ),
                                                      )
                                                          : SizedBox(),
                                                      Text(
                                                        itemCount.toString(),
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () =>
                                                            setState(() => itemCount++),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.red,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                      : Row(
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        color: Colors.red,
                                                        size: 15,
                                                      ),
                                                      SizedBox(width: 2),
                                                      Text(
                                                        'Add',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                ),
                                              ),


                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 35),
                                          child: Row(
                                            children: [
                                              Text(
                                                '₹' +
                                                    _cartController.viewcardList.cart!
                                                        .cartItem![index]
                                                        .submenu!.price
                                                        .toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                itemTotal,
                                                //  ((check ?? 0) * (itemCount ?? 0)).toString(),
                                                // '₹${double.parse(_cartController.viewcardList.value.cart!.cartItem![index].submenu!.price != null
                                                //     ? (_cartController.viewcardList.value.cart!.cartItem![index].submenu!.price! * int.parse(itemCount.toString())).toString()
                                                //     : '0')}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),


                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 17),
                                          child: Text(
                                            'Full Plate[2 pieces]',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 179, 177, 177),
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 17),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'Edit',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.red,
                                                size: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    );
                                  },
                                )
                            )
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: Helper.getScreenWidth(context),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.4),
                                  // blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  offset: const Offset(
                                    0.0,
                                    1.0,
                                  )),
                            ],
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      '+ Add More Items',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 18,
                                    )
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Order Type',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      'Delivery',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          size: 18,
                                        ),
                                        hint: const Text(
                                          'Delivery',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        value: _selectedordertype,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedordertype = newValue!;
                                          });
                                        },
                                        items: _ordertype.map((location) {
                                          return DropdownMenuItem(
                                            value: location,
                                            child: Text(location),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Call Confirmation',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          size: 18,
                                        ),
                                        hint: const Text(
                                          'Yes',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        value: _selectedLocation,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedLocation = newValue!;
                                          });
                                        },
                                        items: _locations.map((location) {
                                          return DropdownMenuItem(
                                            value: location,
                                            child: Text(location),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      'Add Schedule Delivery',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Select Date & Time',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 18,
                                    )
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showFlexibleBottomSheet(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25.0),
                                          topRight: Radius.circular(25.0),
                                        ),
                                      ),
                                      minHeight: 0,
                                      initHeight: 0.35,
                                      maxHeight: 1,
                                      context: context,
                                      builder: _buildBottomSheet,
                                      anchors: [0, 0.5, 1],
                                      isSafeArea: true,
                                    );
                                  },
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Phone Number',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Spacer(),
                                      Text(
                                        '+91234567890',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isopen = !_isopen;
                                    });
                                  },
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Add Cooking or Order Intruction',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                                if (_isopen)
                                  Container(
                                      height: 5.h,
                                      width: 110.5.w,
                                      padding: const EdgeInsets.only(left: 17),
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        textAlign: TextAlign.start,
                                        //  controller: number,
                                        textAlignVertical: TextAlignVertical
                                            .bottom,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                        decoration: InputDecoration(
                                          hintText: 'Add Cooking Intruction',
                                          hintStyle: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500),
                                          border: InputBorder.none,

                                        ),
                                      )),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            showFlexibleBottomSheet(
                              minHeight: 05,
                              initHeight: 0.35,
                              maxHeight: 1,
                              context: context,
                              builder: _buildBottomSheet,
                              anchors: [0, 0.5, 1],
                              isSafeArea: true,
                            );
                          },
                          child: Container(
                            width: Helper.getScreenWidth(context),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.4),
                                    // blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: const Offset(
                                      0.0,
                                      1.0,
                                    )),
                              ],
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 20.70,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  const Text(
                                    'Log in to use coupon',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_right_sharp, size: 18)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1.5,
                                width: Helper.getScreenWidth(context) / 3.3,
                                color: const Color.fromARGB(255, 153, 153, 153),
                                padding: const EdgeInsets.only(
                                  top: 2,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('BILL SUMMARY',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                  height: 1.5,
                                  width: Helper.getScreenWidth(context) / 3.3,
                                  color: const Color.fromARGB(
                                      255, 153, 153, 153),
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: Helper.getScreenWidth(context),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.4),
                                  // blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  offset: const Offset(
                                    0.0,
                                    1.0,
                                  )),
                            ],
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Item Total',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Spacer(),
                                    Text(
                                      // _cartController.viewcardList.value.cart!.cartItem!.length.toString(),
                                      itemTotal,
                                      // '\$457',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Delivery charge for ' +
                                          _cartController.viewcardList
                                              .billSummary!.km.toString() +
                                          ' km ',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Spacer(),
                                    Text(
                                      '₹$multipliedValue',
                                      // '\$457',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Govt charge and Restaurent charge',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _iButton();
                                      },
                                      child: const Text(
                                        '( i )',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      //  _cartController.viewcardList.value.billSummary!.cityData!.govtTaxCharge.toString()+ * +' '₹$multipliedValue+',
                                      '\457',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Grand Total',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Spacer(),
                                    Text(
                                      itemTotal,


                                      // '\$457',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: Helper.getScreenWidth(context),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.4),
                                  // blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  offset: const Offset(
                                    0.0,
                                    1.0,
                                  )),
                            ],
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Add Personal Details',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_right_sharp, size: 18)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: Helper.getScreenWidth(context),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.4),
                                  // blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  offset: const Offset(
                                    0.0,
                                    1.0,
                                  )),
                            ],
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Calcellation Policy',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Order one Places cannot be cancelled and are non-refundble',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 100, 100, 100)),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(Icons.arrow_right_sharp, size: 18)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        )
                      ],
                    ),
                  ),
                );
              }
        ));
  }

  void _available() {
    showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'AVAILABLE COUPONS',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Get 50% OFF up to \$100',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Valid on only this order',
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                    const Color.fromARGB(255, 6, 56, 97)),
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.lightBlue.withOpacity(0.3)),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'WELCOME',
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 2, 60, 107)),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'APPLY THIS COUPON',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Get 50% OFF up to \$100',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Valid on only this order',
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                    const Color.fromARGB(255, 6, 56, 97)),
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.lightBlue.withOpacity(0.3)),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'WELCOME',
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 2, 60, 107)),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'APPLY THIS COUPON',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 138, 136, 136)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        });
  }

  void _iButton() {
    showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 240,
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: Helper.getScreenWidth(context) / 5.7,
                        color: const Color.fromARGB(255, 153, 153, 153),
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('How We Calculate Delivery Charge',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          height: 1.5,
                          width: Helper.getScreenWidth(context) / 5.7,
                          color: const Color.fromARGB(255, 153, 153, 153),
                          padding: const EdgeInsets.only(
                            top: 2,
                          )),
                    ],
                  ),
                ),
                Center(
                    child: Column(children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Table(
                          defaultColumnWidth: const FixedColumnWidth(120.0),
                          border: TableBorder.all(
                              color: const Color.fromARGB(255, 129, 128, 128),
                              style: BorderStyle.solid,
                              width: 1),
                          children: [
                            TableRow(children: [
                              Column(children: const [
                                Text('Order Amount',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600))
                              ]),
                              Column(children: const [
                                Text('Note',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600))
                              ]),
                              Column(children: const [
                                Text('Delivery Charge',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600))
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [
                                Text('Rs. 1 to 200',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Free Delivery not Available',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Rs. 20/km',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [
                                Text('Rs. 1 to 200',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Free Delivery not Available',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Rs. 20/km',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [
                                Text('Rs. 1 to 200',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Free Delivery not Available',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Rs. 20/km',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [
                                Text('Rs. 1 to 200',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Free Delivery not Available',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Rs. 20/km',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [
                                Text('Rs. 1 to 200',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Free Delivery not Available',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                              Column(children: const [
                                Text('Rs. 20/km',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))
                              ]),
                            ]),
                          ],
                        ),
                      ),
                    ])),
              ],
            ),
          );
        });
  }

  Widget _buildBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
      ) {
    return Material(
      child: Container(
        child: ListView(
          controller: scrollController,
          children: [
            SingleChildScrollView(
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1.5,
                              width: Helper.getScreenWidth(context) / 2.9,
                              color: const Color.fromARGB(255, 153, 153, 153),
                              padding: const EdgeInsets.only(
                                top: 2,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('Login & Signup',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                                height: 1.5,
                                width: Helper.getScreenWidth(context) / 2.9,
                                color: const Color.fromARGB(255, 153, 153, 153),
                                padding: const EdgeInsets.only(
                                  top: 2,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Row(
                          children: [
                            Container(
                                height: 5.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 153, 153, 153)),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Center(
                                    child: Text(
                                      '+977',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )),
                            Container(
                                height: 5.h,
                                width: 70.5.w,
                                padding: const EdgeInsets.only(left: 17),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  textAlign: TextAlign.start,
                                  //  controller: number,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    hintText: 'Enter Phone Number',
                                    hintStyle: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 153, 153, 153),
                                            width: 1)
                                      //<-- SEE HERE
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 153, 153, 153),
                                            width: 1)

                                      //<-- SEE HERE
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 18.2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            textColor: Colors.black,
                            color: Colors.red,
                            onPressed: (() {
                              //            Navigator.push(
                              //    context,
                              //    MaterialPageRoute(builder: (context) => const ResetPassword  (title: '',)),
                              //  );
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Save',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
