# Architecture Documentation

## Overview

Banco Ademi's mobile and web banking application is built using **Clean Architecture** principles, ensuring maintainability, testability, and scalability. This document explains the architectural decisions, patterns, and structure of the codebase.

## Table of Contents

1. [Clean Architecture](#clean-architecture)
2. [Project Structure](#project-structure)
3. [Layer Responsibilities](#layer-responsibilities)
4. [Design Patterns](#design-patterns)
5. [State Management](#state-management)
6. [Dependency Injection](#dependency-injection)
7. [Error Handling](#error-handling)
8. [Navigation](#navigation)
9. [Security](#security)
10. [Testing Strategy](#testing-strategy)

## Clean Architecture

The project follows Uncle Bob's Clean Architecture with three main layers:

```
┌─────────────────────────────────────────────┐
│         Presentation Layer (UI)             │
│   ┌──────────────────────────────────────┐  │
│   │ Pages, Widgets, BLoCs                │  │
│   └──────────────────────────────────────┘  │
├─────────────────────────────────────────────┤
│         Domain Layer (Business Logic)       │
│   ┌──────────────────────────────────────┐  │
│   │ Entities, Use Cases, Repositories    │  │
│   └──────────────────────────────────────┘  │
├─────────────────────────────────────────────┤
│         Data Layer (Data Management)        │
│   ┌──────────────────────────────────────┐  │
│   │ Models, Data Sources, Repositories   │  │
│   └──────────────────────────────────────┘  │
└─────────────────────────────────────────────┘
```

### Why Clean Architecture?

- **Independence of Frameworks**: Business logic doesn't depend on Flutter or any external library
- **Testability**: Each layer can be tested independently
- **Independence of UI**: UI can be changed without touching business logic
- **Independence of Database**: Data sources can be swapped easily
- **Independence of External Agencies**: Business rules don't know anything about the outside world

## Project Structure

```
lib/
├── main.dart                          # Entry point
├── app.dart                           # Root application widget
│
├── core/                              # Core functionality (framework-independent)
│   ├── config/                        # Configuration management
│   │   ├── app_config.dart
│   │   ├── environment.dart
│   │   └── api_config.dart
│   │
│   ├── constants/                     # Application constants
│   │   ├── app_constants.dart
│   │   ├── api_endpoints.dart
│   │   ├── route_constants.dart
│   │   └── storage_keys.dart
│   │
│   ├── theme/                         # Design system
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_dimensions.dart
│   │
│   ├── errors/                        # Error handling
│   │   ├── exceptions.dart
│   │   ├── failures.dart
│   │   └── error_handler.dart
│   │
│   ├── network/                       # Network layer (Dio client)
│   │   ├── api_client.dart
│   │   ├── network_info.dart
│   │   ├── dio_client.dart
│   │   └── interceptors/
│   │
│   ├── security/                      # Security services
│   │   ├── biometric_service.dart
│   │   ├── encryption_service.dart
│   │   ├── secure_storage_service.dart
│   │   └── certificate_pinning.dart
│   │
│   ├── utils/                         # Utility functions
│   │   ├── validators.dart
│   │   ├── formatters.dart
│   │   ├── date_utils.dart
│   │   └── logger.dart
│   │
│   ├── services/                      # Core services
│   │   ├── navigation_service.dart
│   │   ├── notification_service.dart
│   │   └── analytics_service.dart
│   │
│   └── di/                            # Dependency injection
│       └── injection_container.dart
│
├── features/                          # Feature modules (Clean Architecture)
│   │
│   └── [feature_name]/                # Example: authentication
│       │
│       ├── data/                      # DATA LAYER
│       │   ├── datasources/           # Data sources (remote/local)
│       │   │   ├── [feature]_remote_datasource.dart
│       │   │   └── [feature]_local_datasource.dart
│       │   │
│       │   ├── models/                # Data models with JSON serialization
│       │   │   └── [model]_model.dart
│       │   │
│       │   └── repositories/          # Repository implementations
│       │       └── [feature]_repository_impl.dart
│       │
│       ├── domain/                    # DOMAIN LAYER (Business Logic)
│       │   ├── entities/              # Business entities
│       │   │   └── [entity].dart
│       │   │
│       │   ├── repositories/          # Repository interfaces
│       │   │   └── [feature]_repository.dart
│       │   │
│       │   └── usecases/              # Use cases (business logic units)
│       │       ├── [action]_usecase.dart
│       │       └── ...
│       │
│       └── presentation/              # PRESENTATION LAYER (UI)
│           ├── bloc/                  # State management (BLoC)
│           │   ├── [feature]_bloc.dart
│           │   ├── [feature]_event.dart
│           │   └── [feature]_state.dart
│           │
│           ├── pages/                 # Screen widgets
│           │   └── [page]_page.dart
│           │
│           └── widgets/               # Feature-specific widgets
│               └── [widget].dart
│
├── shared/                            # Shared across features
│   ├── widgets/                       # Reusable UI components
│   │   ├── buttons/
│   │   ├── inputs/
│   │   ├── cards/
│   │   ├── dialogs/
│   │   └── loaders/
│   │
│   ├── models/                        # Shared data models
│   │   └── [shared_model].dart
│   │
│   └── extensions/                    # Extension methods
│       ├── string_extension.dart
│       ├── date_extension.dart
│       └── context_extension.dart
│
└── routing/                           # Navigation configuration
    ├── app_router.dart                # GoRouter configuration
    ├── route_guards.dart              # Route protection logic
    └── routes.dart                    # Route definitions
```

## Layer Responsibilities

### 1. Presentation Layer

**Responsibility**: Handle user interface and user interactions

**Components**:
- **Pages/Screens**: Full-screen widgets representing app screens
- **Widgets**: Reusable UI components
- **BLoCs**: State management and presentation logic

**Rules**:
- Never directly access data sources
- Communicate with domain layer through use cases
- Handle UI state through BLoC
- No business logic (only presentation logic)

**Example Flow**:
```dart
LoginPage 
  → LoginBloc (receives LoginEvent)
  → LoginUseCase (executes business logic)
  → Returns Either<Failure, User>
  → LoginBloc emits LoginState
  → LoginPage rebuilds with new state
```

### 2. Domain Layer

**Responsibility**: Contain business logic and business entities

**Components**:
- **Entities**: Plain Dart objects representing business concepts
- **Repository Interfaces**: Contracts for data operations
- **Use Cases**: Single business logic operations

**Rules**:
- No dependencies on outer layers
- No Flutter dependencies
- Pure Dart code only
- Each use case does one thing

**Example Entity**:
```dart
class User {
  final String id;
  final String name;
  final String email;
  
  User({required this.id, required this.name, required this.email});
}
```

**Example Use Case**:
```dart
class LoginUseCase {
  final AuthRepository repository;
  
  LoginUseCase(this.repository);
  
  Future<Either<Failure, User>> call({
    required String username,
    required String password,
  }) {
    return repository.login(username: username, password: password);
  }
}
```

### 3. Data Layer

**Responsibility**: Manage data from various sources

**Components**:
- **Models**: Data Transfer Objects with JSON serialization
- **Data Sources**: Remote (API) and Local (Cache/Database)
- **Repository Implementations**: Implement domain repository interfaces

**Rules**:
- Models extend/implement domain entities
- Handle data serialization/deserialization
- Manage caching strategies
- Handle API calls and local storage

**Example Model**:
```dart
@JsonSerializable()
class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) => 
      _$UserModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
```

**Example Repository Implementation**:
```dart
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  
  @override
  Future<Either<Failure, User>> login({
    required String username,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.login(
          username: username,
          password: password,
        );
        await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }
}
```

## Design Patterns

### 1. Repository Pattern

Abstracts data sources from business logic. The domain layer defines the interface, and the data layer implements it.

### 2. Use Case Pattern

Each business operation is encapsulated in a use case class. This makes business logic reusable and testable.

### 3. BLoC Pattern

Business Logic Component pattern for state management:
- **Events**: User actions or system events
- **States**: UI states
- **BLoC**: Converts events to states

### 4. Dependency Injection

Using `get_it` and `injectable` for managing dependencies:
```dart
@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  
  LoginBloc(this.loginUseCase) : super(LoginInitial());
}
```

### 5. Either Pattern (Functional Error Handling)

Using `dartz` package for error handling:
```dart
Future<Either<Failure, User>> login() async {
  try {
    final user = await api.login();
    return Right(user); // Success
  } catch (e) {
    return Left(ServerFailure('Login failed')); // Failure
  }
}
```

## State Management

### BLoC (Business Logic Component)

We use `flutter_bloc` for state management with the following structure:

```dart
// Events - What happens
abstract class AuthEvent {}
class LoginRequested extends AuthEvent {
  final String username;
  final String password;
}

// States - UI state
abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final User user;
}
class AuthError extends AuthState {
  final String message;
}

// BLoC - Event to State converter
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  
  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }
  
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    
    final result = await loginUseCase(
      username: event.username,
      password: event.password,
    );
    
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }
}
```

## Dependency Injection

Using `get_it` and `injectable` for dependency management:

```dart
// Configure dependencies
@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

// Register services
@lazySingleton
class AuthRepository { }

// Inject dependencies
@injectable
class LoginBloc {
  final LoginUseCase loginUseCase;
  
  LoginBloc(this.loginUseCase);
}
```

## Error Handling

### Exception → Failure Flow

1. **Data Layer**: Throws exceptions
2. **Repository**: Catches exceptions, returns `Either<Failure, Success>`
3. **Use Case**: Passes the Either to presentation
4. **BLoC**: Handles failures, emits error states
5. **UI**: Displays user-friendly error messages

```dart
// Exception (Data Layer)
throw ServerException('API Error', code: '500');

// Failure (Domain Layer)
return Left(ServerFailure('Server error occurred'));

// Error State (Presentation)
emit(LoginError('Unable to log in. Please try again.'));
```

## Navigation

Using `go_router` for type-safe navigation:

```dart
// Route definition
GoRoute(
  path: '/account/:id',
  name: 'account-details',
  builder: (context, state) {
    final accountId = state.pathParameters['id']!;
    return AccountDetailsPage(accountId: accountId);
  },
),

// Navigation
context.goNamed('account-details', pathParameters: {'id': '123'});
```

### Route Guards

```dart
redirect: (context, state) {
  if (!isAuthenticated && !isPublicRoute) {
    return '/login';
  }
  return null;
}
```

## Security

### 1. Secure Storage

Sensitive data (tokens, credentials) stored using `flutter_secure_storage`:
```dart
await secureStorage.write(key: 'token', value: accessToken);
```

### 2. Encryption

Data encrypted using AES encryption before storage/transmission:
```dart
final encrypted = encryptionService.encrypt(sensitiveData);
```

### 3. Certificate Pinning

SSL certificate pinning for API calls to prevent MITM attacks:
```dart
final dio = Dio()
  ..httpClientAdapter = IOHttpClientAdapter()
  ..options.validateStatus = (status) => status! < 500;
```

### 4. Biometric Authentication

Using `local_auth` for biometric authentication:
```dart
final canAuthenticate = await biometricService.canAuthenticate();
if (canAuthenticate) {
  final authenticated = await biometricService.authenticate();
}
```

## Testing Strategy

### Unit Tests
Test business logic in isolation:
```dart
test('should return User when login is successful', () async {
  // Arrange
  when(() => mockRepository.login(...)).thenAnswer((_) async => Right(tUser));
  
  // Act
  final result = await usecase(username: 'test', password: 'pass');
  
  // Assert
  expect(result, Right(tUser));
});
```

### Widget Tests
Test UI components:
```dart
testWidgets('should show loading indicator when state is loading', (tester) async {
  await tester.pumpWidget(makeTestableWidget(LoginPage()));
  await tester.pump();
  
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
});
```

### Integration Tests
Test complete user flows:
```dart
testWidgets('complete login flow', (tester) async {
  // Navigate to login
  // Enter credentials
  // Tap login button
  // Verify navigation to home
});
```

### BLoC Tests
Using `bloc_test`:
```dart
blocTest<AuthBloc, AuthState>(
  'emits AuthAuthenticated when login succeeds',
  build: () => AuthBloc(mockLoginUseCase),
  act: (bloc) => bloc.add(LoginRequested(...)),
  expect: () => [AuthLoading(), AuthAuthenticated(tUser)],
);
```

## Best Practices

1. **Single Responsibility**: Each class has one reason to change
2. **Dependency Inversion**: Depend on abstractions, not concretions
3. **Immutability**: Use immutable data structures where possible
4. **Null Safety**: Leverage Dart's null safety features
5. **Code Generation**: Use build_runner for boilerplate reduction
6. **Documentation**: Document public APIs and complex logic
7. **Naming Conventions**: Follow Dart style guide
8. **Error Handling**: Always handle errors gracefully
9. **Performance**: Lazy load dependencies, cache when appropriate
10. **Security**: Never log sensitive data, always encrypt

## Conclusion

This architecture provides:
- **Maintainability**: Easy to understand and modify
- **Testability**: Each layer can be tested independently
- **Scalability**: Easy to add new features
- **Flexibility**: Easy to swap implementations
- **Team Collaboration**: Clear boundaries between layers

For questions or clarifications, consult the development team or refer to the inline documentation in the codebase.

---

Last updated: February 2026
