import 'package:flutter/material.dart';
import 'package:notification/widgets//hotDeal/hot_deal.dart';
import 'package:notification/widgets/calendar/calendar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [HotDeal(), Calendar()],
    );
  }
}
