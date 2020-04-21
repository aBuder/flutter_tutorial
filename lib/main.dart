import 'package:flutter/material.dart';
import 'package:tuxin_tutorial_overlay/TutorialOverlayUtil.dart';
import 'package:tuxin_tutorial_overlay/WidgetData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tux-In Tutorial Overlay Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey listTileKey = GlobalKey();
  final GlobalKey cardKey = GlobalKey();
  final GlobalKey buttonOneKey = GlobalKey();
  final GlobalKey buttonTwoKey = GlobalKey();

  int index = 0;

  final titles = [
    'Title ListTile',
    'Title Card',
    'Title Button 1',
    'Title Button 2'
  ];

  void startTutorial() {
    final keys = [
      listTileKey,
      cardKey,
      buttonOneKey,
      buttonTwoKey,
    ];

    if (index >= keys.length) {
      hideOverlayEntryIfExists();
      index = 0;
      return;
    }

    GlobalKey currentKey = keys[index];
    setTutorialShowOverlayHook((String tagName) => print('SHOWING $tagName'));
    createTutorialOverlay(
      enableAnimationRepeat: true,
      enableHolesAnimation: true,
      context: context,
      tagName: 'example',
      bgColor: Colors.grey.withOpacity(
          0.6), // Optional. uses black color with 0.4 opacity by default
      onTap: () => print("TAP"),
      widgetsData: <WidgetData>[
        WidgetData(
          key: currentKey,
          isEnabled: false,
          shape: WidgetShape.Rect,
        ),
      ],
      description: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      titles[index],
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          textColor: Colors.blueAccent,
                          onPressed: () {
                            index++;
                            startTutorial();
                          },
                          child: Text("Next"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    showOverlayEntry(tagName: 'example');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              startTutorial();
            },
            child: Text("Start"),
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            key: listTileKey,
            title: Text('demo text'),
            subtitle: Text('demo text'),
          ),
          Card(
            key: cardKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.network(
                      'https://images.unsplash.com/photo-1587394012660-5825a372915a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3080&q=80'),
                  Text(
                    'Headline',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        textColor: Colors.blueAccent,
                        onPressed: () {},
                        child: Text("Next"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Sign In Button
                  new FlatButton(
                    key: buttonOneKey,
                    color: Colors.blue,
                    onPressed: () {},
                    child: new Text(
                      "Button 1",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Sign Up Button
                  new FlatButton(
                    key: buttonTwoKey,
                    color: Colors.blue,
                    onPressed: () {},
                    child: new Text(
                      "Button 2",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
