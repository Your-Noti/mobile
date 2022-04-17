import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:notification/constants/styles.dart';
import 'package:notification/interface/subscription.dart';
import 'package:notification/screens/subscriptions/components/panel_item.dart';

Map test = {
  "food": {
    "sales": "Sales",
    "updateMenu": "Update Menu",
    "openNewPlace": "Open new place",
    "openNewBranch": "Open New Branch"
  },
  "clothes": {
    "sales": "Sales",
    "newCollection": "New Collection",
    "oldCollection": "Old Collection",
    "openNewPlace": "Open new place",
    "openNewBranch": "Open New Branch"
  }
};

class SubscriptionCard extends StatefulWidget {
  final String title;
  final List<Subscription> subscriptions;

  const SubscriptionCard(
      {Key? key, required this.title, required this.subscriptions})
      : super(key: key);

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                widget.title,
                style: TextStyle(fontSize: textLarge),
              ).tr()/**/),
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  widget.subscriptions[index].isExpanded = !isExpanded;
                });
              },
              children: widget.subscriptions
                  .map<ExpansionPanel>((Subscription item) => ExpansionPanel(
                        headerBuilder:
                            (BuildContext context, bool isExpanded) =>
                                ListTile(title: Text(item.category)),
                        body: PanelItem(items: item.type),
                        isExpanded: item.isExpanded,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
