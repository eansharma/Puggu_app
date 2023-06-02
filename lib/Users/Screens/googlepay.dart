
import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';

import '../../util/Helper/helper.dart';

class GooglePay extends StatefulWidget {
  const GooglePay({super.key, required String title});

  @override
  State<GooglePay> createState() => _GooglePayState();
}

class _GooglePayState extends State<GooglePay> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ESewaPnp? _esewaPnp;
  ESewaConfiguration? _configuration;
 @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1.5,
                  width: Helper.getScreenWidth(context) / 3.8,
                  color: const Color.fromARGB(255, 153, 153, 153),
                  padding: const EdgeInsets.only(
                    top: 2,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('SELECT PAYMENT METHOD',
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
                    width: Helper.getScreenWidth(context) / 3.8,
                    color: const Color.fromARGB(255, 153, 153, 153),
                    padding: const EdgeInsets.only(
                      top: 2,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Image(image: AssetImage('assets/images/gpay.png'),height: 20,width: 20,fit: BoxFit.cover,),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Khalti',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,size: 15,)
                      ],
                    ),
                  ),
                   const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
                 InkWell(
                     onTap: ()async{
                       esewa();
                     },
                   child: Padding(
                     padding: EdgeInsets.only(left: 0),
                     child: Row(
                       children: [
                         Container(
                           height: 25,
                           width: 45,
                           padding: EdgeInsets.symmetric(horizontal: 5),
                           decoration: BoxDecoration(
                             border: Border.all(width: 1),
                             borderRadius: BorderRadius.circular(5),
                           ),
                           child: Image(image: AssetImage('assets/images/gpay.png'),height: 20,width: 20,fit: BoxFit.cover,),
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Text(
                           'Esewa',
                           style: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w500,
                               color: Colors.black),
                         ),
                         Spacer(),
                         Icon(Icons.arrow_forward_ios,size: 15,)
                       ],
                     ),
                   ),
                 ),
            /* GestureDetector(
              onTap: () {
                esewa();
              },
               child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 45,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image(image: AssetImage('assets/images/gpay.png'),height: 20,width: 20,fit: BoxFit.cover,),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Esewa',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,size: 15,)
                        ],
                      ),
                    ),
             ),*/
                   const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Image(image: AssetImage('assets/images/gpay.png'),height: 20,width: 20,fit: BoxFit.cover,),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Cash on Delivery',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,size: 15,)
                      ],
                    ),
                  ),
                   const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
         
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
  void esewa()async {
    _configuration = ESewaConfiguration(
      clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
      secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
      environment: ESewaConfiguration.ENVIRONMENT_TEST,
    );
    _esewaPnp = ESewaPnp(configuration: _configuration!);

    ESewaPayment _payment = ESewaPayment(
        amount: 10,
        productName: "Kamal",
        productID: "512",
        callBackURL: "http://example.com/");
    final res = await _esewaPnp!.initPayment(payment: _payment);
   /* res.fold((failure){

    },
        (result)
        {
          print(result.s)
        }
    )*/
  }

}
