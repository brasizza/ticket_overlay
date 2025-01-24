# Ticket Overlay Library

[Leia em Português](README.md)

A Flutter library designed to create animations simulating a ticket emerging from a POS device, providing seamless integration with your application. Built on `OverlayEntry`, it enables displaying custom widgets with animated effects.

## Features

- **Shimmer Receipt Placeholder**: A default shimmer effect widget to simulate a receipt.
- **Overlay Animation**: Simple API to display and animate overlay widgets.
- **Customization**: Configure alignment, duration, and initial animation position.

## Installation

Add the library to your project by including it in the `pubspec.yaml` file:

```yaml
dependencies:
  ticket_overlay: ^latest_version
```

Replace `latest_version` with the latest version available on [pub.dev](https://pub.dev/packages/ticket_overlay).

Run the following command to fetch the package:

```bash
flutter pub get
```

## Usage

### Displaying a Ticket Animation

To display a widget with a ticket animation:

```dart
import 'package:ticket_overlay/ticket_overlay.dart';

TicketAnimation.show(
  context: context,
  duration: const Duration(seconds: 3),
  alignment: Alignment.center,
  startAt: 0.5,
  child: YourCustomWidget(),
);
```

### Default Placeholder

Use the default shimmer receipt effect:

```dart
Widget defaultPlaceholder = TicketAnimation.ticketDefault;
```

## API Reference

### `TicketAnimation.show`

Displays a custom widget as an animated ticket overlay.

#### Parameters:

- `context` (required): The `BuildContext` where the overlay will be inserted.
- `duration` (required): Animation duration.
- `child` (required): The widget to display in the overlay.
- `alignment` (optional): Widget alignment within the overlay. Default is `Alignment.center`.
- `startAt` (optional): Initial vertical position (as a fraction of screen height). Default is `0.5`.

### `TicketAnimation.ticketDefault`

Provides a default shimmer effect widget for receipts.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

