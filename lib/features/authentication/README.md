# Authentication Feature

## Overview
This module handles all authentication and security-related functionality including login, registration, biometric authentication, password management, and session handling.

## Structure

```
authentication/
├── data/
│   ├── datasources/
│   │   ├── auth_remote_datasource.dart    # API calls for authentication
│   │   └── auth_local_datasource.dart      # Local cache for auth data
│   ├── models/
│   │   ├── user_model.dart                 # User data model
│   │   ├── login_request_model.dart        # Login request DTO
│   │   ├── login_response_model.dart       # Login response DTO
│   │   └── device_model.dart               # Device registration model
│   └── repositories/
│       └── auth_repository_impl.dart       # Repository implementation
├── domain/
│   ├── entities/
│   │   ├── user.dart                       # User entity
│   │   └── device.dart                     # Device entity
│   ├── repositories/
│   │   └── auth_repository.dart            # Repository interface
│   └── usecases/
│       ├── login_usecase.dart              # Standard login
│       ├── biometric_login_usecase.dart    # Biometric login
│       ├── logout_usecase.dart             # Logout
│       ├── register_usecase.dart           # User registration
│       ├── forgot_password_usecase.dart    # Password recovery
│       ├── validate_otp_usecase.dart       # OTP validation
│       └── check_auth_status_usecase.dart  # Check if user is authenticated
└── presentation/
    ├── bloc/
    │   ├── auth_bloc.dart                  # Main authentication BLoC
    │   ├── auth_event.dart                 # Authentication events
    │   ├── auth_state.dart                 # Authentication states
    │   ├── login_bloc.dart                 # Login-specific BLoC
    │   └── registration_bloc.dart          # Registration BLoC
    ├── pages/
    │   ├── login_page.dart                 # Login screen
    │   ├── biometric_login_page.dart       # Biometric login screen
    │   ├── register_page.dart              # Registration screen
    │   ├── forgot_password_page.dart       # Password recovery
    │   └── otp_verification_page.dart      # OTP verification screen
    └── widgets/
        ├── login_form.dart                 # Login form widget
        ├── biometric_button.dart           # Biometric auth button
        ├── otp_input_field.dart            # OTP input widget
        └── password_strength_indicator.dart # Password strength widget

## Features

- ✅ Username/Password login
- ✅ Biometric authentication (fingerprint/face ID)
- ✅ 2FA with OTP validation
- ✅ User registration
- ✅ Password recovery
- ✅ Device registration and management
- ✅ Session management
- ✅ Remember me functionality
- ✅ Auto-login with biometrics

## Use Cases

### Login Flow
1. User enters credentials
2. `LoginUseCase` validates and authenticates
3. Store tokens in secure storage
4. Navigate to home screen

### Biometric Login Flow
1. Check if biometric is available
2. Authenticate using biometric
3. Retrieve stored credentials
4. Auto-login user

### Registration Flow
1. User enters personal information
2. Validate input data
3. Submit registration request
4. Verify OTP
5. Complete registration

## TODO

- [ ] Implement data sources (remote and local)
- [ ] Create data models with JSON serialization
- [ ] Implement repository
- [ ] Create use cases for each authentication action
- [ ] Implement BLoC for state management
- [ ] Create UI pages and widgets
- [ ] Write unit tests
- [ ] Write widget tests
- [ ] Write integration tests
