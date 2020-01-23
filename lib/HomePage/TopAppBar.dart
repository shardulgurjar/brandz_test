import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget {
  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  List<String> str = ["Paris", "New York", "London", "Mexico"];
  List<DropdownMenuItem<String>> _dropDownMenuItem;
  String _selectedCity;

  @override
  void initState() {
    _dropDownMenuItem = buildDropDownMenuItems(str);
    _selectedCity = _dropDownMenuItem[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildDropDownMenuItems(List str) {
    List<DropdownMenuItem<String>> items = List();
    for (String city in str) {
      items.add(DropdownMenuItem(
        
        value: city,
        child: Text(city,style:  TextStyle(color: Colors.white,),
      )));
    }
    return items;
  }

  onChangedDropDownItem(String city) {
    setState(() {
      _selectedCity = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      dropDown(),
                      Spacer(),
                      searchButton(),
                      SizedBox(
                        width: 10.0,
                      ),
                      settings(),
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget searchButton() {
    return FloatingActionButton(
      heroTag: "search",
      backgroundColor: Color(0xff303030),
      onPressed: () {},
      child: Icon(
        Icons.search,
        color: Colors.white60,
      ),
    );
  }

  Widget settings() {
    return FloatingActionButton(
      heroTag: "settings",
      backgroundColor: Color(0xff303030),
      onPressed: () {},
      child: Icon(
        Icons.tune,
        color: Colors.white60,
      ),
    );
  }

  Widget dropDown() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.black),
          child: DropdownButton(
        value: _selectedCity, 
        items: _dropDownMenuItem,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 32.0,
        iconEnabledColor: Colors.white,
        style: TextStyle(
            fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold),
        onChanged: onChangedDropDownItem,
      ),
    );
  }
}
