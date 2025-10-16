import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final String timeDisplay;
  final double progress;

  const TimerDisplay({
    super.key,
    required this.timeDisplay,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 280,
            height: 280,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 280,
                  height: 280,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 12,
                    backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Text(
                  timeDisplay,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
