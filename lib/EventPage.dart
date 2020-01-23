import 'package:flutter/material.dart';
import 'HomePage/HomeSlider.dart';
import 'HomePage/TopAppBar.dart';
import 'HomePage/PopularEvents.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TopAppBar(),
        HomeSlider(),
        titlePopularEvents(),
        PopularEvents(),
      ],
    );
  }

  Widget titlePopularEvents() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text("Popular Events",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24.0)),
    );
  }
}
