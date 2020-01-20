import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Reactions {
  String name;
  String icon;

  Reactions({this.name, this.icon});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _heightAnimationController;
  Tween<Offset> heightTween;
  Tween<Offset> heightTween1;
  Tween<Offset> heightTween2;
  Tween<Offset> heightTween3;

  Tween<double> opacityTween;

  double hahaHeight = 70.0;

  List<Reactions> reactions = [
    Reactions(name: 'like', icon: 'assets/like.png'),
    Reactions(name: 'love', icon: 'assets/love.png'),
    Reactions(name: 'haha', icon: 'assets/haha.png'),
    Reactions(name: 'sad', icon: 'assets/sad.png'),
    Reactions(name: 'angry', icon: 'assets/angry.png'),
    Reactions(name: 'wow', icon: 'assets/wow.png'),
  ];

  @override
  void initState() {
    super.initState();
    heightTween = Tween<Offset>(
      end: Offset(0.0, 0.0),
      begin: Offset(0.0, 0.375),
    );
    opacityTween = Tween<double>(
      begin: 0.0,
      end: 1.0,
    );

    _heightAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      // value of 0 hides the panel; value of 1 fully shows the panel
      value: 0.0,
      vsync: this,
    );
  }

  List<Widget> _buildReactions() {
    List<Widget> reactionWidgets = [];
    double reactionsTime = 1 / reactions.length;
    for (int i = 0; i < reactions.length; i++) {
      Reactions reaction = reactions[i];
      reactionWidgets.add(FadeTransition(
        opacity: opacityTween.animate(
          CurvedAnimation(
            parent: _heightAnimationController,
            curve: Interval(
              reactionsTime * i,
              reactionsTime * (i + 1),
              curve: Curves.ease,
            ),
          ),
        ),
        child: SlideTransition(
          position: heightTween.animate(
            CurvedAnimation(
              parent: _heightAnimationController,
              curve: Interval(
                reactionsTime * i,
                reactionsTime * (i + 1),
                curve: Curves.ease,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
//              color: Colors.green,
              height: 30.0,
              width: 30.0,
              child: Image.asset(reaction.icon),
            ),
          ),
        ),
      ));
    }
    return reactionWidgets;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
//        backgroundColor: Colors.blueGrey,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/tolotra.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Tolotra Samuel Randriakotonjanahary',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    '25 min',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:4.0),
                                    child: Container(
                                      height: 3.0,
                                      width: 3.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.av_timer, size: 18.0, color: Colors.grey,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Text(
                          'Rehefa miteny ilay prof mandritan exam hoe, 5 minutes sisa'),
                    ),
                  ],
                ),
              ),
              Container(child: Image.asset('assets/horse.jpg')),
//            Row(
//              children: <Widget>[
//                GestureDetector(
//                  onPanDown: (DragDownDetails details) {
//                    setState(() {
//                      hahaHeight = 100.0;
//                    });
//                  },
//                  onPanEnd: (DragEndDetails details) {
//                    setState(() {
//                      hahaHeight = 70.0;
//                    });
//                  },
//                  child: AnimatedContainer(
//                    height: hahaHeight,
//                    duration: Duration(milliseconds: 300),
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Container(
//                        color: Colors.green,
//                        height: 50.0,
//                        width: 30.0,
//                      ),
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                    color: Colors.green,
//                    height: 50.0,
//                    width: 30.0,
//                  ),
//                ),
//              ],
//            ),
              FadeTransition(
                opacity: opacityTween.animate(
                  CurvedAnimation(
                    parent: _heightAnimationController,
                    curve: Interval(
                      0.0,
                      1,
                      curve: Curves.ease,
                    ),
                  ),
                ),
                child: SlideTransition(
                  position: heightTween.animate(
                    CurvedAnimation(
                      parent: _heightAnimationController,
                      curve: Interval(
                        0.0,
                        1.0,
                        curve: Curves.ease,
                      ),
                    ),
                  ),
                  child: Card(
                    shape: StadiumBorder(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ..._buildReactions(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Colors.black12,
                  height: 1.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                      color: Colors.white,
                      child: InkWell(
//                        splashColor: Colors.grey,
                        onTap: () {
                          if (_heightAnimationController.value == 0.0) {
                            _heightAnimationController.forward();
                          } else {
                            _heightAnimationController.reverse();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.bookmark_border),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Like'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.comment),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('Comment'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.share),
                          Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Share')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
