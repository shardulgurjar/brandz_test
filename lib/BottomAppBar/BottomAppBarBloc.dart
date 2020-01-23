import 'dart:async';


enum NavBarItem { Accounts, Event, Dashboard }

class BottomAppBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.Event;

  Stream<NavBarItem> get navBarStream => _navBarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.Accounts);
        break;

      case 1:
        _navBarController.sink.add(NavBarItem.Event);
        break;

      case 2:
        _navBarController.sink.add(NavBarItem.Dashboard);
        break;
    }
  }

  void dispose(){
    _navBarController.close();
  }
}
