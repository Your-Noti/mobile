import 'package:flutter/material.dart';
import 'package:notification/constants/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:notification/generated/locale_keys.g.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            LocaleKeys.subscriptionsTitle.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: textTitle),
          ).tr(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Center(
            child: Text(
              LocaleKeys.subscriptionsSubTitle.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: textSmall),
            ),
          ),
        ),
      ],
    );
  }
}
