import 'package:flutter/material.dart';



class MartSearch extends StatefulWidget {
  const MartSearch({super.key, required String title});

  @override
  State<MartSearch> createState() => _MartSearchState();
}

class _MartSearchState extends State<MartSearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 30),
               child: SizedBox(height: 40,
                                           child: TextFormField(
                                             
                                             keyboardType: TextInputType.text,
                                             textAlign: TextAlign.start,
                                         //  controller: number,
                                         textAlignVertical: TextAlignVertical.bottom,
                                         style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                               // filled: true,
                                               // fillColor: Color.fromARGB(255, 216, 215, 215),
                                               suffixIcon: const Icon(Icons.search,color: Color.fromARGB(255, 139, 139, 139),),
                                               prefixIcon: const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(139, 139, 139, 1),),
                                               hintText: 'Search in mart....',
                                               hintStyle: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                               border: InputBorder.none,
                                                 enabledBorder: OutlineInputBorder(
                                                   borderRadius: BorderRadius.circular(7),
                                                     borderSide: const BorderSide(color: Color.fromARGB(255, 153, 153, 153),width: 1)
                        //<-- SEE HERE
                             ),
                             focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(7),
                                       borderSide: const BorderSide(color: Color.fromARGB(255, 153, 153, 153),width: 1)
                                       
                         //<-- SEE HERE
                             ),
                                             ),
                                           )),
             ),
             SizedBox(
              height: MediaQuery.of(context).size.height/10,
               child: GridView.builder(itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,childAspectRatio: 4.4/2
                ),
                itemBuilder: (context,index){
                  return
               Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(width: 1,color: const Color.fromARGB(255, 139, 139, 139),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(image: AssetImage('assets/images/martsearch.png'),height: 15,width: 15,),
                        Text('Maggi',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color:  Color.fromARGB(255, 97, 97, 97)),),
                    ],
                  ),
                 ),
               );
               }),
             )
          ],
        ),
      ),
    );
  }
}