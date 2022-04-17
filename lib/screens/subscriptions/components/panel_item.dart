import 'package:flutter/material.dart';
import 'package:notification/screens/subscriptions/components/switch_item.dart';

class PanelItem extends StatefulWidget {
  final Map<String, bool> items;

  const PanelItem({Key? key, required this.items}) : super(key: key);

  @override
  State<PanelItem> createState() => _PanelItemState();
}

class _PanelItemState extends State<PanelItem> {
  @override
  Widget build(BuildContext context) {
    List subscription = [];

    widget.items.forEach((key, value) {
      subscription.add({"title": key, "status": value});
    });

    return Column(
        children: subscription
            .map((item) =>
                SwitchItem(title: item["title"], value: item["status"]))
            .toList());
  }
}
