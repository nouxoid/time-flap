import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/timer_provider.dart';
import '../widgets/timer_display.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    String stateText = '';
    Color stateColor = Theme.of(context).colorScheme.primary;

    switch (timerProvider.pomodoroState) {
      case PomodoroState.work:
        stateText = 'Work Session';
        stateColor = Theme.of(context).colorScheme.primary;
        break;
      case PomodoroState.shortBreak:
        stateText = 'Short Break';
        stateColor = Colors.green;
        break;
      case PomodoroState.longBreak:
        stateText = 'Long Break';
        stateColor = Colors.blue;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (timerProvider.isRunning || timerProvider.remainingSeconds > 0) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: stateColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    stateText,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: stateColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Pomodoros completed: ${timerProvider.pomodoroCount}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: TimerDisplay(
                    timeDisplay: timerProvider.timeDisplay,
                    progress: timerProvider.progress,
                  ),
                ),
              ] else ...[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.coffee,
                        size: 120,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Pomodoro Technique',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          '• 25 minutes of focused work\n'
                          '• 5 minutes short break\n'
                          '• 15 minutes long break after 4 sessions',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 20),
              if (timerProvider.isRunning || timerProvider.remainingSeconds > 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (timerProvider.isRunning) {
                          timerProvider.pause();
                        } else {
                          timerProvider.resume();
                        }
                      },
                      icon: Icon(
                        timerProvider.isRunning ? Icons.pause : Icons.play_arrow,
                      ),
                      label: Text(timerProvider.isRunning ? 'Pause' : 'Resume'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        timerProvider.stop();
                      },
                      icon: const Icon(Icons.stop),
                      label: const Text('Stop'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                  ],
                )
              else
                ElevatedButton.icon(
                  onPressed: () {
                    timerProvider.startPomodoro();
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start Pomodoro'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
