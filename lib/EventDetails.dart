import 'package:flutter/material.dart';
import './Models/Events.dart';

class EventDetails extends StatefulWidget {
  final Events events;
  EventDetails({this.events});


  @override
  _EventDetailsState createState() =>
      _EventDetailsState(events);
}

class _EventDetailsState extends State<EventDetails> {
  Events eventsObj;
  _EventDetailsState(this.eventsObj);

  void _likeEvent() {
      setState(() {
        eventsObj.eventLike = !eventsObj.eventLike;
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xff606060),
      body: new Container(
        child: CustomScrollView(
          slivers: <Widget>[
            collapsingToolbar(eventsObj.eventImage),
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  organiserDetails(eventsObj),
                  eventDetailBlock(eventsObj),
                    
                     
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget organiserDetails(Events obj) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          color: Color(0xff303030)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          customDivider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  child: Image.asset(
                    obj.eventImage,
                    height: 84.0,
                    width: 84.0,
                  ),
                  borderRadius: BorderRadius.circular(23.0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    obj.eventOrganiser,
                    style: TextStyle(
                        color: Colors.white60, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Organiser",
                    style: TextStyle(color: Colors.white30),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: null,
                  child: Text(
                    "Follow",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xff303030),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget eventDetails(Events obj) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 70.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          eventTime(obj.eventDate),
          title(obj.eventName),
          eventPlace(obj.eventLocation),
        ],
      ),
    );
  }

  Widget eventDetailBlock(Events obj) {
    return Container(
      transform: Matrix4.translationValues(0.0, -35.0, 0.0),
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          color: Color(0xff606060)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          customDivider(),
          Row(
            children: <Widget>[
              eventDetails(obj),
              Spacer(),
              likeButton(obj.eventLike)
            ],
          ),
           raisedButton()
        ],
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      softWrap: true,
      textAlign: TextAlign.left,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0),
    );
  }

  Widget eventTime(String time) {
    return Text(time,
        softWrap: true,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.blue));
  }

  Widget eventPlace(String place) {
    return Text(place,
        softWrap: true,
        style: TextStyle(fontSize: 14.0, color: Colors.white60));
  }

  Widget likeButton(bool like) {
    return Container(
      child: FloatingActionButton(
        heroTag: "details",
        onPressed: _likeEvent,
        child: Icon(
          Icons.favorite,
          color: like == true ? Colors.red : Colors.black,
        ),
      ),
    );
  }

  Widget collapsingToolbar(String img) {
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FloatingActionButton(
          heroTag: "Details Like",
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.white24,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 14.0,
          ),
        ),
      ),
      expandedHeight: 350.0,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          img,
          height: 350.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget raisedButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: RaisedButton(
        splashColor: Colors.blue,
        onPressed: () {},
        padding: EdgeInsets.all(12.0),
        child: Text(
          "Get Tickets",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue,
      ),
    );
  }

  Widget customDivider() {
    return Center(
      child: SizedBox(
          height: 3,
          width: 50.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          )),
    );
  }
}
