# Bubble

A Flutter widget for chat like a speech bubble in Whatsapp and others.

## Example

[Sources](https://github.com/vi-k/bubble/blob/master/example).

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/example.png" width=360>

```dart
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
  static const EdgeInsets MARGIN_LEFT = EdgeInsets.only(top: 8, right: 48);
  static const EdgeInsets MARGIN_LEFT_NEXT = EdgeInsets.only(top: 2, right: 48);
  static const EdgeInsets MARGIN_RIGHT = EdgeInsets.only(top: 8, left: 48);
  static const EdgeInsets MARGIN_RIGHT_NEXT = EdgeInsets.only(top: 2, left: 48);

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
                margin: MARGIN_LEFT,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Bubble(
                nip: BubbleNip.TOP_RIGHT,
                color: COLOR_RIGHT,
                child: Text('Whats\'up?'),
                margin: MARGIN_RIGHT,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Bubble(
                nip: BubbleNip.TOP_LEFT,
                color: COLOR_LEFT,
                child: Text('I\'ve been having a problem with my computer.'),
                margin: MARGIN_LEFT,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Bubble(
                nip: BubbleNip.TOP_LEFT,
                color: COLOR_LEFT,
                showNip: false,
                child: Text('Can you help me?'),
                margin: MARGIN_LEFT_NEXT,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Bubble(
                nip: BubbleNip.TOP_RIGHT,
                color: COLOR_RIGHT,
                child: Text('Ok'),
                margin: MARGIN_RIGHT,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Bubble(
                nip: BubbleNip.TOP_RIGHT,
                showNip: false,
                color: COLOR_RIGHT,
                child: Text('What\'s the problem?'),
                margin: MARGIN_RIGHT_NEXT,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
