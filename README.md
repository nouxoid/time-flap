# Time Flap

A Flutter Android time management app with countdown timer, Pomodoro technique, and task-specific focus timers.

## Features

- **Countdown Timer**: Set a custom time and count down to zero
- **Pomodoro Timer**: Classic 25/5 minute work/break cycles with long breaks after 4 sessions
- **Task Timer**: Focus timer for specific tasks with custom durations
- **Light & Dark Mode**: Full theme support with system default option
- **Multiple Color Schemes**: 8 beautiful color schemes to choose from
- **Lock Screen Support**: Keep screen on during timer sessions
- **Charging Screen Saver**: Can be configured as Android daydream/screen saver

## Screenshots

_Coming soon_

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Android Studio or VS Code with Flutter extensions
- Android device or emulator (API level 21+)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/nouxoid/time-flap.git
cd time-flap
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Usage

### Countdown Timer
1. Select "Countdown Timer" from the home screen
2. Set your desired minutes and seconds
3. Tap "Start Timer" to begin

### Pomodoro Timer
1. Select "Pomodoro Timer" from the home screen
2. Tap "Start Pomodoro" to begin your first 25-minute work session
3. The app will automatically cycle through work and break periods
4. After 4 work sessions, you'll get a 15-minute long break

### Task Timer
1. Select "Task Timer" from the home screen
2. Enter the name of the task you're working on
3. Set your desired duration
4. Tap "Start Task Timer" to begin

### Settings
- Access settings via the gear icon in the top-right corner
- Choose between Light, Dark, or System Default theme
- Select from 8 different color schemes
- View app information

## Charging Screen Saver Setup

To use Time Flap as a charging screen saver:
1. Go to Android Settings > Display > Screen saver
2. Select "Time Flap" from the list
3. Set it to activate when charging

## Building for Release

```bash
flutter build apk --release
```

The APK will be available at `build/app/outputs/flutter-apk/app-release.apk`

## Project Structure

```
lib/
├── main.dart              # App entry point
├── providers/
│   ├── theme_provider.dart    # Theme management
│   └── timer_provider.dart    # Timer state management
├── screens/
│   ├── home_screen.dart       # Main navigation
│   ├── countdown_screen.dart  # Countdown timer
│   ├── pomodoro_screen.dart   # Pomodoro timer
│   ├── task_timer_screen.dart # Task-specific timer
│   └── settings_screen.dart   # Settings and preferences
└── widgets/
    └── timer_display.dart     # Reusable timer display widget
```

## Dependencies

- `provider`: State management
- `shared_preferences`: Persistent storage for settings
- `wakelock_plus`: Keep screen on during timer sessions

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the Apache License 2.0 - see the LICENSE file for details.
