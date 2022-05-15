import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 8.0, top: 16.0, bottom: 8.0),
        height: 150,
        width: 120,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                  image: AssetImage('assets/mocks/mock.jpeg'),
                  fit: BoxFit.cover),
            ),
            Column(
              verticalDirection: VerticalDirection.up,
              children: [
                Container(
                  height: 75,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0,
                      0.2,
                      1,
                    ],
                    colors: [
                      Colors.white.withOpacity(0),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(1),
                    ],
                  )),
                  padding: EdgeInsets.all(4),
                  child: Text(
                    "ASDAS asdasd asda sdas d asd asd",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
