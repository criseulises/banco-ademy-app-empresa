# 🏦 Banco ADEMI - Demo App de Banca Móvil & Web

> ⚠️ **PROYECTO DE DEMOSTRACIÓN - 100% MOCKEADO**  
> Esta aplicación NO utiliza base de datos real ni APIs reales.  
> Todos los datos son ficticios y están almacenados en archivos JSON.  
> Ideal para demos, pruebas de UI/UX y presentaciones.

Una aplicación completa de banca digital construida con Flutter, implementando Clean Architecture y diseñada para iOS, Android y Web.

## 🎭 Modo Demo

**Este proyecto es una DEMOSTRACIÓN VISUAL** que muestra:
- ✅ Arquitectura Clean Architecture completa
- ✅ UI/UX de aplicación bancaria moderna
- ✅ Flujos de usuario completos
- ✅ Datos realistas mockeados en JSON
- ❌ NO conecta con APIs reales
- ❌ NO persiste datos en base de datos
- ❌ NO realiza transacciones reales

📖 **[Ver Guía Completa de Demo](DEMO_GUIDE.md)**

## 👥 Usuarios de Prueba

Usa cualquiera de estos usuarios para acceder a la app:

| Usuario | Email | PIN | Features |
|---------|-------|-----|----------|
| Juan Pérez | juan.perez@email.com | 1234 | 3 cuentas, 2 tarjetas, 2 préstamos |
| María Rodríguez | maria.rodriguez@email.com | 5678 | 2 cuentas, 2 tarjetas, 1 préstamo |
| Carlos Martínez | carlos.martinez@email.com | 9999 | 1 cuenta, 1 tarjeta, 1 préstamo |

## 🏗️ Arquitectura del Proyecto

Este proyecto implementa:
- **Clean Architecture** for maintainability and scalability
- **BLoC Pattern** for state management
- **Dependency Injection** using get_it and injectable
- **Multi-platform support** (iOS, Android, Web)
- **Security-first approach** with biometric authentication, encryption, and certificate pinning
- **Comprehensive feature set** covering all modern banking needs

## ✨ Features

### Authentication & Security
- ✅ Standard login with username/password
- ✅ Biometric authentication (fingerprint/face ID)
- ✅ 2FA OTP validation
- ✅ Device registration and management
- ✅ Password recovery and management
- ✅ Secure session management

### Digital Onboarding
- ✅ Digital account opening
- ✅ Biometric validation (FacePhi integration)
- ✅ KYC validation
- ✅ Electronic signature
- ✅ Document verification

### Product Management
- ✅ Multiple account types (checking, savings, multi-currency)
- ✅ Debit and credit card management
- ✅ Loan products
- ✅ Investment products

### Transactions
- ✅ Balance and transaction queries
- ✅ Account statements (PDF/Excel)
- ✅ Own account transfers
- ✅ Internal bank transfers
- ✅ ACH transfers
- ✅ LBTR transfers
- ✅ Scheduled transfers
- ✅ Service payment affiliations
- ✅ Bill payments
- ✅ Mobile top-ups

### Self-Service
- ✅ Card blocking/unblocking
- ✅ Profile data updates
- ✅ Push, SMS, and Email notifications
- ✅ Notification preferences

### Customer Support
- ✅ Contact information
- ✅ WhatsApp integration
- ✅ Social media links
- ✅ FAQ section
- ✅ Support ticket system

## 🚀 Getting Started

### Prerequisites

