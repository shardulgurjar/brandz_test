class Events {
  int _id;
  String _eventName;
  String _eventLocation;
  String _eventDate;
  String _eventOrganiser;
  String _eventLatLong;
  String _eventImage;
  String _organiserImage;
  bool _like;

  Events(
      this._id,
      this._eventName,
      this._eventLocation,
      this._eventDate,
      this._eventOrganiser,
      this._eventLatLong,
      this._eventImage,
      this._organiserImage,
      this._like);

  //setter
  set id(int id) {
    this._id = id;
  }

  set eventName(String eventName) {
    this._eventName = eventName;
  }

  set eventLocation(String eventLocation) {
    this._eventLocation = eventLocation;
  }

  set eventDate(String eventDate) {
    this._eventDate = eventDate;
  }

  set eventOrganiser(String eventOrganiser) {
    this._eventOrganiser = eventOrganiser;
  }

  set eventLatLong(String eventLatLong) {
    this._eventLatLong = eventLatLong;
  }

  set eventImage(String eventImage) {
    this._eventImage = eventImage;
  }

  set eventOrganiserImage(String organiserImage) {
    this._organiserImage = organiserImage;
  }

  set eventLike(bool like) {
    this._like = like;
  }

// getter

  int get id => this._id;

  String get eventName => this._eventName;

  String get organiserImage => this._organiserImage;

  String get eventDate => this._eventDate;

  String get eventLocation => this._eventLocation;

  String get eventOrganiser => this._eventOrganiser;

  String get eventLatLong => this._eventLatLong;

  String get eventImage => this._eventImage;
   
   bool get eventLike => this._like;

}
