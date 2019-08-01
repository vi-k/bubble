# Bubble
![GitHub stars](https://img.shields.io/github/stars/vi-k/bubble)
![GitHub](https://img.shields.io/github/license/vi-k/bubble)

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

### - nip

```dart
Bubble(
  style: BubbleStyle(
    nip: BubbleNip.TOP_RIGHT,
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_20.png?raw=true)

### - alignment

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_30.png?raw=true)

### - color

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_40.png?raw=true)

### - radius

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    radius: 0,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    radius: 10,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    radius: 0,
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    radius: 10,
  ),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_50.png?raw=true)

### - nipWidth and nipHeight

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    nipWidth: 8,
    nipHeight: 20,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    nipWidth: 8,
    nipHeight: 20,
  ),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_60.png?raw=true)

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    nipWidth: 30,
    nipHeight: 12,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    nipWidth: 30,
    nipHeight: 12,
  ),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_70.png?raw=true)

### - nipRadius

```dart
for (var i = 0; i <= 6; i++)
  Bubble(
    style: BubbleStyle(
      margin: EdgeInsets.only(top: 4),
      alignment: Alignment.topRight,
      nip: BubbleNip.TOP_RIGHT,
      nipWidth: 30,
      nipHeight: 12,
      nipRadius: i.toDouble(),
      color: Color.fromARGB(255, 225, 255, 199),
    ),
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 6; i++)
  Bubble(
    style: BubbleStyle(
      margin: EdgeInsets.only(top: 4),
      alignment: Alignment.topLeft,
      nip: BubbleNip.TOP_LEFT,
      nipWidth: 30,
      nipHeight: 12,
      nipRadius: i.toDouble(),
    ),
    child: Text('Hello, programmer!'),
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_80.png?raw=true)

Scheme:

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/scheme.jpg?raw=true)

### - nipOffset

```dart
for (var i = 0; i <= 6; i++)
  Bubble(
    style: BubbleStyle(
      margin: EdgeInsets.only(top: 4),
      alignment: Alignment.topRight,
      nip: BubbleNip.TOP_RIGHT,
      nipWidth: 30,
      nipHeight: 12,
      nipRadius: i.toDouble(),
      nipOffset: 8,
      color: Color.fromARGB(255, 225, 255, 199),
    ),
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 6; i++)
  Bubble(
    style: BubbleStyle(
      margin: EdgeInsets.only(top: 4),
      alignment: Alignment.topLeft,
      nip: BubbleNip.TOP_LEFT,
      nipWidth: 30,
      nipHeight: 12,
      nipRadius: i.toDouble(),
      nipOffset: 8,
    ),
    child: Text('Hello, programmer!'),
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_90.png?raw=true)

```dart
for (var i = 0; i <= 12; i += 3)
  Bubble(
    style: BubbleStyle(
      margin: EdgeInsets.only(top: 4),
      alignment: Alignment.topRight,
      nip: BubbleNip.TOP_RIGHT,
      nipOffset: i.toDouble(),
      color: Color.fromARGB(255, 225, 255, 199),
    ),
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 12; i += 3)
  Bubble(
    style: BubbleStyle(
      margin: EdgeInsets.only(top: 4),
      alignment: Alignment.topLeft,
      nip: BubbleNip.TOP_LEFT,
      nipOffset: i.toDouble(),
    ),
    child: Text('Hello, programmer!'),
  ),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_100.png?raw=true)

### - showNip

Add second bubble to everyone.

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 2),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('How are you?'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 2),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('And how are you?'),
),
```


![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_110.png?raw=true)

Second, third et al bubbles in WhatsApp haven't nips. Remove them.

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 2),
    alignment: Alignment.topRight,
    //nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('How are you?'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 2),
    alignment: Alignment.topLeft,
    //nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('And how are you?'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_120.png?raw=true)

It's not that. Hide nips!

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 2),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    showNip: false,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('How are you?'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 2),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    showNip: false,
  ),
  child: Text('And how are you?'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_130.png?raw=true)

It's ok :)

### - elevation

A thick shadow.

```dart
for (var i = 1; i <= 8; i *= 2)
  Column(
    children: <Widget>[
      Bubble(
        style: BubbleStyle(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.topRight,
          nip: BubbleNip.TOP_RIGHT,
          color: Color.fromARGB(255, 225, 255, 199),
          elevation: i.toDouble(),
        ),
        child: Text('Hello, world!'),
      ),
      Bubble(
        style: BubbleStyle(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.topLeft,
          nip: BubbleNip.TOP_LEFT,
          elevation: i.toDouble(),
        ),
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
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    elevation: 0,
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    elevation: 0.5 * px,
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    elevation: 1 * px,
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    elevation: 1,
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    elevation: 0,
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    elevation: 0.5 * px,
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    elevation: 1 * px,
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    elevation: 1,
  ),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_150.png?raw=true)

### - shadowColor

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    elevation: 2,
    shadowColor: Colors.red,
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    elevation: 2,
    shadowColor: Colors.green,
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    elevation: 2,
    shadowColor: Colors.blue,
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    elevation: 2,
    shadowColor: Colors.red,
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    elevation: 2,
    shadowColor: Colors.green,
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    elevation: 2,
    shadowColor: Colors.blue,
  ),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_160.png?raw=true)

### - margin

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!'
    'Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer! Hello, programmer! Hello, programmer! Hello, programmer! '
    'Hello, programmer! Hello, programmer! Hello, programmer! Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_170.png?raw=true)

```dart
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(left: 50),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!'
    'Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10, right: 50),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer! Hello, programmer! Hello, programmer! Hello, programmer! '
    'Hello, programmer! Hello, programmer! Hello, programmer! Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_180.png?raw=true)

### - padding

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    padding: EdgeInsets.all(2),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    padding: EdgeInsets.all(2),
  ),
  child: Text('Hello, programmer!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
    padding: EdgeInsets.all(20),
  ),
  child: Text('Hello, world!'),
),
Bubble(
  style: BubbleStyle(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    padding: EdgeInsets.all(20),
  ),
  child: Text('Hello, programmer!'),
),
```

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_190.png?raw=true)
