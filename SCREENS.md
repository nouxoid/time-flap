# Time Flap - Screen Documentation

This document describes each screen in the Time Flap app and their functionality.

## Home Screen

The main navigation screen with three options:

**Elements:**
- App title: "Time Flap"
- Settings icon (top-right corner)
- Three timer type cards:
  1. **Countdown Timer**
     - Icon: Timer icon
     - Description: "Set a specific time and count down"
  2. **Pomodoro Timer**
     - Icon: Coffee icon
     - Description: "25 min work, 5 min break cycles"
  3. **Task Timer**
     - Icon: Task icon
     - Description: "Focus timer for a specific task"

**Interactions:**
- Tap any card to navigate to that timer type
- Tap settings icon to open settings

---

## Countdown Timer Screen

Set and run custom countdown timers.

**Elements:**
- Back button (top-left)
- Title: "Countdown Timer"

**When Stopped:**
- "Set Timer" header
- Time picker with minutes and seconds
  - Up/down arrows to adjust values
  - Displays values in MM:SS format
- "Start Timer" button

**When Running:**
- Large circular progress indicator
- Time display in center (MM:SS format)
- Progress ring showing elapsed time
- "Pause" button (when running)
- "Resume" button (when paused)
- "Stop" button (red, resets timer)

---

## Pomodoro Timer Screen

Classic Pomodoro technique with automatic cycles.

**Elements:**
- Back button (top-left)
- Title: "Pomodoro Timer"

**When Stopped:**
- Coffee icon (large)
- "Pomodoro Technique" header
- Feature list:
  - 25 minutes of focused work
  - 5 minutes short break
  - 15 minutes long break after 4 sessions
- "Start Pomodoro" button

**When Running:**
- Current state badge (colored):
  - "Work Session" (primary color)
  - "Short Break" (green)
  - "Long Break" (blue)
- Pomodoros completed counter
- Large circular progress indicator
- Time display in center (MM:SS format)
- Progress ring
- "Pause"/"Resume" button
- "Stop" button (red)

**Automatic Behavior:**
- After work session: switches to short break
- After 4 work sessions: switches to long break
- After break: returns to work session
- Continues cycling until stopped

---

## Task Timer Screen

Focus timer for specific tasks with custom names.

**Elements:**
- Back button (top-left)
- Title: "Task Timer"

**When Stopped:**
- Task icon (large)
- "Focus on a Task" header
- Task name text field
  - Label: "Task Name"
  - Hint: "What are you working on?"
  - Max 50 characters
- Time picker with minutes and seconds
  - Up/down arrows to adjust values
  - Displays values in MM:SS format
- "Start Task Timer" button
  - Disabled if task name is empty

**When Running:**
- Current task card (colored container)
  - "Current Task" label
  - Task name displayed
- Large circular progress indicator
- Time display in center (MM:SS format)
- Progress ring
- "Pause"/"Resume" button
- "Stop" button (red, clears task name)

---

## Settings Screen

Configure app preferences and themes.

**Sections:**

### Theme Settings
- Light Mode (radio button)
- Dark Mode (radio button)
- System Default (radio button)
- Shows current selection

### Color Schemes
- Grid of 8 color scheme options:
  1. Blue (default)
  2. Green
  3. Purple
  4. Orange
  5. Teal
  6. Pink
  7. Indigo
  8. Red
- Tap any color to apply

### Features
- "Lock Screen Display" info
  - Subtitle: "Keep screen on during timer"
  - Green checkmark (always enabled)
- "Charging Screen Saver" info
  - Subtitle: "Configure in Android system settings"

### About
- Version number (1.0.0)
- "About Time Flap" button
  - Opens about dialog with app description

---

## Common UI Elements

### Navigation
- All screens (except Home) have back button
- Back button returns to previous screen
- Home button in app bar returns to home screen

### Theme Support
- All screens respect current theme (Light/Dark/System)
- Color scheme applies across all screens
- Consistent Material Design 3 styling

### Timer Display Widget
Used in Countdown, Pomodoro, and Task Timer screens:
- Large circular progress indicator (280x280)
- Centered time display (72pt font, bold, monospace)
- Progress ring with theme color
- Background in surface variant color
- Smooth animation during countdown

### Responsive Behavior
- Portrait orientation optimized
- Landscape support (layouts adjust)
- Safe area handling for all screens
- Proper keyboard handling for text inputs

---

## User Flow Examples

### Quick Countdown
1. Open app → Home Screen
2. Tap "Countdown Timer"
3. Set time (e.g., 10:00)
4. Tap "Start Timer"
5. Screen stays on, timer counts down
6. Complete or stop when done

### Pomodoro Session
1. Open app → Home Screen
2. Tap "Pomodoro Timer"
3. Tap "Start Pomodoro"
4. Work for 25 minutes
5. Automatic switch to 5-minute break
6. Repeat cycle 4 times
7. Get 15-minute long break
8. Continue or stop

### Task Focus
1. Open app → Home Screen
2. Tap "Task Timer"
3. Enter task name: "Write report"
4. Set time: 30:00
5. Tap "Start Task Timer"
6. Focus on task with visual feedback
7. Pause if needed, resume when ready
8. Stop when task is complete

### Change Theme
1. From any screen, tap Settings icon
2. Select Light/Dark/System mode
3. Or tap a color scheme
4. Changes apply immediately
5. Settings persist across app restarts

---

## Charging Screen Saver Mode

When configured in Android settings:
1. Phone starts charging
2. Screen activates with Time Flap
3. Shows full app interface
4. Interactive: can start/control timers
5. Uses selected color scheme
6. Exits when unplugged or screen touched
