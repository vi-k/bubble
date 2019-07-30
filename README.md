# Bubble

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

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_10.png?raw=true" width="360">

```dart
Bubble(
  *style: BubbleStyle(*
    nip: BubbleNip.TOP_RIGHT,
  ),
  child: Text('Hello, world!'),
),
Container(height: 10),
Bubble(
  style: BubbleStyle(
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer!'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_20.png?raw=true" width="360">

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
  ),
  child: Text('Hello, world!'),
),
Container(height: 10),
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer!'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_30.png?raw=true" width="360">

```dart
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Container(height: 10),
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
  ),
  child: Text('Hello, programmer!'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_40.png?raw=true" width="360">

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
Container(height: 10),
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topRight,
    nip: BubbleNip.TOP_RIGHT,
    radius: 10,
    color: Color.fromARGB(255, 225, 255, 199),
  ),
  child: Text('Hello, world!'),
),
Container(height: 10),
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    radius: 0,
  ),
  child: Text('Hello, programmer!'),
),
Container(height: 10),
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    radius: 10,
  ),
  child: Text('Hello, programmer!'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_50.png?raw=true" width="360">

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
Container(height: 10),
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    nipWidth: 8,
    nipHeight: 20,
  ),
  child: Text('Hello, programmer!'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_60.png?raw=true" width="360">

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
Container(height: 10),
Bubble(
  style: BubbleStyle(
    alignment: Alignment.topLeft,
    nip: BubbleNip.TOP_LEFT,
    nipWidth: 30,
    nipHeight: 12,
  ),
  child: Text('Hello, programmer!'),
),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_70.png?raw=true" width="360">

```dart
for (var i = 0; i <= 6; i++)
  Bubble(
    style: BubbleStyle(
      alignment: Alignment.topRight,
      nip: BubbleNip.TOP_RIGHT,
      nipWidth: 30,
      nipHeight: 12,
      nipRadius: i.toDouble(),
      color: Color.fromARGB(255, 225, 255, 199),
      margin: EdgeInsets.only(top: 4),
    ),
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 6; i++)
  Bubble(
    style: BubbleStyle(
      alignment: Alignment.topLeft,
      nip: BubbleNip.TOP_LEFT,
      nipWidth: 30,
      nipHeight: 12,
      nipRadius: i.toDouble(),
      margin: EdgeInsets.only(top: 4),
    ),
    child: Text('Hello, programmer!'),
  ),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_80.png?raw=true" width="360">

```dart
for (var i = 0; i <= 6; i++)
  Bubble(
    style: BubbleStyle(
      alignment: Alignment.topRight,
      nip: BubbleNip.TOP_RIGHT,
      nipWidth: 30,
      nipHeight: 12,
      nipRadius: i.toDouble(),
      nipOffset: 8,
      color: Color.fromARGB(255, 225, 255, 199),
      margin: EdgeInsets.only(top: 4),
    ),
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 6; i++)
  Bubble(
    style: BubbleStyle(
      alignment: Alignment.topLeft,
      nip: BubbleNip.TOP_LEFT,
      nipWidth: 30,
      nipHeight: 12,
      nipRadius: i.toDouble(),
      nipOffset: 8,
      margin: EdgeInsets.only(top: 4),
    ),
    child: Text('Hello, programmer!'),
  ),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_90.png?raw=true" width="360">

```dart
for (var i = 0; i <= 12; i += 3)
  Bubble(
    style: BubbleStyle(
      alignment: Alignment.topRight,
      nip: BubbleNip.TOP_RIGHT,
      nipOffset: i.toDouble(),
      color: Color.fromARGB(255, 225, 255, 199),
      margin: EdgeInsets.only(top: 4),
    ),
    child: Text('Hello, world!'),
  ),
for (var i = 0; i <= 12; i += 3)
  Bubble(
    style: BubbleStyle(
      alignment: Alignment.topLeft,
      nip: BubbleNip.TOP_LEFT,
      nipOffset: i.toDouble(),
      margin: EdgeInsets.only(top: 4),
    ),
    child: Text('Hello, programmer!'),
  ),
```

<img src="https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_100.png?raw=true" width="360">
