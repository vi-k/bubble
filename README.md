# Bubble
[![Pub](https://img.shields.io/pub/v/bubble)](https://pub.dev/packages/bubble)
[![GitHub stars](https://img.shields.io/github/stars/vi-k/bubble?style=social)](https://github.com/vi-k/bubble)

A Flutter widget for chat like a speech bubble in Whatsapp and others.

## Example

See [sources](https://github.com/vi-k/bubble/blob/master/example).

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/example.png?raw=true" width="360">

## Usage

```dart
Bubble(
  child: Text('Hello, World!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_first.png?raw=true)

### • color

```dart
Bubble(
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  child: Text('Hi, developer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_color.png?raw=true)

### • nip

```dart
Bubble(
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  nip: BubbleNip.rightBottom,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  nip: BubbleNip.leftBottom,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  nip: BubbleNip.no,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TOMORROW', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_nip.png?raw=true)

### • stick

```dart
Bubble(
  stick: true,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  stick: true,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  stick: true,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  stick: true,
  nip: BubbleNip.rightBottom,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  stick: true,
  nip: BubbleNip.leftBottom,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  stick: true,
  nip: BubbleNip.no,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TOMORROW', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_stick.png?raw=true)

### • alignment

```dart
Bubble(
  alignment: Alignment.center,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightBottom,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftBottom,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.center,
  nip: BubbleNip.no,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TOMORROW', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_alignment.png?raw=true)

### • nipWidth and nipHeight

```dart
Bubble(
  alignment: Alignment.center,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nipWidth: 8,
  nipHeight: 24,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nipWidth: 8,
  nipHeight: 24,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nipWidth: 30,
  nipHeight: 10,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nipWidth: 30,
  nipHeight: 10,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.center,
  nip: BubbleNip.no,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TOMORROW', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_nip_size.png?raw=true)

### • radius

```dart
Bubble(
  alignment: Alignment.center,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  radius: Radius.zero,
  alignment: Alignment.topRight,
  nipWidth: 8,
  nipHeight: 24,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  radius: Radius.zero,
  alignment: Alignment.topLeft,
  nipWidth: 8,
  nipHeight: 24,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  radius: Radius.elliptical(5.0, 10.0),
  alignment: Alignment.topRight,
  nipWidth: 30,
  nipHeight: 10,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  radius: Radius.elliptical(5.0, 10.0),
  alignment: Alignment.topLeft,
  nipWidth: 30,
  nipHeight: 10,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  radius: Radius.circular(20.0),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  radius: Radius.circular(20.0),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.center,
  nip: BubbleNip.no,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TOMORROW', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_radius.png?raw=true)

### • nipRadius

```dart
for (var i = 0; i <= 5; i++)
  Bubble(
    margin: BubbleEdges.only(top: 10),
    nipRadius: i.toDouble(),
    alignment: Alignment.topRight,
    nipWidth: 30,
    nipHeight: 10,
    nip: BubbleNip.rightTop,
    color: Color.fromRGBO(225, 255, 199, 1.0),
    child: Text('Hello, World!', textAlign: TextAlign.right),
  ),
for (var i = 0; i <= 5; i++)
  Bubble(
    margin: BubbleEdges.only(top: 10),
    nipRadius: i.toDouble(),
    alignment: Alignment.topLeft,
    nipWidth: 30,
    nipHeight: 10,
    nip: BubbleNip.leftTop,
    child: Text('Hi, developer!'),
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_nip_radius.png?raw=true)

Scheme:

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/scheme.jpg?raw=true)

### • nipOffset

```dart
for (var i = 0; i <= 15; i += 3)
  Bubble(
    margin: BubbleEdges.only(top: 10),
    nipOffset: i.toDouble(),
    alignment: Alignment.topRight,
    nipWidth: 30,
    nipHeight: 10,
    nip: BubbleNip.rightTop,
    color: Color.fromRGBO(225, 255, 199, 1.0),
    child: Text('Hello, World!', textAlign: TextAlign.right),
  ),
for (var i = 0; i <= 15; i += 3)
  Bubble(
    margin: BubbleEdges.only(top: 10),
    nipOffset: i.toDouble(),
    alignment: Alignment.topLeft,
    nipWidth: 30,
    nipHeight: 10,
    nip: BubbleNip.leftTop,
    child: Text('Hi, developer!'),
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_offset.png?raw=true)

### • margin

```dart
Bubble(
  alignment: Alignment.center,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 2),
  alignment: Alignment.topRight,
  nip: BubbleNip.no,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('How are you?', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 2),
  alignment: Alignment.topLeft,
  nip: BubbleNip.no,
  child: Text('Well, see for yourself'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_margin.png?raw=true)

```dart
Bubble(
  alignment: Alignment.center,
  color: Color.fromRGBO(212, 234, 244, 1.0),
  child: Text('TODAY', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World! Hello, World! Hello, World! Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer! Hi, developer! Hi, developer! Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10, left: 40),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromRGBO(225, 255, 199, 1.0),
  child: Text('Hello, World! Hello, World! Hello, World! Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: BubbleEdges.only(top: 10, right: 40),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer! Hi, developer! Hi, developer! Hi, developer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_margin_2.png?raw=true)

### • elevation

A thick shadow.

```dart
for (var i = 1; i <= 8; i *= 2)
  Column(
    children: <Widget>[
      Bubble(
        margin: BubbleEdges.only(top: 10),
        alignment: Alignment.topRight,
        nip: BubbleNip.rightTop,
        color: Color.fromARGB(255, 225, 255, 199),
        elevation: i.toDouble(),
        child: Text('Hello, world!'),
      ),
      Bubble(
        margin: BubbleEdges.only(top: 10),
        alignment: Alignment.topLeft,
        nip: BubbleNip.leftTop,
        elevation: i.toDouble(),
        child: Text('Hello, programmer!'),
      ),
    ],
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_140.png?raw=true)

A thin shadow.

```dart
double px = 1 / MediaQuery.of(context).devicePixelRatio;

...
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 0,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 0.5 * px,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 1 * px,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 1,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  elevation: 0,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  elevation: 0.5 * px,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  elevation: 1 * px,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  elevation: 1,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_150.png?raw=true)

### • shadowColor

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 2,
  shadowColor: Colors.red,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 2,
  shadowColor: Colors.green,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 2,
  shadowColor: Colors.blue,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  elevation: 2,
  shadowColor: Colors.red,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  elevation: 2,
  shadowColor: Colors.green,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  elevation: 2,
  shadowColor: Colors.blue,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_160.png?raw=true)

### • padding

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  padding: BubbleEdges.all(2),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  padding: BubbleEdges.all(2),
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  padding: BubbleEdges.all(20),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  padding: BubbleEdges.all(20),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_190.png?raw=true)
