import 'package:flutter/material.dart';
import 'package:pugau/Users/Auth/verify_otp.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({super.key, required String title});

  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Center(
            child: Text('Edit Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 2,
            color: Color.fromARGB(255, 180, 179, 179),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.4),
                      blurRadius: 0.5,
                      spreadRadius: 1.0,
                      offset: const Offset(
                        0.0,
                        1.0,
                      )),
                ],
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text('Number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                        height: 35,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.start,
                          //  controller: number,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 21,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        textColor: Colors.black,
                        color: Colors.red,
                        onPressed: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyOtp(
                                      type: '', phone: '',
                                    )),
                          );
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Save & Continue',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
