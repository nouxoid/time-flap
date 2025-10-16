# Time Flap - Technical Documentation

## Architecture

Time Flap follows a clean architecture pattern using Flutter's Provider for state management.

### Project Structure

```
time-flap/
├── android/              # Android platform-specific code
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── AndroidManifest.xml
│   │   │   ├── kotlin/com/timeflap/app/
│   │   │   │   └── MainActivity.kt
│   │   │   └── res/
│   │   │       ├── drawable/
│   │   │       ├── values/
│   │   │       └── xml/
│   │   └── build.gradle
│   ├── build.gradle
│   └── settings.gradle
├── ios/                  # iOS platform-specific code
│   └── Runner/
│       └── Info.plist
├── lib/                  # Main application code
│   ├── main.dart         # App entry point
│   ├── providers/        # State management
│   │   ├── theme_provider.dart
│   │   └── timer_provider.dart
│   ├── screens/          # UI screens
│   │   ├── home_screen.dart
│   │   ├── countdown_screen.dart
│   │   ├── pomodoro_screen.dart
│   │   ├── task_timer_screen.dart
│   │   └── settings_screen.dart
│   └── widgets/          # Reusable widgets
│       └── timer_display.dart
├── test/                 # Unit and widget tests
│   └── widget_test.dart
└── pubspec.yaml          # Dependencies and metadata
```

## State Management

The app uses Provider for state management with two main providers:

### ThemeProvider
- Manages app theme (Light/Dark/System)
- Handles color scheme selection
- Persists theme preferences using SharedPreferences

### TimerProvider
- Manages all timer functionality
- Handles three timer types: Countdown, Pomodoro, Task
- Controls timer state (running, paused, stopped)
- Manages Pomodoro cycles and breaks

## Key Features

### 1. Timer Types

#### Countdown Timer
- User sets custom minutes and seconds
- Visual progress indicator
- Pause/Resume/Stop controls

#### Pomodoro Timer
- 25-minute work sessions
- 5-minute short breaks
- 15-minute long breaks after 4 work sessions
- Automatic cycle management

#### Task Timer
- Named task tracking
- Custom duration
- Focus mode support

### 2. Theme System

The app supports:
- Light mode
- Dark mode
- System default (follows device settings)
- 8 predefined color schemes for variety

Color schemes are defined in `ThemeProvider.colorSchemes`:
- Blue (default)
- Green
- Purple
- Orange
- Teal
- Pink
- Indigo
- Red

### 3. Android-Specific Features

#### Wakelock
- Keeps screen on during active timers
- Automatically releases when timer stops
- Uses `wakelock_plus` package

#### Dream Service (Screen Saver)
- Configured in AndroidManifest.xml
- Can be set as charging screen saver
- Defined in `android/app/src/main/res/xml/dream_preferences.xml`

To enable:
1. Go to Android Settings > Display > Screen saver
2. Select "Time Flap"
3. Choose when to activate (while charging, docked, etc.)

## Widget Composition

### TimerDisplay Widget
Reusable circular progress indicator with time display:
- Shows remaining time in MM:SS format
- Displays progress as a circular ring
- Adapts to current theme colors

### Timer Screen Pattern
All timer screens follow a similar pattern:
1. Header with timer type/task info
2. Central timer display (when running)
3. Timer configuration (when stopped)
4. Control buttons (Start/Pause/Resume/Stop)

## Data Persistence

### SharedPreferences
Used to persist:
- Theme mode selection
- User preferences

Note: Timer state is not persisted - timers reset when app closes.

## Testing

The project includes basic unit and widget tests in `test/widget_test.dart`:
- TimerProvider state tests
- Theme provider tests
- Widget rendering tests

To run tests:
```bash
flutter test
```

## Building

### Debug Build
```bash
flutter run
```

### Release Build (APK)
```bash
flutter build apk --release
```

### Release Build (App Bundle)
```bash
flutter build appbundle --release
```

## Platform-Specific Notes

### Android
- Minimum SDK: 21 (Android 5.0 Lollipop)
- Target SDK: 34 (Android 14)
- Permissions required:
  - WAKE_LOCK (keep screen on)
  - FOREGROUND_SERVICE (for potential future features)

### iOS
- Minimum iOS version: As per Flutter defaults
- Supports all orientations
- Standard iOS capabilities

## Dependencies

Main dependencies:
- `provider: ^6.0.5` - State management
- `shared_preferences: ^2.2.2` - Local data persistence
- `wakelock_plus: ^1.1.4` - Screen wake lock

Dev dependencies:
- `flutter_test` - Testing framework
- `flutter_lints: ^2.0.0` - Linting rules

## Future Enhancements

Potential features for future versions:
- Timer history and statistics
- Custom Pomodoro durations
- Notification support
- Sound/vibration alerts
- Widget support for home screen
- Backup/restore settings
- More color schemes and themes
- Task categories and tags
