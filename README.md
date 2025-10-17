# Smart UI Kit

A Flutter package for beautiful, customizable, and maintainable UI widgets. Smart UI Kit provides a collection of production-ready widgets to help you build modern, consistent, and visually appealing Flutter apps with ease.

## Features

- Professionally designed, reusable UI widgets
- Highly customizable and easy to integrate
- Consistent design language across widgets
- Well-documented use cases for each widget
- Example app included for hands-on exploration

## Widgets Included

- SmartCard
- SmartSection
- SmartList
- SmartTile
- SmartHeader
- SmartButtonAlt
- SmartInput
- SmartAvatar
- SmartBadge
- SmartChip
- SmartDialog
- SmartModalBottomSheet
- SmartSnackbar
- SmartToast
- SmartEmptyState
- SmartAnimation

## Getting Started

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  smart_ui_kit: ^0.0.1
```

Then run:

```sh
flutter pub get
```

Import the package in your Dart code:

```dart
import 'package:smart_ui_kit/smart_ui_kit.dart';
```

## Usage

Each widget comes with a dedicated use case in the `lib/sections/` folder. For a comprehensive set of examples, see the [example app](example/).

### Example: SmartCard

```dart
import 'package:smart_ui_kit/widgets/smart_card.dart';

SmartCard(
  title: 'Welcome',
  content: Text('This is a SmartCard widget.'),
  elevation: 4.0,
)
```

### Example: SmartButtonAlt

```dart
import 'package:smart_ui_kit/widgets/smart_button.dart';

SmartButtonAlt(
  label: 'Click Me',
  onPressed: () {
    // Handle button press
  },
)
```

### Example: SmartAvatar

```dart
import 'package:smart_ui_kit/widgets/smart_avatar.dart';

SmartAvatar(
  imageUrl: 'assets/images/avatar_placeholder.png',
  radius: 32.0,
)
```

### Example: SmartDialog

```dart
import 'package:smart_ui_kit/widgets/smart_dialog.dart';

showDialog(
  context: context,
  builder: (context) => SmartDialog(
    title: 'Dialog Title',
    content: Text('This is a custom dialog.'),
  ),
);
```

> **Tip:** For more usage examples, check the `lib/sections/` folder and the [example app](example/).

## Example App

A full-featured example app is provided in the [`example/`](example/) directory. To run the example:

```sh
cd example
flutter run
```

Explore the app to see all widgets in action and review their use cases.

## Contributing

Contributions are welcome! Please open issues or submit pull requests for bug fixes, new features, or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

© 2025 CodexAhmar. All rights reserved.
