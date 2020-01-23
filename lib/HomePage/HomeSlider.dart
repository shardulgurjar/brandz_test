import 'package:flutter/material.dart';
import 'Bloc/HomeSliderBloc.dart';
import '../Models/Category.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final HomeSliderBloc _sliderBloc = HomeSliderBloc();

  @override
  void dispose() {
    super.dispose();
    _sliderBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: StreamBuilder<List<Category>>(
        stream: _sliderBloc.categoryListStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.data == null) {
            return Text("Please WAit");
          }
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return categoryListView(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }

  Widget categoryListView(Category category) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            _sliderBloc.categoryActiveSink.add(category);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(53.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                color:
                    category.active == true ? Colors.blue : Color(0xff606060),
                child: Column(
                  children: <Widget>[
                    Container(
                      
                      padding: EdgeInsets.all(40.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        
                        border: Border.all(
                          color: Colors.white30,
                          width: 8,
                        ),
                        color: Colors.white30,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage('${category.emoji}')),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "${category.title}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
