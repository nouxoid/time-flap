# Contributing to Time Flap

Thank you for your interest in contributing to Time Flap! This document provides guidelines and instructions for contributing.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/time-flap.git`
3. Create a new branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test your changes thoroughly
6. Commit your changes: `git commit -m "Add your feature"`
7. Push to your fork: `git push origin feature/your-feature-name`
8. Create a Pull Request

## Development Setup

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Android Studio or VS Code
- Git

### Installation
```bash
# Clone the repository
git clone https://github.com/nouxoid/time-flap.git
cd time-flap

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Code Style

This project follows the official Flutter style guide and uses `flutter_lints` for code analysis.

### Key Points
- Use `const` constructors where possible
- Follow Dart naming conventions
- Keep functions small and focused
- Comment complex logic
- Use meaningful variable names

### Running the Linter
```bash
flutter analyze
```

## Testing

All new features should include appropriate tests.

### Running Tests
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Test Structure
- Unit tests for providers and business logic
- Widget tests for UI components
- Integration tests for complete flows (future)

## Commit Messages

Use clear and descriptive commit messages:
- `feat: Add new timer type`
- `fix: Correct Pomodoro cycle calculation`
- `docs: Update README with new features`
- `style: Format code according to linter`
- `refactor: Simplify timer state management`
- `test: Add tests for countdown timer`

## Pull Request Process

1. Update the README.md with details of changes if applicable
2. Update the ARCHITECTURE.md if you're changing the structure
3. Add or update tests as needed
4. Ensure all tests pass
5. Make sure the code follows the style guidelines
6. Your PR should have a clear description of the changes

## Areas for Contribution

### High Priority
- [ ] Add sound/vibration alerts when timer completes
- [ ] Add notification support
- [ ] Implement timer history and statistics
- [ ] Add home screen widget
- [ ] Improve accessibility features

### Medium Priority
- [ ] Custom Pomodoro durations in settings
- [ ] More color schemes and themes
- [ ] Export/import settings
- [ ] Task categories and tags
- [ ] Better landscape mode support

### Low Priority
- [ ] Animations and transitions
- [ ] Additional languages (i18n)
- [ ] Cloud sync for settings
- [ ] Integration with other productivity apps

## Bug Reports

When reporting bugs, please include:
- Device and OS version
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots if applicable
- Logs if available

Use the GitHub issue tracker to report bugs.

## Feature Requests

Feature requests are welcome! Please:
- Check if the feature has already been requested
- Clearly describe the feature and its benefits
- Explain how it fits with the app's goals
- Provide examples or mockups if possible

## Questions?

If you have questions about contributing:
- Open an issue with the "question" label
- Check existing issues and discussions
- Review the ARCHITECTURE.md for technical details

## Code of Conduct

### Our Pledge
We are committed to providing a welcoming and inspiring community for all.

### Our Standards
- Be respectful and inclusive
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards others

### Enforcement
Unacceptable behavior may be reported to the project maintainers. All complaints will be reviewed and investigated.

## License

By contributing to Time Flap, you agree that your contributions will be licensed under the Apache License 2.0.

---

Thank you for contributing to Time Flap! 🎉
