import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:notification/constants/styles.dart';
import 'components/eventCard.dart';

class Events {
  final String id;
  final String title;
  final String img;

  const Events({
    required this.id,
    required this.title,
    required this.img,
  });
}

List<Events> convertData(data) {
  List events = data['events'];

  List<Events> res = [];
  res.add(Events(id: "ASD", title: "asd", img: "asd"));

  for (var event in events) {
    res.add(Events(id: event['id'], title: event['title'], img: event['img']));
  }

  return res;
}

Future<List<Events>> getEvent() async {
  var url = Uri.parse(
      'https://us-central1-notification-mob.cloudfunctions.net/api/events');
  var response = await http.get(url);
  var data = jsonDecode(response.body);

  List<Events> test = convertData(data['data']);

  return test;
}

class HotDeal extends StatefulWidget {
  const HotDeal({Key? key}) : super(key: key);

  @override
  State<HotDeal> createState() => _HotDealState();
}

class _HotDealState extends State<HotDeal> {
  // late Future<Events> events;

  // void initState() {
  //   super.initState();
  //   // events = getEvent();
  // }

  @override
  Widget build(BuildContext context) {
    List test = [1, 2, 3, 4, 5, 6];

    getEvent();

    return Column(
      children: [
        Container(
          child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hot deals",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: textLarge),
                        ),
                        Text("See all")
                      ],
                    ),
                  ),
                  // FutureBuilder<Events>(
                  //   future: events,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       return Text(snapshot.data!.title);
                  //     } else if (snapshot.hasError) {
                  //       return Text('${snapshot.error}');
                  //     }
                  //
                  //     // By default, show a loading spinner.
                  //     return const CircularProgressIndicator();
                  //   },
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        Container(
                            height: 168,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: test
                                  .map<EventCard>((e) => EventCard())
                                  .toList(),
                            )),
                      ],
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
