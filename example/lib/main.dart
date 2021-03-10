import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:bubble/issue_clipper.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const title = 'Bubble Demo';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const MyHomePage(
          title: title,
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const styleSomebody = BubbleStyle(
    nip: BubbleNip.leftCenter,
    color: Colors.white,
    borderColor: Colors.blue,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, right: 50),
    alignment: Alignment.topLeft,
  );

  static const styleMe = BubbleStyle(
    nip: BubbleNip.rightCenter,
    color: Color.fromARGB(255, 225, 255, 199),
    borderColor: Colors.blue,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, left: 50),
    alignment: Alignment.topRight,
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.yellow.withAlpha(64),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Bubble(
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 212, 234, 244),
                borderColor: Colors.black,
                borderWidth: 2,
                margin: const BubbleEdges.only(top: 8),
                child: const Text(
                  'TODAY',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Bubble(
                style: styleSomebody,
                child: const Text(
                    'Hi Jason. Sorry to bother you. I have a queston for you.'),
              ),
              Bubble(
                style: styleMe,
                child: const Text("Whats'up?"),
              ),
              Bubble(
                style: styleSomebody,
                child:
                    const Text("I've been having a problem with my computer."),
              ),
              Bubble(
                style: styleSomebody,
                margin: const BubbleEdges.only(top: 4),
                showNip: false,
                child: const Text('Can you help me?'),
              ),
              Bubble(
                style: styleMe,
                child: const Text('Ok'),
              ),
              Bubble(
                style: styleMe,
                showNip: false,
                margin: const BubbleEdges.only(top: 4),
                child: const Text("What's the problem?"),
              ),
              Bubble(
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 212, 234, 244),
                margin: const BubbleEdges.only(top: 32, bottom: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'The failed shadow',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // Platform.,
                    MaterialButton(
                      onPressed: () async {
                        const url =
                            'https://github.com/flutter/flutter/issues/37779';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: const Text(
                        'https://github.com/flutter/flutter/issues/37779',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PhysicalShape(
                clipBehavior: Clip.antiAlias,
                clipper: IssueClipper(0),
                color: Colors.lightGreen,
                elevation: 2,
                child: const SizedBox(width: 80, height: 40),
              ),
              const Divider(),
              PhysicalShape(
                clipBehavior: Clip.antiAlias,
                clipper: IssueClipper(1),
                color: Colors.lightGreen,
                elevation: 2,
                child: const SizedBox(width: 80, height: 40),
              ),
              const Divider(),
              PhysicalShape(
                clipBehavior: Clip.antiAlias,
                clipper: IssueClipper(2),
                color: Colors.lightGreen.withAlpha(64),
                elevation: 2,
                child: const SizedBox(width: 80, height: 40),
              ),
              const Divider(),
              PhysicalShape(
                clipBehavior: Clip.antiAlias,
                clipper: IssueClipper(3),
                color: Colors.lightGreen.withAlpha(64),
                elevation: 2,
                child: const SizedBox(width: 80, height: 40),
              ),
              Bubble(
                margin: const BubbleEdges.only(top: 5),
                elevation: 10,
                shadowColor: Colors.red[900],
                alignment: Alignment.topRight,
                nip: BubbleNip.rightTop,
                color: Colors.green,
                child: const Text('dsfdfdfg'),
              )
            ],
          ),
        ),
      );
}
