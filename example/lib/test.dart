child: ListView(
  children: [
    Divider(height: 40, color: Colors.black),
    Bubble(
      nip: BubbleNip.topRight,
      child: Text('Hello, world!'),
    ),
    Bubble(
      margin: BubbleEdges.only(top: 10),
      nip: BubbleNip.topLeft,
      child: Text('Hello, programmer!'),
    ),
    Divider(height: 40, color: Colors.black),
  ],
),
