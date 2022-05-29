import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Clipshape/testing.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: const Text(
            'MY FITNESS APP',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: SizedBox(),
          ),
          elevation: 0,
        ),
        body: Column(children: [
          Stack(children: [
            ClipPath(
              clipper: ClipShape(),
              child: Container(
                height: 350,
                color: Colors.blue[800],
                width: MediaQuery.of(context).size.width,
              ),
            ),
            TabBar(
                controller: _controller,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: const [
                  Tab(
                    text: 'Today',
                  ),
                  Tab(
                    text: 'Week',
                  ),
                  Tab(
                    text: 'Month',
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.only(left: 83, top: 50),
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150),
                ),
                child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    padding: EdgeInsets.all(10),
                    child: CircularPercentIndicator(
                      //circular progress indicator
                      radius: 110.0, //radius for circle
                      lineWidth: 8.0, //width of circle line
                      animation:
                          true, //animate when it shows progress indicator first
                      percent: 60 /
                          100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                      center: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text(
                              "Your Goal",
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          // Text(
                          //   "75%",
                          //   style:
                          //       TextStyle(fontSize: 60.0, color: Colors.grey),
                          // ),
                          RichText(
                            text: TextSpan(
                                text: "75",
                                style: TextStyle(
                                    fontSize: 60.0, color: Colors.grey),
                                children: [
                                  TextSpan(
                                      text: "%",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.grey))
                                ]),
                          ),

                          Text(
                            "Today",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.green),
                          ),
                        ],
                      ), //center text, you can set Icon as well
                      //footer text
                      backgroundColor: Colors.white, //backround of progress bar
                      circularStrokeCap: CircularStrokeCap
                          .round, //corner shape of progress bar at start/end
                      progressColor: Colors.green, //progress bar color
                    )),
              ),
            ),
          ]),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 110,
            ),
            child: Container(
              // height: 500,
              // width: 500,
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white70,
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                  ),
                                ]),
                            height: 100,
                            width: 100,
                            child: CardWidget(
                                imageurl: "assets/apple.png", name: "Diet")),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white70,
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                  ),
                                ]),
                            height: 100,
                            width: 100,
                            child: CardWidget(
                                imageurl: "assets/heart-rate.png",
                                name: "Heart")),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                    Row(children: [
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                ),
                              ]),
                          height: 100,
                          width: 100,
                          child: CardWidget(
                              imageurl: "assets/list.png", name: "Plan")),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white70,
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                ),
                              ]),
                          height: 100,
                          width: 100,
                          child: CardWidget(
                              imageurl: "assets/clock.png", name: "Excercise")),
                    ]),
                  ])),
            ),
          ),
        ]));
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.imageurl, required this.name})
      : super(key: key);

  final String imageurl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 5, bottom: 8),
              height: 70,
              width: 50,
              child: Image.asset(
                imageurl,
              )),
          Text(name)
        ],
      ),
    );
  }
}
