import 'dart:async';
import 'package:flutter/material.dart';

enum TimerType { countdown, pomodoro, task }

enum PomodoroState { work, shortBreak, longBreak }

class TimerProvider extends ChangeNotifier {
  TimerType _timerType = TimerType.countdown;
  int _remainingSeconds = 0;
  int _totalSeconds = 0;
  bool _isRunning = false;
  Timer? _timer;
  String _taskName = '';
  
  // Pomodoro specific
  PomodoroState _pomodoroState = PomodoroState.work;
  int _pomodoroCount = 0;
  final int _workDuration = 25 * 60; // 25 minutes
  final int _shortBreakDuration = 5 * 60; // 5 minutes
  final int _longBreakDuration = 15 * 60; // 15 minutes

  TimerType get timerType => _timerType;
  int get remainingSeconds => _remainingSeconds;
  int get totalSeconds => _totalSeconds;
  bool get isRunning => _isRunning;
  String get taskName => _taskName;
  PomodoroState get pomodoroState => _pomodoroState;
  int get pomodoroCount => _pomodoroCount;

  double get progress {
    if (_totalSeconds == 0) return 0;
    return (_totalSeconds - _remainingSeconds) / _totalSeconds;
  }

  String get timeDisplay {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void setTimerType(TimerType type) {
    stop();
    _timerType = type;
    notifyListeners();
  }

  void setTaskName(String name) {
    _taskName = name;
    notifyListeners();
  }

  void startCountdown(int seconds) {
    stop();
    _totalSeconds = seconds;
    _remainingSeconds = seconds;
    _isRunning = true;
    _startTicker();
    notifyListeners();
  }

  void startPomodoro() {
    stop();
    _pomodoroState = PomodoroState.work;
    _pomodoroCount = 0;
    _totalSeconds = _workDuration;
    _remainingSeconds = _workDuration;
    _isRunning = true;
    _startTicker();
    notifyListeners();
  }

  void startTaskTimer(int seconds, String taskName) {
    stop();
    _taskName = taskName;
    _totalSeconds = seconds;
    _remainingSeconds = seconds;
    _isRunning = true;
    _startTicker();
    notifyListeners();
  }

  void pause() {
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void resume() {
    if (_remainingSeconds > 0) {
      _isRunning = true;
      _startTicker();
      notifyListeners();
    }
  }

  void stop() {
    _isRunning = false;
    _timer?.cancel();
    _remainingSeconds = 0;
    _totalSeconds = 0;
    notifyListeners();
  }

  void _startTicker() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        _handleTimerComplete();
      }
    });
  }

  void _handleTimerComplete() {
    _timer?.cancel();
    _isRunning = false;

    if (_timerType == TimerType.pomodoro) {
      _handlePomodoroComplete();
    } else {
      notifyListeners();
    }
  }

  void _handlePomodoroComplete() {
    if (_pomodoroState == PomodoroState.work) {
      _pomodoroCount++;
      if (_pomodoroCount % 4 == 0) {
        _pomodoroState = PomodoroState.longBreak;
        _totalSeconds = _longBreakDuration;
        _remainingSeconds = _longBreakDuration;
      } else {
        _pomodoroState = PomodoroState.shortBreak;
        _totalSeconds = _shortBreakDuration;
        _remainingSeconds = _shortBreakDuration;
      }
    } else {
      _pomodoroState = PomodoroState.work;
      _totalSeconds = _workDuration;
      _remainingSeconds = _workDuration;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
