import 'dart:async';
import '../../Models/Category.dart';


class HomeSliderBloc{

  List<Category> _categoryList = [
    Category(1,
    "assets/icons/sun.png",
    'All',
     false 
     ),
    Category(2,
    "assets/icons/food.png",
    'Food',
    true,
    ),
    Category(3,
    "assets/icons/sun.png",
    'Sport',
    false,
    ),
    Category(4,
    "assets/icons/music.png",
    'Music',
    false,
    ),
     Category(5,
    "assets/icons/sun.png",
    'Park',
    false,
    ),
     Category(6,
    "assets/icons/sun.png",
    'Zoo',
    false,
    ),
  ];

  final _homeSliderStreamController = StreamController<List<Category>>();

  final _homeSliderActiveStreamController = StreamController<Category>();

  Stream<List<Category>> get categoryListStream =>
      _homeSliderStreamController.stream;

  StreamSink<List<Category>> get categoryListSink => _homeSliderStreamController.sink;

  StreamSink<Category> get categoryActiveSink => _homeSliderActiveStreamController.sink;


HomeSliderBloc() {
    _homeSliderStreamController.add(_categoryList);
    _homeSliderActiveStreamController.stream.listen(_activeCategory);
  }

  _activeCategory(Category category) {
    bool status = category.active;
    _categoryList[category.id-1].active = !status;
    categoryListSink.add(_categoryList);
  }

 void dispose() {
    _homeSliderStreamController.close();
    _homeSliderActiveStreamController.close();
  }

}
