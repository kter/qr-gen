# QR Code Generator

Android app for generating QR codes with customizable settings.

## Features

- 📝 Generate QR codes from text, URLs, emails, or phone numbers
- 🔧 Adjustable error correction level (L/M/Q/H)
- 📐 Multiple size options (200-500px)
- 💾 Save to gallery as PNG
- 📤 Share QR codes directly
- 🌙 Light/Dark theme support
- 🌐 English/Japanese localization

## Development

### Prerequisites

- Flutter 3.9.0+
- Android SDK

### Commands

```bash
make run           # Run on connected device
make build-debug   # Build debug APK
make build-release # Build release APK
make test          # Run all tests
make analyze       # Run static analysis
```

## Testing

The project includes comprehensive tests to protect core behaviors:

| Category | Tests |
|----------|-------|
| Widget Tests | 44 |
| Provider/Model Tests | 21 |
| Golden Tests | 4 |
| **Total** | **69** |

### Running Tests

```bash
# All tests
flutter test

# Widget/Provider tests only
flutter test test/providers_test.dart test/widgets/

# Golden tests only
make test-golden

# Update golden files after UI changes
make update-goldens
```

### CI

GitHub Actions runs tests automatically on push and pull requests to `main`/`master`.

## License

MIT