- Flutter SDK >=3.2.0
- Dart SDK >=3.2.0
- iOS development: Xcode 14+ and CocoaPods
- Android development: Android Studio with Android SDK
- Web development: Chrome browser

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/bancoademi/mobile-app.git
   cd mobile-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. **Run code generation**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   # iOS
   flutter run -d ios
   
   # Android
   flutter run -d android
   
   # Web
   flutter run -d chrome
   ```

## 📁 Project Structure

```
lib/
├── main.dart                 # Application entry point
├── app.dart                  # Root app widget
├── core/                     # Core functionality
│   ├── config/              # App configuration
│   ├── constants/           # Constants and enums
│   ├── theme/               # Theme configuration
│   ├── errors/              # Error handling
│   ├── network/             # Network layer (Dio)
│   ├── security/            # Security services
│   ├── utils/               # Utility functions
│   └── services/            # Core services
├── features/                # Feature modules
│   ├── authentication/      # Login, registration, etc.
│   ├── onboarding/          # Digital onboarding
│   ├── home/                # Dashboard
│   ├── accounts/            # Account management
│   ├── cards/               # Card management
│   ├── transfers/           # Money transfers
│   ├── payments/            # Bill payments
│   ├── loans/               # Loan products
│   ├── investments/         # Investment products
│   └── profile/             # User profile
├── shared/                  # Shared widgets and utilities
│   ├── widgets/             # Reusable widgets
│   ├── models/              # Shared models
│   └── extensions/          # Extension methods
└── routing/                 # Navigation configuration
```

See [ARCHITECTURE.md](ARCHITECTURE.md) for detailed architecture documentation.

## 🏛️ Architecture

This project follows **Clean Architecture** principles with three main layers:

1. **Presentation Layer** (UI)
   - Pages/Screens
   - Widgets
   - BLoC (Business Logic Components)

2. **Domain Layer** (Business Logic)
   - Entities
   - Use Cases
   - Repository Interfaces

3. **Data Layer** (Data Management)
   - Models (with JSON serialization)
   - Data Sources (Remote/Local)
   - Repository Implementations

### Key Patterns
- **BLoC Pattern** for state management
- **Repository Pattern** for data abstraction
- **Dependency Injection** for loose coupling
- **Either Pattern** (dartz) for error handling

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test

# Generate coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 🔐 Security

- **Secure Storage**: flutter_secure_storage for sensitive data
- **Biometric Authentication**: local_auth for fingerprint/face ID
- **Encryption**: AES encryption for data at rest
- **Certificate Pinning**: SSL pinning for API security
- **OWASP Compliance**: Following OWASP mobile security guidelines

## 🌐 Localization

The app supports multiple languages:
- Spanish (primary)
- English

To add translations, edit files in `lib/l10n/`

## 🎨 Design System

The app follows a comprehensive design system with:
- **Colors**: Consistent color palette
- **Typography**: Defined text styles
- **Spacing**: Standard spacing units
- **Components**: Reusable UI components

All design tokens are defined in `lib/core/theme/`

## 📱 Platform-Specific Configuration

### iOS

Required permissions in `ios/Runner/Info.plist`:
- Camera (for document scanning)
- FaceID (for biometric auth)
- Photo Library (for document upload)

### Android

Required permissions in `android/app/src/main/AndroidManifest.xml`:
- Camera
- Biometric
- Internet
- Network State

### Web

Web-specific configurations in `web/index.html`

## 🔧 Build & Deploy

### Development Build
```bash
flutter build apk --debug
flutter build ios --debug
flutter build web --profile
```

### Production Build
```bash
flutter build apk --release
flutter build ios --release
flutter build web --release
```

### Code Signing
- iOS: Configure signing in Xcode
- Android: Configure keystore in `android/key.properties`

## 📊 Code Generation

This project uses code generation for:
- JSON serialization: `json_serializable`
- Dependency injection: `injectable`
- API clients: `retrofit`
- Data classes: `freezed`

Run code generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Watch for changes:
```bash
flutter pub run build_runner watch
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Coding Standards
- Follow the project's linting rules (analysis_options.yaml)
- Write tests for new features
- Update documentation as needed
- Use conventional commit messages

## 📝 License

This project is proprietary and confidential. All rights reserved by Banco Ademi.

## 👥 Team

- **Development Team**: [Your Team Name]
- **Project Manager**: [Name]
- **Tech Lead**: [Name]

## 📞 Support

For support and inquiries:
- Email: soporte@bancoademi.com
- Phone: +1-809-555-0100
- WhatsApp: +1-809-555-0100

## 🔄 Version History

- **1.0.0** - Initial release
  - Authentication and security features
  - Account and card management
  - Transfer and payment capabilities
  - Digital onboarding
  - Profile management

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Material Design 3](https://m3.material.io/)

---

Built with ❤️ using Flutter
