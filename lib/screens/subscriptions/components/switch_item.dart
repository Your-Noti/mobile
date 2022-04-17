import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SwitchItem extends StatefulWidget {
  const SwitchItem({Key? key, required this.title, required this.value})
      : super(key: key);

  final String title;
  final bool value;

  @override
  State<SwitchItem> createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  bool isTurnOn = false;

  @override
  void initState() {
    super.initState();
    isTurnOn = widget.value;
  }

  void handle(bool value) {
    setState(() {
      isTurnOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: Text(widget.title).tr(), value: isTurnOn, onChanged: handle);
  }
}
