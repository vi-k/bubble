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
  static const BubbleStyle BUBBLE_CAPTION = BubbleStyle(
    color: Color.fromARGB(255, 212, 234, 244),
    margin: EdgeInsets.only(top: 8),
    alignment: Alignment.topCenter,
  );
  static const BubbleStyle BUBBLE_SOMEBODY = BubbleStyle(
    nip: BubbleNip.TOP_LEFT,
    color: Colors.white,
    margin: EdgeInsets.only(top: 8, right: 48),
    alignment: Alignment.topLeft,
  );
  static const BubbleStyle BUBBLE_SOMEBODY_NEXT = BubbleStyle(
    nip: BubbleNip.TOP_LEFT,
    color: Colors.white,
    margin: EdgeInsets.only(top: 2, right: 48),
    alignment: Alignment.topLeft,
  );
  static const BubbleStyle BUBBLE_ME = BubbleStyle(
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    margin: EdgeInsets.only(top: 8, left: 48),
    alignment: Alignment.topRight,
  );
  static const BubbleStyle BUBBLE_ME_NEXT = BubbleStyle(
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    margin: EdgeInsets.only(top: 2, left: 48),
    alignment: Alignment.topRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.TITLE),
      ),
      body: Container(
        color: Colors.yellow.withAlpha(64),
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Bubble(
              style: BUBBLE_CAPTION,
              child: Text('TODAY', style: TextStyle(fontSize: 10)),
            ),
            Bubble(
              style: BUBBLE_SOMEBODY,
              child: Text('Hi Jason. Sorry to bother you. I have a queston for you.'),
            ),
            Bubble(
              style: BUBBLE_ME,
              child: Text('Whats\'up?'),
            ),
            Bubble(
              style: BUBBLE_SOMEBODY,
              child: Text('I\'ve been having a problem with my computer.'),
            ),
            Bubble(
              style: BUBBLE_SOMEBODY_NEXT,
              child: Text('Can you help me?'),
            ),
            Bubble(
              style: BUBBLE_ME,
              child: Text('Ok'),
            ),
            Bubble(
              style: BUBBLE_ME_NEXT,
              child: Text('What\'s the problem?'),
            ),
          ],
        ),
      ),
    );
  }
}
