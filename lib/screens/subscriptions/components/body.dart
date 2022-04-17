import 'package:flutter/material.dart';
import 'package:notification/screens/subscriptions/components/header.dart';
import 'package:notification/screens/subscriptions/components/card.dart';
import 'package:notification/interface/subscription.dart';

List<Subscription> generateItems() {
  List<Subscription> subscriptions = [
    Subscription(category: 'Food', type: {
      "sales": false,
      "updateMenu": false,
      "openNewPlace": false,
      "openNewBranch": false
    }),
    Subscription(category: 'Clothes', type: {
      "sales": false,
      "newCollection": false,
      "oldCollection": false,
      "openNewPlace": false,
      "openNewBranch": false
    })
  ];

  return subscriptions;
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    List<Subscription> subscriptions = generateItems();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Header(),
          SubscriptionCard(title: "subscriptionTitle", subscriptions: subscriptions)
        ],
      ),
    );
  }
}
