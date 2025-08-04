# Smart UI Layouts

A Flutter package for AI-assisted auto-layout widgets. Build beautiful, animated, and responsive cards and sections with minimal code—perfect for dashboards, notifications, and more.

## Features

- 🧠 **SmartCard**: Auto-generates a beautiful layout from a few parameters (title, subtitle, icon, button, etc.)
- 📦 **SmartSection**: Group cards with a header and description
- 🎨 Theming: Easily customize colors, radii, and shadows
- ⚡ Animated appearance and smooth transitions
- 🔗 Tap/long-press/callback support
- 🧩 Extensible for future smart layouts

## Getting Started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  smart_ui_layouts: ^0.1.0
```

Import in your Dart code:

```dart
import 'package:smart_ui_layouts/smart_ui_layouts.dart';
```

## Usage

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

Group cards in a section:

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

## Example

See the `example/` app for a full demo.

## Roadmap

- [x] SmartCard
- [x] SmartSection
- [ ] More smart layouts (SmartList, SmartGrid)
- [ ] AI-powered layout suggestions

## Contributing

PRs and suggestions welcome! Let’s make Flutter UI smarter together.

## License

MIT
