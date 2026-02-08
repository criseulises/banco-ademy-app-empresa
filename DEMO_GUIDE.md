# 🎭 Banco ADEMI - Demo Mockeada 100%

## ⚠️ IMPORTANTE: Proyecto de DEMOSTRACIÓN

Este proyecto está configurado completamente para **DEMOSTRACIÓN** sin ninguna conexión a bases de datos reales o APIs externas.

### ✅ Lo que SÍ tiene este proyecto

- ✅ Estructura completa de Clean Architecture
- ✅ Todos los archivos y directorios organizados
- ✅ **Datos mockeados en JSON** para todos los features
- ✅ Servicio centralizado para acceder a mock data
- ✅ 3 usuarios de prueba con datos completos
- ✅ Transacciones, cuentas, tarjetas, préstamos, inversiones
- ✅ Arquitectura lista para escalar a producción

### ❌ Lo que NO tiene este proyecto

- ❌ Base de datos (SQLite, Hive, etc.)
- ❌ Llamadas a APIs reales
- ❌ Backend o servidor
- ❌ Persistencia de datos entre sesiones
- ❌ Validaciones de negocio complejas
- ❌ Encriptación real de datos sensibles

---

## 📁 Estructura de Datos Mock

```
assets/mock_data/
├── users.json           # 3 usuarios de demo
├── accounts.json        # 6 cuentas bancarias
├── cards.json           # 5 tarjetas (débito/crédito)
├── transactions.json    # 10+ transacciones
├── loans.json           # 4 préstamos
├── investments.json     # 5 inversiones
├── beneficiaries.json   # 6 beneficiarios
└── notifications.json   # 10 notificaciones
```

### 📊 Estadísticas de Mock Data

- **Usuarios**: 3 perfiles completos
- **Cuentas**: 6 cuentas (Ahorro, Corriente, Nómina, Plazo Fijo)
- **Tarjetas**: 5 tarjetas (Visa, Mastercard, Amex)
- **Transacciones**: 10 transacciones de ejemplo
- **Préstamos**: 4 préstamos (Personal, Vehículo, Hipotecario)
- **Inversiones**: 5 inversiones (Fondos Mutuos, Certificados)

---

## 👥 Usuarios de Demo

### 👤 Usuario 1: Juan Pérez García
```
Email: juan.perez@email.com
PIN: 1234
Cédula: 001-1234567-8
```
**Portafolio:**
- 3 Cuentas (Balance total: RD$239,120.75)
- 2 Tarjetas (1 Débito, 1 Crédito)
- 2 Préstamos activos
- 1 Inversión

### 👤 Usuario 2: María Rodríguez Santos
```
Email: maria.rodriguez@email.com
PIN: 5678
Cédula: 001-9876543-2
```
**Portafolio:**
- 2 Cuentas (1 en DOP, 1 en USD)
- 2 Tarjetas (Visa, Amex)
- 1 Préstamo hipotecario
- 2 Inversiones

### 👤 Usuario 3: Carlos Martínez López
```
Email: carlos.martinez@email.com
PIN: 9999
Cédula: 001-5555555-5
```
**Portafolio:**
- 1 Cuenta de Ahorro
- 1 Tarjeta Débito
- 1 Préstamo personal
- 1 Inversión

---

## 🔧 Cómo Usar Mock Data

### 1️⃣ Servicio Centralizado

Usa `MockDataService` para acceder a todos los datos:

```dart
import 'package:banco_ademi/core/data/mock_data_service.dart';

// El servicio se inicializa automáticamente en main.dart

// Obtener todos los usuarios
final users = MockDataService.instance.getUsers();

// Obtener usuario por ID
final user = MockDataService.instance.getUserById('user_001');

// Obtener cuentas de un usuario
final accounts = MockDataService.instance.getAccountsByUserId('user_001');

// Obtener transacciones de una cuenta
final transactions = MockDataService.instance.getTransactionsByAccountId('acc_001');

// Obtener tarjetas de un usuario
final cards = MockDataService.instance.getCardsByUserId('user_001');

// Obtener préstamos de un usuario
final loans = MockDataService.instance.getLoansByUserId('user_001');

// Obtener inversiones de un usuario
final investments = MockDataService.instance.getInvestmentsByUserId('user_001');

// Obtener notificaciones no leídas
final unread = MockDataService.instance.getUnreadNotificationsByUserId('user_001');
```

### 2️⃣ En DataSources

Los DataSources deben simular llamadas de red pero leer de JSONs:

```dart
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  @override
  Future<List<AccountModel>> getAccounts(String userId) async {
    // 1. Simular latencia de red
    await Future.delayed(const Duration(milliseconds: 800));
    
    // 2. Obtener datos del servicio mock
    final accountsJson = MockDataService.instance.getAccountsByUserId(userId);
    
    // 3. Convertir a modelos
    return accountsJson
        .map((json) => AccountModel.fromJson(json))
        .toList();
  }

  @override
  Future<AccountModel> getAccountById(String accountId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final accountJson = MockDataService.instance.getAccountById(accountId);
    
    if (accountJson == null) {
      throw Exception('Cuenta no encontrada');
    }
    
    return AccountModel.fromJson(accountJson);
  }
}
```

### 3️⃣ Ejemplo de Autenticación Mock

```dart
// En AuthMockDataSource
Future<Map<String, dynamic>> login({
  required String email,
  required String pin,
}) async {
  // Simular delay
  await Future.delayed(const Duration(milliseconds: 800));

  // Validar contra usuarios mockeados
  final user = MockDataService.instance.getUserByEmail(email);
  
  if (user == null || user['pin'] != pin) {
    throw Exception('Credenciales inválidas');
  }

  // Retornar token mock
  return {
    'accessToken': 'mock_token_${user['id']}',
    'refreshToken': 'mock_refresh_token_${user['id']}',
    'userId': user['id'],
    'expiresIn': 3600,
  };
}
```

