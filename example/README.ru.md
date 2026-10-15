# bubble example

> Перевод `example/README.md` (blob `4456d159073af6b6876a0358a36a01555b4c5533`).
> Правится в том же коммите, что и оригинал; проверка: `sh docs/ru/check.sh`.

Короткий чат из виджетов `Bubble`.

```sh
cd example
flutter run
```

Каждая сторона разговора описана одним `BubbleStyle`. Стиль объявлен один раз
и передаётся в каждый пузырь этой стороны:

```dart
static const styleSomebody = BubbleStyle(
  nip: BubbleNip.leftCenter,
  color: Colors.white,
  borderColor: Colors.blue,
  borderWidth: 1,
  elevation: 4,
  margin: BubbleEdges.only(top: 8, right: 50),
  alignment: Alignment.topLeft,
);
```

Когда одна сторона пишет несколько сообщений подряд, хвостик есть только
у первого. Остальные передают `showNip: false`: хвостик скрыт, но место под ним
остаётся, и пузыри стоят ровной колонкой. Их `margin` меняет у стиля только
верхний отступ:

```dart
Bubble(
  style: styleSomebody,
  margin: const BubbleEdges.only(top: 4),
  showNip: false,
  child: const Text('Can you help me?'),
),
```

Под чатом четыре `PhysicalShape` с контурами `IssueClipper` показывают, как
Flutter отбрасывал тень пути из нескольких контуров
([flutter/flutter#37779](https://github.com/flutter/flutter/issues/37779)).
Из-за этого `BubbleClipper` с версии 1.2.0 присоединяет хвостик
к прямоугольнику через `Path.combine`, а не добавляет его вторым контуром.
