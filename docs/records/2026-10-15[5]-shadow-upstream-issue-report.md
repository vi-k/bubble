# Новое issue во Flutter про тень вогнутого контура

> **Состояние на 2026-10-15:** черновик готов, не отправлен. Картинку GitHub
> принимает только из браузера, а расширение Chrome не подключено.
> **Что это:** уточнение причины клина из записи `[4]` и текст нового issue
> в flutter/flutter со ссылкой на #37779.
> **Связанные записи:** `2026-10-15[4]-shadow-issue-report.md`.

## Уточнение к записи `[4]`

В `[4]` сказано, что клин даёт путь, который строит `Path.combine`, а та же
фигура одним контуром рисуется верно. Это неточно: одним контуром проверялся
только путь, начатый с одной вершины.

Проба на 3.47.0, `flutter test`: L-образная фигура 160×80 без нижнего левого
угла 40×40, шесть стартовых вершин в обе стороны,
`Canvas.drawShadow(path, Colors.black, 4, true)` под полупрозрачной заливкой.
Ломаются ровно два пути: по часовой стрелке из `(40, 80)` и против часовой
из `(0, 40)`. В обоих внутренний угол `(40, 40)` идёт в пути вторым. Поломка
другая, чем клин: тень стягивается к середине фигуры, от внутреннего угла
тянется тёмная щель. Путь из `Path.combine` двух прямоугольников с той же
фигурой даёт клин в левом верхнем углу.

`PhysicalShape` здесь ни при чём: `Canvas.drawShadow(..., true)` ломается
так же. `PhysicalShape` сам зовёт `drawShadow(..., color.alpha != 0xFF)`
(`rendering/proxy_box.dart` в 3.47.0), то есть с `true` только при
полупрозрачном цвете. Поэтому в #37779 дефект и виден лишь на полупрозрачных
фигурах.

Где проверен минимальный пример: macOS со Skia (Metal) — две фигуры из трёх
сломаны; macOS с Impeller — все три верные; веб
(`flutter test --platform chrome`) и `flutter test` — как Skia.

## Текст issue

Заголовок: Skia: drawShadow with a transparent occluder breaks on a concave
path depending on where the path starts (Impeller is fine)

В конце issue — вывод `flutter doctor -v` со stable 3.47.0, здесь он опущен.
Из списка устройств вычищены телефоны и ошибки их подключения: там были имена
устройств владельца, локальные адреса и серийный номер. Картинка: слева Skia,
справа Impeller, macOS, 3.47.0; на её место в тексте стоит строка `SCREENSHOT`.

````markdown
Follow-up to #37779. It was closed as fixed in 2022, but it still reproduces with Skia: the screenshot posted when it was closed shows the same diagonal cut under the two translucent shapes as the original report. The thread is locked, so here is a smaller sample and a comparison with Impeller.

### Steps to reproduce

1. `flutter create bug` and replace `lib/main.dart` with the code sample below.
2. Run it with Skia: `flutter run -d macos --no-enable-impeller`.
3. Run it with Impeller: `flutter run -d macos --enable-impeller`.

The sample draws one L-shaped outline three times, with `Canvas.drawShadow(path, Colors.black, 4, true)` under a translucent fill. The shape is the same each time; only the path differs. `PhysicalShape` takes the same route for a non-opaque color (`transparentOccluder: color.alpha != 0xFF`), which is how #37779 ran into it.

### Expected results

All three shapes cast the same shadow, the way Impeller draws them.

### Actual results

With Skia, two of the three are broken:

- **starts at (40, 80):** the shadow shrinks towards the middle of the shape, with a dark sliver running in from the inner corner; most of the shape has hardly any shadow under it.
- **Path.combine of two rects:** a diagonal wedge at the top-left corner has no shadow, as in #37779.

The path that starts at (0, 0) is fine. Trying every start vertex in both directions (in `flutter test`), the shadow breaks exactly when the inner corner (40, 40) is the second point of the path: clockwise from (40, 80) and counterclockwise from (0, 40).

The same happens on Flutter 3.47.0 with Skia on macOS (`--no-enable-impeller`), on the web (`flutter test --platform chrome`) and in `flutter test`. Impeller on macOS draws all three shapes correctly.

### Code sample

<details open><summary>Code sample</summary>

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// An L-shaped outline: a 160x80 rectangle without its bottom-left 40x40
// corner. All three paths below trace these same six vertices.
const vertices = [
  Offset(0, 0),
  Offset(160, 0),
  Offset(160, 80),
  Offset(40, 80),
  Offset(40, 40),
  Offset(0, 40),
];

Path lShape({required int start}) {
  final path = Path()..moveTo(vertices[start].dx, vertices[start].dy);
  for (var i = 1; i < vertices.length; i++) {
    final v = vertices[(start + i) % vertices.length];
    path.lineTo(v.dx, v.dy);
  }
  return path..close();
}

Path lShapeByCombine() => Path.combine(
      PathOperation.union,
      Path()..addRect(const Rect.fromLTRB(40, 0, 160, 80)),
      Path()..addRect(const Rect.fromLTRB(0, 0, 80, 40)),
    );

class ShadowPainter extends CustomPainter {
  ShadowPainter(this.shape);

  final Path shape;

  @override
  void paint(Canvas canvas, Size size) {
    // A translucent fill, so the shadow under the shape is visible.
    // PhysicalShape does the same for a non-opaque color.
    canvas.drawShadow(shape, Colors.black, 4, true);
    canvas.drawPath(shape, Paint()..color = Colors.green.withAlpha(64));
  }

  @override
  bool shouldRepaint(ShadowPainter oldDelegate) => false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final shapes = {
    'starts at (0, 0)': lShape(start: 0),
    'starts at (40, 80)': lShape(start: 3),
    'Path.combine of two rects': lShapeByCombine(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final MapEntry(:key, :value) in shapes.entries) ...[
                Text(key),
                const SizedBox(height: 8),
                CustomPaint(
                  size: const Size(160, 80),
                  painter: ShadowPainter(value),
                ),
                const SizedBox(height: 24),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
```

</details>

### Screenshots or Video

<details open>
<summary>Screenshots / Video demonstration</summary>

Left: Skia, right: Impeller. macOS, Flutter 3.47.0.

SCREENSHOT

</details>

### Logs

<details open><summary>Logs</summary>

```console
[IMPORTANT:flutter/shell/platform/darwin/macos/framework/Source/FlutterEngine.mm(685)] Using the Skia rendering backend (Metal).
```

```console
[IMPORTANT:flutter/shell/platform/embedder/embedder_surface_metal_impeller.mm(53)] Using the Impeller rendering backend (MetalSDF).
```

No errors or warnings otherwise.

</details>
````
