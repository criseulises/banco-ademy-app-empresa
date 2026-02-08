# Test Files

This directory contains unit tests, widget tests, and integration tests.

## Structure

```
test/
├── core/                    # Tests for core functionality
│   ├── config/
│   ├── network/
│   ├── security/
│   └── utils/
├── features/                # Tests for features
│   ├── authentication/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── [other features]/
└── helpers/                 # Test helpers and mocks
    ├── test_helper.dart
    └── mock_data.dart
```

## Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/authentication/domain/usecases/login_usecase_test.dart
```

## Test Coverage Goals
- Unit Tests: 80%+ coverage
- Widget Tests: All major widgets
- Integration Tests: Critical user flows
