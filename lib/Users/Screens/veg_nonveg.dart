import 'package:flutter/material.dart';

class SliverWidget extends StatefulWidget {
  const SliverWidget({super.key});

  @override
  State<SliverWidget> createState() => _SliverWidgetState();
}

class _SliverWidgetState extends State<SliverWidget> {
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              leading: const Icon(Icons.arrow_back),
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    centerTitle: true,
                    title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        // opacity: top ==
                        //         MediaQuery.of(context).padding.top +
                        //             kToolbarHeight
                        //     ? 1.0
                        //     : 0.0,
                        opacity: 1.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            top ==
                                    MediaQuery.of(context).padding.top +
                                        kToolbarHeight
                                ? const SizedBox(
                                    width: 40,
                                  )
                                : const SizedBox(
                                    width: 20,
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  color: Colors.green,
                                  child: const Text("Veg"),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  color: Colors.red,
                                  child: const Text("Non-Veg"),
                                )
                              ],
                            )
                          ],
                        )),
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.98,
                            child: Image.network(
                              "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ));
              })),
        ];
      },
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Text("List Item: $index")),
          );
        },
      ),
    ));
  }
}
