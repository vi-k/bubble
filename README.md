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

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_10.png?raw=true)

### Properties: nip, margin

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

### Property: alignment

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_20.png?raw=true)

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

### Property: color

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

### Property: radius

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

### Properties: nipWidth, nipHeight

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

### Property: nipRadius

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

### Property: nipOffset

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

### Property: showNip

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

Badly :((

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_110.png?raw=true)

Remove nips.

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

Badly too :((

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_120.png?raw=true)

Hide nips.

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

Ok! :)

![Bubble](https://github.com/vi-k/bubble/blob/master/screenshots/screenshot_130.png?raw=true)
