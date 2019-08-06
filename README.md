# Bubble
[![Pub](https://img.shields.io/pub/v/bubble)](https://pub.dev/packages/bubble)
[![GitHub last commit](https://img.shields.io/github/last-commit/vi-k/bubble?color=red)](https://github.com/vi-k/bubble)
[![GitHub stars](https://img.shields.io/github/stars/vi-k/bubble?style=social)](https://github.com/vi-k/bubble)

A Flutter widget for chat like a speech bubble in Whatsapp and others.

## Example

See [sources](https://github.com/vi-k/bubble/blob/master/example).

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/example.png?raw=true" width="360">

## Usage

```dart
Bubble(
  child: Text('Hello, world!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_10.png?raw=true)

### ● nip

```dart
Bubble(
  nip: BubbleNip.topRight,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  nip: BubbleNip.topLeft,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_20.png?raw=true)

### ● alignment

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_30.png?raw=true)

### ● color

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_40.png?raw=true)

### ● radius

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  radius: 0,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  radius: 10,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  radius: 0,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  radius: 10,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_50.png?raw=true)

### ● nipWidth and nipHeight

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  nipWidth: 8,
  nipHeight: 20,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  nipWidth: 8,
  nipHeight: 20,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_60.png?raw=true)

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  nipWidth: 30,
  nipHeight: 12,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  nipWidth: 30,
  nipHeight: 12,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_70.png?raw=true)

### ● nipRadius

```dart
for (var i = 0; i <= 6; i++)
  Bubble(
    margin: BubbleEdges.only(top: 4),
    alignment: Alignment.topRight,
    nip: BubbleNip.topRight,
    nipWidth: 30,
    nipHeight: 12,
    nipRadius: i.toDouble(),
    color: Color.fromARGB(255, 225, 255, 199),
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 6; i++)
  Bubble(
    margin: BubbleEdges.only(top: 4),
    alignment: Alignment.topLeft,
    nip: BubbleNip.topLeft,
    nipWidth: 30,
    nipHeight: 12,
    nipRadius: i.toDouble(),
    child: Text('Hello, programmer!'),
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_80.png?raw=true)

Scheme:

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/scheme.jpg?raw=true)

### ● stick

```dart
for (var i = 0; i <= 6; i++)
  Bubble(
    margin: BubbleEdges.only(top: 4),
    alignment: Alignment.topRight,
    nip: BubbleNip.topRight,
    nipWidth: 30,
    nipHeight: 12,
    nipRadius: i.toDouble(),
    color: Color.fromARGB(255, 225, 255, 199),
    stick: true,
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 6; i++)
  Bubble(
    margin: BubbleEdges.only(top: 4),
    alignment: Alignment.topLeft,
    nip: BubbleNip.topLeft,
    nipWidth: 30,
    nipHeight: 12,
    nipRadius: i.toDouble(),
    stick: true,
    child: Text('Hello, programmer!'),
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_85.png?raw=true)

### ● nipOffset

```dart
for (var i = 0; i <= 6; i++)
  Bubble(
    margin: BubbleEdges.only(top: 4),
    alignment: Alignment.topRight,
    nip: BubbleNip.topRight,
    nipWidth: 30,
    nipHeight: 12,
    nipRadius: i.toDouble(),
    nipOffset: 8,
    color: Color.fromARGB(255, 225, 255, 199),
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 6; i++)
  Bubble(
    margin: BubbleEdges.only(top: 4),
    alignment: Alignment.topLeft,
    nip: BubbleNip.topLeft,
    nipWidth: 30,
    nipHeight: 12,
    nipRadius: i.toDouble(),
    nipOffset: 8,
    child: Text('Hello, programmer!'),
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_90.png?raw=true)

```dart
for (var i = 0; i <= 12; i += 3)
  Bubble(
    margin: BubbleEdges.only(top: 4),
    alignment: Alignment.topRight,
    nip: BubbleNip.topRight,
    nipOffset: i.toDouble(),
    color: Color.fromARGB(255, 225, 255, 199),
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 12; i += 3)
  Bubble(
    margin: BubbleEdges.only(top: 4),
    alignment: Alignment.topLeft,
    nip: BubbleNip.topLeft,
    nipOffset: i.toDouble(),
    child: Text('Hello, programmer!'),
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_100.png?raw=true)

### ● showNip

Add second bubble to everyone.

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 2),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('How are you?'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 2),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  child: Text('And how are you?'),
),
```


![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_110.png?raw=true)

Second, third et al bubbles in WhatsApp haven't nips. Remove them.

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 2),
  alignment: Alignment.topRight,
  nip: BubbleNip.no,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('How are you?'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 2),
  alignment: Alignment.topLeft,
  nip: BubbleNip.no,
  child: Text('And how are you?'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_120.png?raw=true)

It's not that. Hide nips!

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 2),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  showNip: false,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('How are you?'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 2),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  showNip: false,
  child: Text('And how are you?'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_130.png?raw=true)

It's ok :)

### ● elevation

A thick shadow.

```dart
for (var i = 1; i <= 8; i *= 2)
  Column(
    children: <Widget>[
      Bubble(
        margin: BubbleEdges.only(top: 10),
        alignment: Alignment.topRight,
        nip: BubbleNip.topRight,
        color: Color.fromARGB(255, 225, 255, 199),
        elevation: i.toDouble(),
        child: Text('Hello, world!'),
      ),
      Bubble(
        margin: BubbleEdges.only(top: 10),
        alignment: Alignment.topLeft,
        nip: BubbleNip.topLeft,
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
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 0,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 0.5 * px,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 1 * px,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 1,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  elevation: 0,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  elevation: 0.5 * px,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  elevation: 1 * px,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  elevation: 1,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_150.png?raw=true)

### ● shadowColor

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 2,
  shadowColor: Colors.red,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 2,
  shadowColor: Colors.green,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 2,
  shadowColor: Colors.blue,
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  elevation: 2,
  shadowColor: Colors.red,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  elevation: 2,
  shadowColor: Colors.green,
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  elevation: 2,
  shadowColor: Colors.blue,
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_160.png?raw=true)

### ● margin

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!'
    'Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  child: Text('Hello, programmer! Hello, programmer! Hello, programmer! Hello, programmer! '
    'Hello, programmer! Hello, programmer! Hello, programmer! Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_170.png?raw=true)

```dart
Bubble(
  margin: BubbleEdges.only(left: 50),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  child: Text('Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!'
    'Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10, right: 50),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  child: Text('Hello, programmer! Hello, programmer! Hello, programmer! Hello, programmer! '
    'Hello, programmer! Hello, programmer! Hello, programmer! Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_180.png?raw=true)

### ● padding

```dart
Bubble(
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  padding: BubbleEdges.all(2),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  padding: BubbleEdges.all(2),
  child: Text('Hello, programmer!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topRight,
  nip: BubbleNip.topRight,
  color: Color.fromARGB(255, 225, 255, 199),
  padding: BubbleEdges.all(20),
  child: Text('Hello, world!'),
),
Bubble(
  margin: BubbleEdges.only(top: 10),
  alignment: Alignment.topLeft,
  nip: BubbleNip.topLeft,
  padding: BubbleEdges.all(20),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_190.png?raw=true)
