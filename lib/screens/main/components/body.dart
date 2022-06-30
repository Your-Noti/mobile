import 'package:flutter/material.dart';
import 'package:mobile/widgets//hotDeal/hot_deal.dart';
import 'package:mobile/widgets/calendar/calendar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HotDeal(),
        SizedBox(height: 20),
        DefaultTabController(
            length: 4,
            child: Column(children: [
              TabBar(tabs: [
                Tab(text: "ALL"),
                Tab(text: "Going"),
                Tab(text: "Saved"),
                Tab(text: "Past")
              ]),
              SizedBox(
                height: 300,
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Text("It's cloudy here"),
                    ),
                    Center(
                      child: Text("It's rainy here"),
                    ),
                    Center(
                      child: Text("It's sunny here"),
                    ),
                    Center(
                      child: Text("It's sunny here"),
                    ),
                  ],
                ),
              ),
        ],)),
      ],
      // body: ,
      // children: [
      //
      //   // Calendar()
      // ],
    );
  }
}
