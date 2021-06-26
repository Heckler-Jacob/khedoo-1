import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khedoo/utilities/content.dart';
import 'package:swipe_cards/swipe_cards.dart';

class AppDashboard extends StatefulWidget {
  @override
  _AppDashboardState createState() => _AppDashboardState();
}

class _AppDashboardState extends State<AppDashboard> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(children: [
          Container(
            height: 650,
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      height: 650,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: _swipeItems[index].content.color,
                          borderRadius: BorderRadius.all(Radius.circular(9.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffEFF7E1),
                              blurRadius: 35.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 10  horizontally
                                5.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          image: DecorationImage(
                              image: AssetImage('images/user.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 70,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 230,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Button with icon
                                  ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.done),
                                      label: Text('Rachael')),
                                  IconButton(
                                    icon: Icon(
                                      Icons.info,
                                      color: Colors.pink,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      //show modal with the user's profile
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Button with icon

                                  Container(
                                    height: 55,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.pink,
                                            size: 30,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Abakaliki'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Container(
                                    height: 55,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(child: Text('Age: 29')),
                                    ),
                                  ),
                                  Container(
                                    height: 55,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_sharp,
                                            color: Colors.pink,
                                            size: 30,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Saggitarious'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'I am a seeker of all things adventurous'),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // shape
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  shadowColor: Colors.amberAccent,
                                  primary: Colors.pinkAccent),
                              onPressed: () {
                                _matchEngine.currentItem?.nope();
                              },
                              child: Icon(Icons.close)),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // shape
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  shadowColor: Colors.amberAccent,
                                  primary: Colors.pinkAccent),
                              onPressed: () {
                                //Check
                                _matchEngine.currentItem?.superLike();
                              },
                              child: Icon(Icons.message)),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // shape
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  shadowColor: Colors.amberAccent,
                                  primary: Colors.pinkAccent),
                              onPressed: () {
                                _matchEngine.currentItem?.like();
                              },
                              child: Icon(FontAwesomeIcons.heart))
                        ],
                      ),
                    )
                  ],
                );
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
            ),
          ),
        ]));
  }
}
