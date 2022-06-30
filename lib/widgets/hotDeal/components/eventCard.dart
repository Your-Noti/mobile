import 'package:flutter/material.dart';
import 'package:mobile/interface/event.dart';

class EventCard extends StatelessWidget {
  final Events event;

  const EventCard({Key? key, required this.event})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 8.0, top: 16.0, bottom: 8.0),
        height: 150,
        width: 120,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                  image: NetworkImage(event.img),
                  fit: BoxFit.cover,
                  width: 120,
              ),
            ),
            Column(
              verticalDirection: VerticalDirection.up,
              children: [
                Container(
                  height: 100,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    stops: [
                      0,
                      0.3,
                      0.6,
                      1,
                    ],
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(1),
                    ],
                  )),
                  padding: EdgeInsets.all(4),
                  child: Text(
                    event.title,
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
