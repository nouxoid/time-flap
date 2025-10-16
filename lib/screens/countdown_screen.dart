import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/timer_provider.dart';
import '../widgets/timer_display.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int _minutes = 5;
  int _seconds = 0;

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (timerProvider.isRunning || timerProvider.remainingSeconds > 0)
                Expanded(
                  child: TimerDisplay(
                    timeDisplay: timerProvider.timeDisplay,
                    progress: timerProvider.progress,
                  ),
                )
              else
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Set Timer',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _TimePickerColumn(
                            label: 'Minutes',
                            value: _minutes,
                            onChanged: (value) {
                              setState(() {
                                _minutes = value;
                              });
                            },
                            max: 99,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            ':',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(width: 20),
                          _TimePickerColumn(
                            label: 'Seconds',
                            value: _seconds,
                            onChanged: (value) {
                              setState(() {
                                _seconds = value;
                              });
                            },
                            max: 59,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                        setState(() {
                          _minutes = 5;
                          _seconds = 0;
                        });
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
                    final totalSeconds = (_minutes * 60) + _seconds;
                    if (totalSeconds > 0) {
                      timerProvider.startCountdown(totalSeconds);
                    }
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start Timer'),
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

class _TimePickerColumn extends StatelessWidget {
  final String label;
  final int value;
  final ValueChanged<int> onChanged;
  final int max;

  const _TimePickerColumn({
    required this.label,
    required this.value,
    required this.onChanged,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_drop_up),
                onPressed: () {
                  if (value < max) {
                    onChanged(value + 1);
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  value.toString().padLeft(2, '0'),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () {
                  if (value > 0) {
                    onChanged(value - 1);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
