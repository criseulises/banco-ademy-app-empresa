# 🚀 Próximos Pasos - Desarrollo con Mock Data

Este documento explica **exactamente** qué hacer para empezar a desarrollar features usando los datos mockeados.

---

## 📋 Checklist Inicial

### 1️⃣ Verificar Instalación (5 minutos)

```bash
# 1. Instalar dependencias
cd /Users/cristiansanchez/Documents/banco-ademi
flutter pub get

# 2. Verificar que no hay errores
flutter analyze

# 3. Generar código necesario
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Ejecutar la app (opcional en este punto)
flutter run
```

**✅ Resultado esperado:**
- Sin errores de compilación
- Mock data debe cargarse en logs: `✅ Mock data loaded (DEMO MODE)`

---

## 🎯 Plan de Desarrollo Recomendado

### Fase 1: Autenticación (Semana 1) 🔐

**Por qué primero:** Base de toda la app, necesario para acceder a features.

#### 1.1 Crear Modelos y Entities

```bash
# Archivos a crear:
lib/features/authentication/data/models/user_model.dart
lib/features/authentication/data/models/login_response_model.dart
lib/features/authentication/domain/entities/user_entity.dart
```

**Ejemplo user_model.dart:**
```dart
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String documentId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  // ... copiar campos de users.json

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
```

#### 1.2 Implementar DataSource Mock

Ya tienes: `auth_mock_data_source.dart` ✅

Revisa y ajusta si necesario.

#### 1.3 Crear Repository

```bash
lib/features/authentication/data/repositories/auth_repository_impl.dart
lib/features/authentication/domain/repositories/auth_repository.dart
```

#### 1.4 Crear Use Cases

```bash
lib/features/authentication/domain/usecases/login_usecase.dart
lib/features/authentication/domain/usecases/biometric_login_usecase.dart
lib/features/authentication/domain/usecases/validate_otp_usecase.dart
```

#### 1.5 Crear BLoC

```bash
lib/features/authentication/presentation/bloc/auth_bloc.dart
lib/features/authentication/presentation/bloc/auth_event.dart
lib/features/authentication/presentation/bloc/auth_state.dart
```

#### 1.6 Crear Pantallas

```bash
lib/features/authentication/presentation/pages/login_page.dart
lib/features/authentication/presentation/pages/otp_page.dart
lib/features/authentication/presentation/widgets/login_form.dart
```

**⏱️ Tiempo estimado:** 2-3 días

---

### Fase 2: Home/Dashboard (Semana 1-2) 🏠

**Por qué segundo:** Vista principal que muestra resumen de todo.

#### Datos necesarios:
- Usuario actual (de auth)
- Resumen de cuentas (balance total)
- Últimas transacciones
- Notificaciones

#### Archivos a crear:

```bash
# Models
lib/features/home/data/models/dashboard_model.dart

# DataSource (lee de MockDataService)
lib/features/home/data/datasources/dashboard_mock_data_source.dart

# Repository
lib/features/home/data/repositories/dashboard_repository_impl.dart
lib/features/home/domain/repositories/dashboard_repository.dart

# Use Cases
lib/features/home/domain/usecases/get_dashboard_data_usecase.dart

# BLoC
lib/features/home/presentation/bloc/dashboard_bloc.dart

# Pages
lib/features/home/presentation/pages/home_page.dart
lib/features/home/presentation/widgets/account_summary_widget.dart
lib/features/home/presentation/widgets/quick_actions_widget.dart
lib/features/home/presentation/widgets/recent_transactions_widget.dart
```

**⏱️ Tiempo estimado:** 2-3 días

---

### Fase 3: Cuentas (Semana 2) 💰

**Por qué tercero:** Feature fundamental, relativamente simple.

#### Ya tienes el ejemplo completo en:
📄 `IMPLEMENTATION_EXAMPLE.dart`

Sigue ese patrón exacto para:

```bash
# 1. Copiar estructura del ejemplo
# 2. Ajustar nombres de archivos
# 3. Ejecutar code generation
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Integrar con routing
```

**Features a implementar:**
- ✅ Lista de cuentas
- ✅ Detalle de cuenta individual
- ✅ Historial de transacciones por cuenta
- ✅ Filtros por fecha/tipo

**⏱️ Tiempo estimado:** 2 días

---

### Fase 4: Tarjetas (Semana 2-3) 💳

Similar a cuentas, usa los datos de `cards.json`.

```bash
lib/features/cards/
  data/
    models/card_model.dart
    datasources/card_mock_data_source.dart
    repositories/card_repository_impl.dart
  domain/
    entities/card_entity.dart
    repositories/card_repository.dart
    usecases/get_cards_usecase.dart
  presentation/
    bloc/card_bloc.dart
    pages/cards_page.dart
    pages/card_detail_page.dart
    widgets/card_widget.dart  # UI de tarjeta física
```

