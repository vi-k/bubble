        child: ListView(
          children: [
            Divider(height: 40, color: Colors.black),
            Bubble(
              nip: BubbleNip.TOP_RIGHT,
              child: Text('Hello, world!'),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              nip: BubbleNip.TOP_LEFT,
              child: Text('Hello, programmer!'),
            ),
            Divider(height: 40, color: Colors.black),
          ],
        ),