---

## 🎯 Patrón de Implementación

### Para cada Feature:

1. **Data Layer**:
   ```dart
   // datasources/feature_mock_data_source.dart
   class FeatureMockDataSource {
     Future<List<Model>> getData() async {
       await Future.delayed(Duration(milliseconds: 500)); // Simular red
       final data = MockDataService.instance.getSomeData();
       return data.map((json) => Model.fromJson(json)).toList();
     }
   }
   ```

2. **Repository Implementation**:
   ```dart
   class FeatureRepositoryImpl implements FeatureRepository {
     final FeatureMockDataSource dataSource;
     
     @override
     Future<Either<Failure, List<Entity>>> getData() async {
       try {
         final models = await dataSource.getData();
         return Right(models.map((m) => m.toEntity()).toList());
       } catch (e) {
         return Left(ServerFailure());
       }
     }
   }
   ```

3. **Use Case** (sin cambios):
   ```dart
   class GetDataUseCase {
     final FeatureRepository repository;
     
     Future<Either<Failure, List<Entity>>> call() {
       return repository.getData();
     }
   }
   ```

4. **BLoC** (sin cambios):
   ```dart
   class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
     final GetDataUseCase getDataUseCase;
     
     // Lógica normal del BLoC
   }
   ```

---

## 🔄 Cómo Agregar Más Datos Mock

### Paso 1: Editar el JSON correspondiente

```json
// assets/mock_data/accounts.json
{
  "accounts": [
    {
      "id": "acc_007",
      "userId": "user_001",
      "accountNumber": "1001234567893",
      "accountType": "AHORRO",
      "currency": "USD",
      "balance": 5000.00,
      // ... más campos
    }
  ]
}
```

### Paso 2: Hot Restart

```bash
# Los cambios en assets requieren restart completo
r  # En terminal de Flutter
```

### Paso 3: Los datos ya están disponibles

```dart
final accounts = MockDataService.instance.getAccountsByUserId('user_001');
// Incluye la nueva cuenta acc_007
```

---

## 📝 Notas Importantes

### ✅ Ventajas de este approach

1. **Desarrollo independiente**: No necesitas backend funcionando
2. **Demos consistentes**: Siempre los mismos datos
3. **Testing simple**: Datos controlados y predecibles
4. **Sin conectividad**: Funciona completamente offline
5. **Iteración rápida**: Cambias JSON y ves resultados
6. **Presentaciones**: Ideal para mostrar a stakeholders

### ⚠️ Limitaciones

1. **No hay persistencia**: Al reiniciar se pierden cambios
2. **No hay validaciones reales**: Las reglas de negocio son básicas
3. **No modifica balances**: Las transacciones no afectan cuentas
4. **Sin sincronización**: No hay estado compartido entre usuarios
5. **Datos limitados**: Solo lo que está en los JSONs

### 🔮 Migración a Producción

Cuando quieras conectar con APIs reales:

1. ✅ Mantén la misma estructura de arquitectura
2. ✅ Reemplaza `MockDataService` con llamadas HTTP (Dio)
3. ✅ Implementa `RemoteDataSource` real con Retrofit
4. ✅ Implementa `LocalDataSource` con Hive/SQLite
5. ✅ El resto del código (Repository, UseCase, BLoC) **NO cambia**
6. ✅ Mantén los mocks para testing

---

## 🚀 Comandos Útiles

```bash
# Instalar dependencias
flutter pub get

# Generar código (modelos, DI, etc.)
flutter pub run build_runner build --delete-conflicting-outputs

# Ejecutar app
flutter run

# Verificar datos mock cargados
# Revisa los logs al iniciar, debe decir:
# ✅ Mock data loaded (DEMO MODE - NO REAL DATABASE)
```

---

## 📚 Recursos

- [README.md](README.md) - Setup general del proyecto
- [ARCHITECTURE.md](docs/ARCHITECTURE.md) - Documentación de arquitectura
- [MOCK_DATA_README.md](MOCK_DATA_README.md) - Detalle de datos mock
- [PROJECT_SETUP_COMPLETE.md](PROJECT_SETUP_COMPLETE.md) - Checklist completo

---

## 🎨 Personalización

### Cambiar datos de un usuario específico

Edita `assets/mock_data/users.json` y modifica los campos que necesites:

```json
{
  "id": "user_001",
  "firstName": "NuevoNombre",
  "lastName": "NuevoApellido",
  "email": "nuevo@email.com",
  // ...
}
```

### Agregar nuevas transacciones

Edita `assets/mock_data/transactions.json`:

```json
{
  "id": "txn_NEW",
  "userId": "user_001",
  "accountId": "acc_001",
  "type": "DEPOSITO",
  "amount": 10000.00,
  "date": "2026-02-08T10:00:00Z",
  // ...
}
```

### Crear nuevo usuario

Agrega a `assets/mock_data/users.json`, luego crea sus cuentas, tarjetas, etc.

---

## 💡 Tips para Desarrollo

1. **Usa los 3 usuarios existentes** para diferentes escenarios
2. **Simula diferentes estados** editando los JSONs (cuentas bloqueadas, préstamos vencidos, etc.)
3. **Delays realistas**: Usa 300-800ms para simular latencia de red
4. **Maneja errores**: Lanza excepciones en casos específicos para testear error handling
5. **Logs detallados**: Usa `AppLogger` para debuggear flujo de datos

---

**🎭 Este es un proyecto de DEMOSTRACIÓN para mostrar UI/UX y arquitectura, NO un sistema bancario funcional**
