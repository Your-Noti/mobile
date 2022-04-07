import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notification/constants/styles.dart';
import 'package:notification/screens/subscriptions/components/SwitchItem.dart';
import 'package:notification/generated/locale_keys.g.dart';

class Subscription {
  Subscription({
    required this.category,
    required this.type,
    this.isExpanded = false,
  });

  String category;
  Map<String, bool> type;
  bool isExpanded;
}

List<Subscription> generateItems() {
  List<Subscription> subscriptions = [
    Subscription(category: 'Food', type: {
      "newShop": true,
      "sales": false,
      // "sales": false
    }),
    Subscription(category: 'Clothes', type: {
      "newShop": false,
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
  final List<Subscription> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              LocaleKeys.subscriptionsTitle.tr(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: textTitle),
            ).tr(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Center(
              child: Text(
                "ASDASD",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: textSmall),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      "asd",
                      style: TextStyle(fontSize: textLarge),
                    )),
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _data[index].isExpanded = !isExpanded;
                      });
                    },
                    children: _data.map<ExpansionPanel>((Subscription item) {
                      List test123 = [];

                      item.type.forEach((key, value) {
                        test123.add({"title": key, "status": value});
                      });

                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(item.category),
                          );
                        },
                        // body: Text('da'),
                        body: Column(
                            // children: test123.map((qwe) => Text(qwe["title"])).toList()
                            children: test123
                                .map((item) => SwitchItem(
                                    title: item["title"],
                                    value: item["status"]))
                                .toList()),
                        isExpanded: item.isExpanded,
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
