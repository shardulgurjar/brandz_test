class Category {
  
  int _id;
  String _title;
  String _emoji;
  bool _active;

  Category(this._id, this._emoji, this._title, this._active);

  //Setter
  set id(int id) {
    this._id = id;
  }

  set emoji(String emoji) {
    this._emoji = emoji;
  }

  set title(String title) {
    this._title = title;
  }

  set active(bool active) {
    this._active = active;
  }

  //getter
  int get id => this._id;

  String get title => this._title;

  String get emoji => this._emoji;

  bool get active => this._active;
}
