import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:notification/constants/styles.dart';
import 'components/eventCard.dart';
import 'package:notification/interface/event.dart';

List<Events> convertData(data) {
  List events = data['events'];
  List<Events> res = [];

  for (var event in events) {
    res.add(Events(id: event['id'], title: event['title'], img: event['img']));
  }

  return res;
}

class HotDeal extends StatefulWidget {
  const HotDeal({Key? key}) : super(key: key);

  @override
  State<HotDeal> createState() => _HotDealState();
}

class _HotDealState extends State<HotDeal> {
  List<Events> events = [];

  void initState() {
    super.initState();
    getEvent();
  }

  getEvent() async {
    var url = Uri.parse(
        'https://us-central1-notification-mob.cloudfunctions.net/api/events');
    var response = await http.get(url);
    var data = jsonDecode(response.body);

    List<Events> test = convertData(data['data']);

    setState(() {
      events = test;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                              children: events.map<EventCard>((e) {
                                return EventCard(event: e);
                              }).toList(),
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
