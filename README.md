# Smart UI Layouts

**A Flutter package for beautiful, customizable, and maintainable UI widgets.**

Build dashboards, notifications, forms, and more with ready-to-use, animated, and theme-aware widgets.

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  smart_ui_layouts: ^1.0.0
```

Import in your Dart code:

```dart
import 'package:smart_ui_layouts/smart_ui_layouts.dart';
```

---

## 🚀 Widgets Overview

| Widget                | Description                                  |
| --------------------- | -------------------------------------------- |
| SmartCard             | Info, warning, error, and media cards        |
| SmartSection          | Group cards with header and description      |
| SmartList             | Animated, customizable vertical lists        |
| SmartGrid             | Animated, customizable grid layouts          |
| SmartTile             | Customizable info tiles with icons/trailing  |
| SmartHeader           | Animated section/page headers                |
| SmartButtonAlt        | Customizable buttons (filled/outlined)       |
| SmartInput            | Form and search input fields                 |
| SmartAvatar           | Profile avatars with status indicator        |
| SmartBadge            | Dot or label badges for status/notifications |
| SmartChip             | Filter/choice chips for tags and categories  |
| SmartDialog           | Modern, customizable dialogs                 |
| SmartModalBottomSheet | Custom modal bottom sheets                   |
| SmartSnackbar         | Interactive snackbars with actions/icons     |
| SmartToast            | Customizable toast notifications             |
| SmartEmptyState       | Minimal UI for empty screens/data            |

---

## 🛠️ Usage Examples

### SmartCard

```dart
SmartCard(
  title: "Battery Low",
  subtitle: "Please plug in your charger.",
  icon: Icons.battery_alert,
  level: SmartLevel.warning,
  layout: SmartCardLayout.tile,
  onTap: () => print("Card tapped!"),
  actionText: "Dismiss",
  onActionPressed: () {},
)
```

### SmartSection

```dart
SmartSection(
  title: "System Alerts",
  description: "Auto-layout cards for quick system notifications.",
  children: [
    SmartCard(...),
    SmartCard(...),
  ],
)
```

### SmartList

```dart
SmartList(
  children: [SmartCard(...), SmartCard(...)],
)
```

### SmartGrid

```dart
SmartGrid(
  children: [SmartCard(...), SmartCard(...)],
  crossAxisCount: 2,
)
```

### SmartTile

```dart
SmartTile(
  icon: Icons.wifi,
  title: "Wi-Fi",
  subtitle: "Connected",
  trailing: Icon(Icons.chevron_right),
  onTap: () {},
)
```

### SmartButtonAlt

```dart
SmartButtonAlt(
  label: "Get Started",
  icon: Icon(Icons.arrow_forward),
  onPressed: () {},
)
```

### SmartInput

```dart
SmartInput(
  label: "Search",
  hint: "Type to search...",
)
```

### SmartAvatar & SmartBadge

```dart
SmartAvatar(
  imageUrl: "https://i.pravatar.cc/300",
  showStatus: true,
  statusColor: Colors.green,
)
SmartBadge(label: "Active", color: Colors.green)
```

### SmartChip

```dart
SmartChip(
  label: "Flutter",
  isSelected: true,
  onSelected: (selected) {},
)
```

### SmartDialog

```dart
SmartDialog.show(
  context: context,
  title: "Logout?",
  content: Text("Do you really want to logout?"),
  onConfirm: () {},
)
```

### SmartModalBottomSheet

```dart
SmartModalBottomSheet.show(
  context: context,
  title: "Quick Settings",
  child: Column(...),
)
```

### SmartSnackbar

```dart
SmartSnackbar.show(
  context,
  message: "Profile updated successfully.",
  actionLabel: "Undo",
  onActionPressed: () {},
)
```

### SmartToast

```dart
SmartToast.show(
  context,
  message: "This is an info toast.",
)
```

### SmartEmptyState

```dart
SmartEmptyState(
  icon: Icons.inbox,
  title: "No Messages",
  message: "You don’t have any messages yet.",
)
```

---

## 📚 Example App

See the [`example/`](example/) folder for a full demo and showcase of all widgets.

---

## 🧑‍💻 Contributing & Maintenance

- All widgets are modular and documented for easy updates.
- To add new widgets, create a new file in `lib/widgets/` and export it in `smart_ui_layouts.dart`.
- For bug fixes or improvements, submit a PR or open an issue.
- Please keep doc comments up-to-date for maintainability.

---

## 📄 License

MIT License

Copyright (c) 2025 Ahmar yar Khan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

