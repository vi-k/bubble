import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const TITLE = 'Bubble Demo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const Color COLOR_LEFT = Colors.white;
  static const Color COLOR_RIGHT = Color.fromARGB(255, 225, 255, 199);
  static const Color COLOR_CAPTION = Color.fromARGB(255, 212, 234, 244);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.TITLE),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.yellow.withAlpha(64),
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Bubble(
                nip: BubbleNip.NO,
                color: COLOR_CAPTION,
                child: Text('TODAY', style: TextStyle(fontSize: 10)),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Bubble(
                nip: BubbleNip.TOP_LEFT,
                color: COLOR_LEFT,
                child: Text('Hi Jason. Sorry to bother you. I have a queston for you.'),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Bubble(
                nip: BubbleNip.TOP_RIGHT,
                color: COLOR_RIGHT,
                child: Text('OK, whats\'up?'),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Bubble(
                nip: BubbleNip.TOP_LEFT,
                color: COLOR_LEFT,
                child: Text('I\'ve been having a problem with my computer.'),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Bubble(
                nip: BubbleNip.TOP_LEFT,
                color: COLOR_LEFT,
                margin: EdgeInsets.only(top: 2),
                showNip: false,
                child: Text('Can you help me?'),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Bubble(
                nip: BubbleNip.TOP_RIGHT,
                color: COLOR_RIGHT,
                child: Text('What\'s the problem?'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
