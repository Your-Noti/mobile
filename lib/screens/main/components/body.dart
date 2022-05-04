import 'package:flutter/material.dart';
import 'package:notification/constants/styles.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Column(
        children: [
          Container(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: Column(
                  children: [
                    Row(
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
                    Row(
                      children: [
                        Container(
                          margin:  EdgeInsets.only(right: 8.0, top: 16.0, bottom: 16.0),
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(color: Colors.blueAccent)
                          ),
                          child: Text('My Awesome'),
                        ),
                        Container(
                          margin:  EdgeInsets.only(right: 8.0, top: 16.0, bottom: 16.0),
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(color: Colors.blueAccent)
                          ),
                          child: Text('My Awesome'),
                        )
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
