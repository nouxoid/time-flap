import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/timer_provider.dart';
import '../providers/theme_provider.dart';
import 'countdown_screen.dart';
import 'pomodoro_screen.dart';
import 'task_timer_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Flap'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                'Choose Timer Type',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _TimerTypeCard(
                      title: 'Countdown Timer',
                      description: 'Set a specific time and count down',
                      icon: Icons.timer,
                      onTap: () {
                        timerProvider.setTimerType(TimerType.countdown);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CountdownScreen(),
                          ),
                        );
                      },
                    ),
                    _TimerTypeCard(
                      title: 'Pomodoro Timer',
                      description: '25 min work, 5 min break cycles',
                      icon: Icons.coffee,
                      onTap: () {
                        timerProvider.setTimerType(TimerType.pomodoro);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PomodoroScreen(),
                          ),
                        );
                      },
                    ),
                    _TimerTypeCard(
                      title: 'Task Timer',
                      description: 'Focus timer for a specific task',
                      icon: Icons.task_alt,
                      onTap: () {
                        timerProvider.setTimerType(TimerType.task);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TaskTimerScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimerTypeCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _TimerTypeCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
