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
- SmartSplashScreen
- SmartOnBoardingScreen
- SmartBottomBar

## Getting Started

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  smart_ui_kit: ^0.0.2
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

Each widget comes with a dedicated use case in the `examples/lib/sections/` folder. For a comprehensive set of examples, see the [example app](example/).

### Example: SmartCard

```dart
import 'package:smart_ui_kit/widgets/smart_card.dart';

SmartCard(
  title: "Custom Info Card",
  subtitle: "Manually styled colors and shadow",
  icon: Icons.info_outline,
  textColor: Colors.indigo,
  backgroundColor: Colors.indigo.shade50,
  iconColor: Colors.indigo,
  boxShadow: [
    BoxShadow(
      color: Colors.indigo.withOpacity(0.1),
      blurRadius: 12,
      offset: const Offset(0, 6),
    ),
  ],
)
```

### Example: SmartButtonAlt

```dart
import 'package:smart_ui_kit/widgets/smart_button.dart';

SmartButtonAlt(
  label: "Get Started",
  icon: const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
  onPressed: () {},
  textColor: Colors.white,
  iconAfterLabel: true,
  backgroundColor: Colors.amber,
  fontSize: 16,
  borderRadius: 20,
  elevation: 0,
)
```

### Example: SmartAvatar

```dart
import 'package:smart_ui_kit/widgets/smart_avatar.dart';

SmartAvatar(
  imageUrl: "https://i.pravatar.cc/100",
  size: 80,
  borderColor: Colors.blueAccent,
  borderWidth: 2,
  isCircular: true,
  showStatus: true,
  statusSize: 20,
  statusColor: Colors.greenAccent,
  onTap: () {},
)
```

### Example: SmartSplash

```dart
import 'package:smart_ui_kit/widgets/smart_splashscreen.dart';

SmartSplash(
  image: Image.asset("assets/images/splash.jpg"),
  duration: 3,
  nextScreen: const SmartShowcasePage(),
)
```

### Example: SmartBottombar

````dart
import 'package:smart_ui_kit/widgets/smart_bottombar.dart';

bottomNavigationBar: SmartBottomBar(
  height: 80,
  backgroundColor: Colors.teal,
  currentIndex: _selectedIndex,
  onTap: (index) => setState(() => _selectedIndex = index),
  items: [
    SmartBottomBarItem(
      icon: const Icon(Icons.home_outlined, color: Colors.white),
      activeIcon: const Icon(Icons.home, color: Colors.white),
      label: "Home",
      activeColor: Colors.white,
      inactiveColor: Colors.white70,
    ),
    SmartBottomBarItem(
      icon: const Icon(Icons.search, color: Colors.white),
      label: "Search",
      activeColor: Colors.white,
      inactiveColor: Colors.white54,
    ),
    SmartBottomBarItem(
      icon: const Icon(Icons.person_outline, color: Colors.white),
      activeIcon: const Icon(Icons.person, color: Colors.white),
      label: "Profile",
      activeColor: Colors.white,
      inactiveColor: Colors.white38,
    ),
  ],
)

### Example: SmartDialog

```dart
import 'package:smart_ui_kit/widgets/smart_dialog.dart';
// Confirm Logout Dialog with custom button

SmartDialog.show(
  context: context,
  title: "Logout?",
  icon: const Icon(Icons.logout, color: Colors.red),
  content: const Text(
    "Do you really want to logout of your account?",
  ),
  cancelTextStyle: const TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w600,
  ),
  customConfirmButton: SmartButtonAlt(
    label: "Logout",
    icon: const Icon(Icons.logout, size: 16, color: Colors.white),
    backgroundColor: Colors.red,
    textColor: Colors.white,
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
);


// ✅ 2. Simple Confirmation Dialog with default button colors
SmartDialog.show(
  context: context,
  title: "Confirm?",
  content: const Text("Do you really want to proceed?"),
  confirmText: "Yes",
  cancelText: "No",
  confirmButtonColor: Colors.green,
);
````

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
