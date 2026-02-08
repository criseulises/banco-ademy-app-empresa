# Integration Tests

This directory contains integration tests for end-to-end testing.

## Test Scenarios

1. **Authentication Flow**
   - Complete login process
   - Registration with OTP
   - Password recovery
   - Biometric login

2. **Transaction Flows**
   - Create transfer
   - Pay bill
   - View statements

3. **Card Management**
   - Block/unblock card
   - Update limits

## Running Integration Tests

```bash
flutter test integration_test
```

## Device Testing
- Test on real devices (iOS and Android)
- Test different screen sizes
- Test with and without internet
- Test biometric on compatible devices
