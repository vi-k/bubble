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
