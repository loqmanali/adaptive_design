# Adaptive Design

A Flutter package that simplifies the creation of responsive and adaptive user interfaces. **Adaptive Design** combines the strengths of existing responsive packages while addressing their limitations, providing an easy-to-use API for developers.

## Features

- **Responsive Sizing**: Scale widgets and fonts according to screen size.
- **Breakpoint Management**: Handle different layouts for mobile, tablet, and desktop.
- **Device and Orientation Detection**: Access device type and orientation information.
- **Adaptive Widgets**: Build widgets that adapt to different screen sizes.
- **Responsive Text**: Automatically scale text for different devices.
- **Customizable**: Set custom base sizes and breakpoints.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  adaptive_design: ^1.0.0
```

OR

``` yaml
    dependencies:
      adaptive_design:
        git:
          url: https://github.com/loqmanali/adaptive_design.git
          ref: main
```

Then, run:

```bash
flutter pub get
```

## Getting Started

### 1. Initialization

Wrap your app with `AdaptiveDesignProvider` in your `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:adaptive_design/adaptive_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveDesignProvider(
      context: context,
      child: MaterialApp(
        title: 'Adaptive Design Demo',
        home: HomePage(),
      ),
    );
  }
}
```

### 2. Accessing Responsive Utilities

Use `AdaptiveDesignProvider.of(context)` to access responsive utilities:

```dart
import 'package:flutter/material.dart';
import 'package:adaptive_design/adaptive_design.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final adaptiveDesign = AdaptiveDesignProvider.of(context);
    final size = adaptiveDesign.size;

    return Scaffold(
      appBar: AppBar(
        title: ResponsiveText('Adaptive Design Demo'),
      ),
      body: Center(
        child: Container(
          width: size.scaleWidth(250),
          height: size.scaleHeight(150),
          color: Colors.blue,
          child: Center(
            child: ResponsiveText(
              'This is a responsive container',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3. Using Adaptive Widgets

### AdaptiveContainer

Build different layouts based on device type:

```dart
AdaptiveContainer(
  mobileBuilder: (_) => MobileLayout(),
  tabletBuilder: (_) => TabletLayout(),
  desktopBuilder: (_) => DesktopLayout(),
);
```

### ResponsiveText (1)

- **Constructor**:

    ```dart
    ResponsiveText(
      'Your text here',
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
    ```

### ResponsiveText (2)

- **Constructor**:

    ```dart
    ResponsiveText(
      'Your text here',
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
    ```

## Customization

### Base Sizes

Set custom base width and height:

```dart
AdaptiveDesignProvider(
  context: context,
  baseWidth: 360.0,
  baseHeight: 640.0,
  child: MyApp(),
);
```

### Breakpoints

Set custom breakpoints:

```dart
AdaptiveDesignProvider(
  context: context,
  mobileBreakpoint: 480.0,
  tabletBreakpoint: 800.0,
  child: MyApp(),
);
```

## API Reference

### AdaptiveDesignProvider

- **Properties**:
  - `size`: Provides responsive sizing methods.
  - `breakpointManager`: Manages breakpoints and device types.
  - `deviceInfo`: Provides device and orientation information.

### ResponsiveSize

- **Methods**:
  - `wp(double percentage)`: Width as a percentage of screen width.
  - `hp(double percentage)`: Height as a percentage of screen height.
  - `scaleWidth(double size)`: Scaled width based on base width.
  - `scaleHeight(double size)`: Scaled height based on base height.
  - `scaleFont(double size)`: Scaled font size.

### BreakpointManager

- **Properties**:
  - `deviceType`: Returns `DeviceType.mobile`, `DeviceType.tablet`, or `DeviceType.desktop`.

### DeviceInfo

- **Properties**:
  - `orientation`: Returns `Orientation.portrait` or `Orientation.landscape`.
  - `isPortrait`: `true` if in portrait mode.
  - `isLandscape`: `true` if in landscape mode.
  - `isIOS`: `true` if the platform is iOS.
  - `isAndroid`: `true` if the platform is Android.

### AdaptiveContainer (Usage)

- **Constructors**:
  - `AdaptiveContainer({mobileBuilder, tabletBuilder, desktopBuilder})`
- **Usage**:

    ```dart
    AdaptiveContainer(
      mobileBuilder: (_) => MobileLayout(),
      tabletBuilder: (_) => TabletLayout(),
      desktopBuilder: (_) => DesktopLayout(),
    );
    ```

## Examples

### Responsive Button

```dart
ElevatedButton(
  onPressed: () {},
  child: ResponsiveText(
    'Click Me',
    style: TextStyle(fontSize: 18),
  ),
  style: ButtonStyle(
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
        horizontal: AdaptiveDesignProvider.of(context).size.scaleWidth(20),
        vertical: AdaptiveDesignProvider.of(context).size.scaleHeight(12),
      ),
    ),
  ),
);
```

### Responsive Grid

```dart
import 'package:flutter/material.dart';
import 'package:adaptive_design/adaptive_design.dart';

class ResponsiveGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceType =
        AdaptiveDesignProvider.of(context).breakpointManager.deviceType;
    int crossAxisCount = deviceType == DeviceType.mobile
        ? 2
        : deviceType == DeviceType.tablet
            ? 4
            : 6;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: List.generate(20, (index) {
        return Card(
          child: Center(
            child: ResponsiveText('Item $index'),
          ),
        );
      }),
    );
  }
}
```

## Extensions

### Responsive Context Extensions

- **ResponsiveSize**: Access responsive sizing methods directly from the `BuildContext`.

    ```dart
    final size = context.responsiveSize;
    ```

### Responsive EdgeInsets

- **EdgeInsets.allR**: Create responsive padding with all sides scaled.

    ```dart
    EdgeInsets padding = EdgeInsets.allR(context, 16);
    ```

- **EdgeInsets.symmetricR**: Create responsive padding with symmetric scaling.

    ```dart
    EdgeInsets padding = EdgeInsets.symmetricR(context: context, horizontal: 10, vertical: 20);
    ```

- **EdgeInsets.fromLTRBR**: Create responsive padding from left, top, right, and bottom.

    ```dart
    EdgeInsets padding = EdgeInsets.fromLTRBR(context, 10, 20, 10, 20);
    ```

### Responsive BorderRadius

- **BorderRadius.circularR**: Create a responsive circular border radius.

    ```dart
    BorderRadius radius = BorderRadius.circularR(context, 10);
    ```

- **BorderRadius.allR**: Create a responsive border radius for all corners.

    ```dart
    BorderRadius radius = BorderRadius.allR(context, 10);
    ```

### Responsive SizedBox Extensions

- **SizedBox.widthR**: Create a responsive width `SizedBox`.

    ```dart
    SizedBox box = SizedBox.widthR(context, 100);
    ```

- **SizedBox.heightR**: Create a responsive height `SizedBox`.

    ```dart
    SizedBox box = SizedBox.heightR(context, 50);
    ```

- **SizedBox.sizeR**: Create a responsive `SizedBox` with both width and height.

    ```dart
    SizedBox box = SizedBox.sizeR(context, 100, 50);
    ```

### Responsive Number Extensions

- **Scaling Methods**: Use the following methods to scale sizes responsively:

    ```dart
    double width = 100.ws; // Scaled width
    double height = 50.hs; // Scaled height
    double fontSize = 16.sp; // Scaled font size
    double percentageWidth = 5.wp;

    ```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any bugs or feature requests.

## Contact

For questions or suggestions, feel free to reach out.

---

## Acknowledgements

- Inspired by the strengths of existing responsive packages in the Flutter ecosystem.
- Aiming to simplify and enhance responsive design for Flutter developers.

---

**Happy Coding!**

---

## 🔗 Links

- [Flutter](https://flutter.dev/)
- [Pub.dev](https://pub.dev/)

---

## Version History

- **1.0.0**
  - Initial release with core features.

## 📜 LICENSE

Include an MIT License or any other license you prefer in the `LICENSE` file.
