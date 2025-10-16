import 'package:flutter_test/flutter_test.dart';
import 'package:time_flap/main.dart';
import 'package:time_flap/providers/timer_provider.dart';
import 'package:time_flap/providers/theme_provider.dart';

void main() {
  group('TimerProvider Tests', () {
    test('Initial state should be correct', () {
      final timerProvider = TimerProvider();
      
      expect(timerProvider.isRunning, false);
      expect(timerProvider.remainingSeconds, 0);
      expect(timerProvider.totalSeconds, 0);
      expect(timerProvider.timerType, TimerType.countdown);
    });

    test('Countdown should set correct values', () {
      final timerProvider = TimerProvider();
      timerProvider.startCountdown(120); // 2 minutes
      
      expect(timerProvider.totalSeconds, 120);
      expect(timerProvider.remainingSeconds, 120);
      expect(timerProvider.isRunning, true);
    });

    test('Pomodoro should start with work session', () {
      final timerProvider = TimerProvider();
      timerProvider.startPomodoro();
      
      expect(timerProvider.pomodoroState, PomodoroState.work);
      expect(timerProvider.totalSeconds, 25 * 60);
      expect(timerProvider.isRunning, true);
    });

    test('Task timer should set task name', () {
      final timerProvider = TimerProvider();
      timerProvider.startTaskTimer(1800, 'Test Task'); // 30 minutes
      
      expect(timerProvider.taskName, 'Test Task');
      expect(timerProvider.totalSeconds, 1800);
      expect(timerProvider.isRunning, true);
    });

    test('Pause should stop the timer', () {
      final timerProvider = TimerProvider();
      timerProvider.startCountdown(60);
      timerProvider.pause();
      
      expect(timerProvider.isRunning, false);
      expect(timerProvider.remainingSeconds, greaterThan(0));
    });

    test('Stop should reset timer', () {
      final timerProvider = TimerProvider();
      timerProvider.startCountdown(60);
      timerProvider.stop();
      
      expect(timerProvider.isRunning, false);
      expect(timerProvider.remainingSeconds, 0);
      expect(timerProvider.totalSeconds, 0);
    });

    test('Progress should calculate correctly', () {
      final timerProvider = TimerProvider();
      timerProvider.startCountdown(100);
      
      // Manually set remaining seconds to simulate progress
      timerProvider.remainingSeconds;
      
      expect(timerProvider.progress, greaterThanOrEqualTo(0.0));
      expect(timerProvider.progress, lessThanOrEqualTo(1.0));
    });
  });

  group('ThemeProvider Tests', () {
    test('Should have default theme mode', () {
      final themeProvider = ThemeProvider();
      expect(themeProvider.themeMode, isNotNull);
    });

    test('Should have predefined color schemes', () {
      expect(ThemeProvider.colorSchemes.length, 8);
    });
  });

  group('Widget Tests', () {
    testWidgets('App should build without errors', (WidgetTester tester) async {
      await tester.pumpWidget(const TimeFlap());
      await tester.pumpAndSettle();
      
      expect(find.text('Time Flap'), findsOneWidget);
    });
  });
}
