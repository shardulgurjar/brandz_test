import 'dart:async';
import '../../Models/Events.dart';

class EventBLoc {

  List<Events> _eventList = [
    Events(
        1,
        "Nocturnal and unusal visit",
        "Louvre",
        "FRI, DEC 19TH - MON, DEC 27TH ",
        "Izabel Peattie",
        "this._eventLatLong",
        "assets/images/location1.jpg",
        "this._organiserImage",
        true),
    Events(
        2,
        "Nocturnal and unusal visit",
        "Louvre",
        "FRI, DEC 19TH - MON, DEC 27TH ",
        "John Doe",
        "this._eventLatLong",
        "assets/images/location2.jpeg",
        "this._organiserImage",
        true),
    Events(
        3,
        "Nocturnal and unusal visit",
        "Louvre",
        "FRI, DEC 19TH - MON, DEC 27TH ",
        "Izabel Peattie",
        "this._eventLatLong",
        "assets/images/location3.jpeg",
        "this._organiserImage",
        false),
        
  ];

  final _eventListStreamController = StreamController<List<Events>>();

  final _eventLikeStreamController = StreamController<Events>();

  Stream<List<Events>> get eventsListStream =>
      _eventListStreamController.stream;

  StreamSink<List<Events>> get eventListSink => _eventListStreamController.sink;

  StreamSink<Events> get eventLikeSink => _eventLikeStreamController.sink;


  EventBLoc() {

    _eventListStreamController.add(_eventList);

    _eventLikeStreamController.stream.listen(_likeEvent);

  }

  _likeEvent(Events event) {
   bool status = event.eventLike;
    _eventList[event.id-1].eventLike = !status;
    _eventListStreamController.add(_eventList);
  }

  void dispose() {
    _eventListStreamController.close();
    _eventLikeStreamController.close();
  }
}
