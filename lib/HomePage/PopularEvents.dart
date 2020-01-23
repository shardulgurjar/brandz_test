import 'package:flutter/material.dart';
import 'Bloc/EventBloc.dart';
import '../Models/Events.dart';
import '../EventDetails.dart';


class PopularEvents extends StatefulWidget {
  @override
  _PopularEventsState createState() => _PopularEventsState();
}

class _PopularEventsState extends State<PopularEvents> {
  final EventBLoc _eventBloc = EventBLoc();

  @override
  void dispose() {
    super.dispose();
    _eventBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: StreamBuilder<List<Events>>(
        stream: _eventBloc.eventsListStream,
        builder: (BuildContext context, AsyncSnapshot<List<Events>> snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              // return eventCard(snapshot.data[index], context);
              return Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  children: <Widget>[
                    cardWithButton(snapshot.data[index]),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget temp(Events events) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${events.eventDate}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.blue)),
        Text(
          "${events.eventName}",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0),
        ),
        Text("${events.eventLocation}",
            style: TextStyle(fontSize: 14.0, color: Colors.white60))
      ],
    );
  }

  Widget cardWithButton(Events event) {
    return InkWell(
      onLongPress: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventDetails(events: event)));
      },
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(23.0),
            child: Image.asset(
              "${event.eventImage}",
              width: 280.0,
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            heightFactor: .5,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 150.0,
                ),
                FloatingActionButton(
                  heroTag: "${event.id}",
                  onPressed: () {
                    _eventBloc.eventLikeSink.add(event);
                  },
                  child: Icon(
                    Icons.favorite,
                    color: event.eventLike == true
                        ? Colors.red
                        : Color(0xff606060),
                  ),
                ),
              ],
            ),
          ),
          temp(event)
        ],
      ),
    );
  }
}
