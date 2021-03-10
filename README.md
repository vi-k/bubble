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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_first.png?raw=true" width="360">

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_color.png?raw=true" width="360">

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_nip.png?raw=true" width="360">

### • stick

If `stick` set to `false` the right offset of bubble equal to the offset from
the left, not taking into account the size of the nip. This allows the bubbles
to line up. If `stick` set to `true`, the far side will be stick to the edge.

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_stick.png?raw=true" width="360">

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_alignment.png?raw=true" width="360">

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_nip_size.png?raw=true" width="360">

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_radius.png?raw=true" width="360">

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_nip_radius.png?raw=true" width="360">

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_offset.png?raw=true" width="360">

### • margin

```dart
Bubble(
  alignment: Alignment.center,
  color: const Color.fromRGBO(212, 234, 244, 1),
  child: const Text('TODAY',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11)),
),
Bubble(
  margin: const BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: const Color.fromRGBO(225, 255, 199, 1),
  child: const Text('Hello, World!', textAlign: TextAlign.right),
),
Bubble(
  margin: const BubbleEdges.only(top: 2),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  showNip: false,
  color: const Color.fromRGBO(225, 255, 199, 1),
  child: const Text('How are you?', textAlign: TextAlign.right),
),
Bubble(
  margin: const BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: const Text('Hi, developer!'),
),
Bubble(
  margin: const BubbleEdges.only(top: 2),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  showNip: false,
  child: const Text('Well, see for yourself'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_margin.png?raw=true" width="360">

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_margin_2.png?raw=true" width="360">

### • elevation

A thick shadow.

```dart
for (var i = 1; i <= 8; i *= 2)
  Column(
    children: <Widget>[
      Bubble(
        margin: BubbleEdges.only(top: 10),
        elevation: i.toDouble(),
        alignment: Alignment.topRight,
        nip: BubbleNip.rightTop,
        color: Color.fromARGB(255, 225, 255, 199),
        child: Text('Hello, World!'),
      ),
      Bubble(
        margin: BubbleEdges.only(top: 10),
        elevation: i.toDouble(),
        alignment: Alignment.topLeft,
        nip: BubbleNip.leftTop,
        child: Text('Hi, developer!'),
      ),
    ],
  ),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_elevation.png?raw=true" width="360">

A thin shadow.

```dart
double px = 1 / MediaQuery.of(context).devicePixelRatio;

...

Bubble(
  elevation: 0,
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, World!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  elevation: 0.5 * px,
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, World!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  elevation: 1 * px,
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, World!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  elevation: 1,
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, World!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  elevation: 0,
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  elevation: 0.5 * px,
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  elevation: 1 * px,
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  elevation: 1,
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_elevation_2.png?raw=true" width="360">

### • shadowColor

```dart
Bubble(
  shadowColor: Colors.red,
  elevation: 2,
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, World!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  shadowColor: Colors.green,
  elevation: 2,
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, World!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  shadowColor: Colors.blue,
  elevation: 2,
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, World!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  shadowColor: Colors.red,
  elevation: 2,
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  shadowColor: Colors.green,
  elevation: 2,
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  shadowColor: Colors.blue,
  elevation: 2,
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_shadow_color.png?raw=true" width="360">

### • padding

```dart
Bubble(
  padding: BubbleEdges.all(2),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, World!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  padding: BubbleEdges.all(2),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  padding: BubbleEdges.all(20),
  alignment: Alignment.topRight,
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, World!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  padding: BubbleEdges.all(20),
  alignment: Alignment.topLeft,
  nip: BubbleNip.leftTop,
  child: Text('Hi, developer!'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_padding.png?raw=true" width="360">