**Features especiales:**
- ✅ Vista 3D de tarjeta
- ✅ Bloqueo/desbloqueo temporal
- ✅ Cambio de límites
- ✅ Activación/desactivación de compras internacionales

**⏱️ Tiempo estimado:** 2-3 días

---

### Fase 5: Transferencias (Semana 3) 💸

**Importante:** En modo demo, las transferencias NO modifican balances reales.

```bash
lib/features/transfers/
  data/
    models/transfer_model.dart
    models/beneficiary_model.dart
    datasources/transfer_mock_data_source.dart
  # ... resto de estructura
```

**Features a implementar:**
- ✅ Transferencias a cuentas ADEMI
- ✅ Transferencias a otros bancos
- ✅ Gestión de beneficiarios (de beneficiaries.json)
- ✅ Confirmación con PIN/OTP

**Mock behavior:**
```dart
Future<TransferModel> executeTransfer(TransferRequest request) async {
  await Future.delayed(Duration(seconds: 2)); // Simular procesamiento
  
  // En mock, siempre retorna éxito
  return TransferModel(
    id: 'txn_${DateTime.now().millisecondsSinceEpoch}',
    status: 'COMPLETED',
    reference: 'TRF${DateTime.now().millisecondsSinceEpoch}',
    // ... resto de campos
  );
}
```

**⏱️ Tiempo estimado:** 3-4 días

---

### Fase 6: Pagos (Semana 4) 💵

Usa datos de beneficiarios con `type: SERVICIO`.

```bash
lib/features/payments/
  data/
    models/service_model.dart
    models/payment_model.dart
    datasources/payment_mock_data_source.dart
```

**Servicios disponibles en mock:**
- EDESUR (electricidad)
- Claro (telefonía)
- Tricom (cable/internet)

**⏱️ Tiempo estimado:** 2-3 días

---

### Fase 7: Préstamos (Semana 4-5) 🏦

```bash
lib/features/loans/
  data/
    models/loan_model.dart
    datasources/loan_mock_data_source.dart
```

Usa datos de `loans.json`.

**Features:**
- ✅ Lista de préstamos activos
- ✅ Detalle de préstamo (amortización)
- ✅ Simulador de préstamos
- ✅ Pago adelantado

**⏱️ Tiempo estimado:** 2-3 días

---

### Fase 8: Inversiones (Semana 5) 📈

```bash
lib/features/investments/
  data/
    models/investment_model.dart
    datasources/investment_mock_data_source.dart
```

Usa datos de `investments.json`.

**Features:**
- ✅ Portafolio de inversiones
- ✅ Rendimiento histórico (mock charts)
- ✅ Simulador de inversiones

**⏱️ Tiempo estimado:** 2 días

---

### Fase 9: Perfil (Semana 5-6) 👤

```bash
lib/features/profile/
  data/
    models/profile_model.dart
    datasources/profile_mock_data_source.dart
```

**Features:**
- ✅ Ver información personal
- ✅ Editar datos de contacto (mock - no persiste)
- ✅ Cambiar PIN
- ✅ Configurar biométrico
- ✅ Gestión de dispositivos

**⏱️ Tiempo estimado:** 2 días

---

### Fase 10: Notificaciones (Semana 6) 🔔

```bash
lib/features/notifications/
  data/
    models/notification_model.dart
    datasources/notification_mock_data_source.dart
```

Usa `notifications.json`.

**Features:**
- ✅ Lista de notificaciones
- ✅ Marcar como leídas
- ✅ Filtros por tipo
- ✅ Navegación a origen (deeplink interno)

**⏱️ Tiempo estimado:** 1-2 días

---

## 🔄 Flujo de Trabajo Diario

### Morning Routine (30 minutos)

```bash
# 1. Pull latest code (si trabajas en equipo)
git pull

# 2. Actualizar dependencias
flutter pub get

# 3. Regenerar código
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Verificar que todo compila
flutter analyze

# 5. Ejecutar app
flutter run
```

### Development Loop

Para cada feature/tarea:

1. **Crear branch** (opcional)
   ```bash
   git checkout -b feature/accounts-list
   ```

2. **Implementar en orden:**
   - Model (data layer)
   - DataSource mock
   - Repository implementation
   - Repository interface (domain)
   - Entity (domain)
   - Use Case
   - BLoC (events, states, bloc)
   - Pages & Widgets

3. **Generar código**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Hot reload/restart**
   ```bash
   r  # restart
   R  # hot reload
   ```

5. **Test manual** con usuarios demo

6. **Commit**
   ```bash
   git add .
   git commit -m "feat: implement accounts list feature"
   ```

### Evening Routine (15 minutos)

```bash
# 1. Verificar que no dejaste errores
flutter analyze

# 2. Push code
git push

# 3. Actualizar PROJECT_STATUS.md con progreso
```

---

