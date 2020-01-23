import 'package:flutter/material.dart';
import 'BottomAppBarBloc.dart';
import '../EventPage.dart';

class BottomAppBar extends StatefulWidget {
  @override
  _BottomAppBarState createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBar> {
  
  final BottomAppBarBloc _bottomAppBarBloc = new BottomAppBarBloc();

  @override
  void dispose(){
    super.dispose();
    _bottomAppBarBloc.dispose();
  }

@override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xff333333),
        body: StreamBuilder<NavBarItem>(
          stream: _bottomAppBarBloc.navBarStream,
          initialData: _bottomAppBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.Accounts:
                return EventPage();
              case NavBarItem.Event:
                return EventPage();
              case NavBarItem.Dashboard:
                return EventPage();
            }
          },
        ),
        bottomNavigationBar: StreamBuilder(
          stream: _bottomAppBarBloc.navBarStream,
          initialData: _bottomAppBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            return BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white24,
              backgroundColor: Color(0xff303030),
              currentIndex: snapshot.data.index,
              onTap: _bottomAppBarBloc.pickItem,
              items: [
                BottomNavigationBarItem(
                  title: Text('Accounts'),
                  icon: Icon(Icons.account_balance_wallet),
                ),
                BottomNavigationBarItem(
                  title: Text('Events'),
                  icon: Icon(Icons.event_available),
                ),
                BottomNavigationBarItem(
                  title: Text('Dashboard'),
                  icon: Icon(Icons.dashboard),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}