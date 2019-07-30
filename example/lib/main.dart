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
  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleCaption = BubbleStyle(
      color: Color.fromARGB(255, 212, 234, 244),
      elevation: 1 * px,
      margin: EdgeInsets.only(top: 8),
      alignment: Alignment.topCenter,
    );
    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.TOP_LEFT,
      color: Colors.white,
      elevation: 1 * px,
      margin: EdgeInsets.only(top: 8, right: 48),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleSomebodyNext = BubbleStyle(
      nip: BubbleNip.TOP_LEFT,
      showNip: false,
      color: Colors.white,
      elevation: 1 * px,
      margin: EdgeInsets.only(top: 2, right: 48),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.TOP_RIGHT,
      color: Color.fromARGB(255, 225, 255, 199),
      elevation: 1 * px,
      margin: EdgeInsets.only(top: 8, left: 48),
      alignment: Alignment.topRight,
    );
    BubbleStyle styleMeNext = BubbleStyle(
      nip: BubbleNip.TOP_RIGHT,
      showNip: false,
      color: Color.fromARGB(255, 225, 255, 199),
      elevation: 1 * px,
      margin: EdgeInsets.only(top: 2, left: 48),
      alignment: Alignment.topRight,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${MyApp.TITLE} (pixel ratio: $pixelRatio)'),
      ),
      body: Container(
        color: Colors.yellow.withAlpha(64),
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Bubble(
              style: styleCaption,
              child: Text('TODAY', style: TextStyle(fontSize: 10)),
            ),
            Bubble(
              style: styleSomebody,
              child: Text('Hi Jason. Sorry to bother you. I have a queston for you.'),
            ),
            Bubble(
              style: styleMe,
              child: Text('Whats\'up?'),
            ),
            Bubble(
              style: styleSomebody,
              child: Text('I\'ve been having a problem with my computer.'),
            ),
            Bubble(
              style: styleSomebodyNext,
              child: Text('Can you help me?'),
            ),
            Bubble(
              style: styleMe,
              child: Text('Ok'),
            ),
            Bubble(
              style: styleMeNext,
              child: Text('What\'s the problem?'),
            ),
          ],
        ),
      ),
    );
  }
}