## 💡 Tips Prácticos

### Reutilizar Código

Crea widgets comunes en `lib/shared/widgets/`:

```dart
// lib/shared/widgets/currency_display.dart
class CurrencyDisplay extends StatelessWidget {
  final double amount;
  final String currency;
  
  // Widget reutilizable para mostrar montos
}

// lib/shared/widgets/empty_state.dart
class EmptyState extends StatelessWidget {
  final String message;
  final IconData icon;
  
  // Widget para estados vacíos
}

// lib/shared/widgets/error_display.dart
class ErrorDisplay extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  
  // Widget para mostrar errores
}
```

### Extensions Útiles

```dart
// lib/shared/extensions/string_extensions.dart
extension StringExtensions on String {
  String maskAccount() {
    // Enmascara número de cuenta
  }
  
  String maskCard() {
    // Enmascara número de tarjeta
  }
}

// lib/shared/extensions/datetime_extensions.dart
extension DateTimeExtensions on DateTime {
  String toReadable() {
    // Formato legible en español
  }
}
```

### Logger para Debug

```dart
import 'package:banco_ademi/core/utils/logger.dart';

// En cualquier parte del código
AppLogger.debug('Loading accounts for user: $userId');
AppLogger.info('Accounts loaded successfully: ${accounts.length}');
AppLogger.error('Failed to load accounts: $error');
```

---

## 🧪 Testing con Mock Data

### Unit Tests

```dart
// test/features/accounts/data/datasources/account_mock_data_source_test.dart
void main() {
  late AccountMockDataSource dataSource;
  
  setUp(() {
    // MockDataService ya inicializado en setUpAll
    dataSource = AccountMockDataSource();
  });
  
  test('should return accounts for valid user', () async {
    final accounts = await dataSource.getAccounts('user_001');
    expect(accounts, isNotEmpty);
    expect(accounts[0].userId, 'user_001');
  });
}
```

### Widget Tests

```dart
// test/features/accounts/presentation/widgets/account_card_test.dart
void main() {
  testWidgets('should display account information', (tester) async {
    final account = AccountEntity(/* ... */);
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AccountCard(account: account),
        ),
      ),
    );
    
    expect(find.text(account.nickname), findsOneWidget);
    expect(find.text('RD\$125,450.50'), findsOneWidget);
  });
}
```

---

## 📊 Tracking de Progreso

Crea un archivo `PROJECT_STATUS.md`:

```markdown
# Estado del Proyecto - Banco ADEMI Demo

Última actualización: 2026-02-07

## Features Completados ✅

- [x] Estructura de proyecto
- [x] Mock data setup
- [x] Configuración inicial

## Features En Desarrollo 🚧

- [ ] Authentication (70% - falta OTP)
  - [x] Login básico
  - [x] DataSource mock
  - [ ] Pantalla OTP
  - [ ] Biométrico

## Features Pendientes 📋

- [ ] Home/Dashboard
- [ ] Cuentas
- [ ] Tarjetas
- [ ] Transferencias
- [ ] Pagos
- [ ] Préstamos
- [ ] Inversiones
- [ ] Perfil
- [ ] Notificaciones

## Bugs Conocidos 🐛

- Ninguno por ahora

## Notas

- Usando usuarios mock: juan.perez@email.com (1234)
- Mock data en: assets/mock_data/
```

---

## 🎯 Objetivo Final (6 semanas)

Al completar todas las fases tendrás:

✅ App funcional con UI completa  
✅ Todos los flujos principales implementados  
✅ Navegación entre features  
✅ Datos realistas de 3 usuarios  
✅ Base sólida para presentaciones  
✅ Arquitectura lista para migrar a APIs reales  

---

## 🆘 Recursos de Ayuda

- **Ejemplo completo**: `IMPLEMENTATION_EXAMPLE.dart`
- **Guía de demo**: `DEMO_GUIDE.md`
- **Arquitectura**: `docs/ARCHITECTURE.md`
- **Setup**: `PROJECT_SETUP_COMPLETE.md`
- **Mock data docs**: `MOCK_DATA_README.md`

---

## 📞 Dudas Frecuentes

**Q: ¿Puedo modificar los datos mock?**  
A: Sí, edita los JSON en `assets/mock_data/` y haz restart.

**Q: ¿Cómo simulo un error?**  
A: En el DataSource, lanza una excepción:
```dart
if (someCondition) {
  throw ServerException('Error simulado');
}
```

**Q: ¿Cómo agrego más usuarios?**  
A: Edita `users.json` y agrega sus cuentas, tarjetas, etc.

**Q: ¿Los cambios persisten?**  
A: No, cada restart resetea a los datos originales del JSON.

**Q: ¿Puedo usar esto en producción?**  
A: No, es solo para demo. Para producción, implementa APIs reales.

---

**🚀 ¡Comienza con Authentication y avanza feature por feature!**
