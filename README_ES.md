# 🏦 Banco ADEMI - Aplicación Demo

## 🎯 ¿Qué es este proyecto?

Esta es una **aplicación de demostración** completa de banca móvil y web construida con Flutter. **Todos los datos son ficticios y están almacenados en archivos JSON** - no hay conexión a bases de datos reales ni APIs.

### ⚠️ Aclaración Importante

- ✅ **SÍ es:** Demo funcional, arquitectura completa, UI/UX profesional
- ❌ **NO es:** Sistema bancario real, datos persistentes, conexión a backend

---

## 🚀 Inicio Rápido

### 1. Instalar Dependencias

```bash
cd /Users/cristiansanchez/Documents/banco-ademi
flutter pub get
```

### 2. Generar Código

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Ejecutar App

```bash
flutter run
```

### 4. Usar Credenciales Demo

| Email | PIN |
|-------|-----|
| juan.perez@email.com | 1234 |
| maria.rodriguez@email.com | 5678 |
| carlos.martinez@email.com | 9999 |

---

## 📁 Estructura del Proyecto

```
banco-ademi/
├── assets/
│   └── mock_data/              # 🎭 DATOS MOCKEADOS
│       ├── users.json          # 3 usuarios demo
│       ├── accounts.json       # 6 cuentas
│       ├── cards.json          # 5 tarjetas
│       ├── transactions.json   # 10+ transacciones
│       ├── loans.json          # 4 préstamos
│       ├── investments.json    # 5 inversiones
│       ├── beneficiaries.json  # 6 beneficiarios
│       └── notifications.json  # 10 notificaciones
│
├── lib/
│   ├── core/                   # 🔧 Configuración central
│   │   ├── config/
│   │   ├── constants/
│   │   ├── theme/
│   │   ├── utils/
│   │   ├── errors/
│   │   └── data/
│   │       └── mock_data_service.dart  # ⭐ Servicio mock
│   │
│   ├── features/               # 📦 Features por módulo
│   │   ├── authentication/
│   │   ├── home/
│   │   ├── accounts/
│   │   ├── cards/
│   │   ├── transfers/
│   │   ├── payments/
│   │   ├── loans/
│   │   ├── investments/
│   │   └── profile/
│   │
│   ├── routing/                # 🛣️ Navegación
│   ├── shared/                 # 🔄 Componentes compartidos
│   ├── main.dart               # 🚪 Punto de entrada
│   └── app.dart                # 🎨 Widget raíz
│
├── docs/                       # 📚 Documentación
│   └── ARCHITECTURE.md
│
├── DEMO_GUIDE.md              # 📖 Guía completa de demo
├── MOCK_DATA_README.md        # 📊 Documentación de datos
├── IMPLEMENTATION_EXAMPLE.dart # 💡 Ejemplo completo
├── NEXT_STEPS.md              # ✅ Plan de desarrollo
└── README_ES.md               # 👈 Estás aquí
```

---

## 🎭 Datos Mockeados

### Usuarios Disponibles

#### 👤 Juan Pérez García
- **Email:** juan.perez@email.com
- **PIN:** 1234
- **Cédula:** 001-1234567-8
- **Tiene:**
  - 3 cuentas (Ahorro, Corriente, Nómina)
  - 2 tarjetas (Visa Débito, Mastercard Crédito)
  - 2 préstamos (Personal, Vehículo)
  - Balance total: RD$239,120.75

#### 👤 María Rodríguez Santos
- **Email:** maria.rodriguez@email.com
- **PIN:** 5678
- **Cédula:** 001-9876543-2
- **Tiene:**
  - 2 cuentas (Ahorro DOP, Plazo Fijo USD)
  - 2 tarjetas (Visa Débito, American Express)
  - 1 préstamo (Hipotecario)
  - Balance total: RD$89,234.75 + US$15,000

#### 👤 Carlos Martínez López
- **Email:** carlos.martinez@email.com
- **PIN:** 9999
- **Cédula:** 001-5555555-5
- **Tiene:**
  - 1 cuenta (Ahorro)
  - 1 tarjeta (Mastercard Débito)
  - 1 préstamo (Personal)
  - Balance total: RD$234,567.80

---

## 📚 Documentación

### Para Empezar
1. **[DEMO_GUIDE.md](DEMO_GUIDE.md)** - Guía completa del proyecto demo
2. **[NEXT_STEPS.md](NEXT_STEPS.md)** - Plan de desarrollo paso a paso

### Para Desarrollar
3. **[IMPLEMENTATION_EXAMPLE.dart](IMPLEMENTATION_EXAMPLE.dart)** - Código de ejemplo completo
4. **[MOCK_DATA_README.md](MOCK_DATA_README.md)** - Cómo usar los datos mock

### Para Entender
5. **[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)** - Arquitectura del proyecto
6. **[PROJECT_SETUP_COMPLETE.md](PROJECT_SETUP_COMPLETE.md)** - Setup completo

---

## 🔧 Cómo Usar Mock Data

### Servicio Centralizado

```dart
import 'package:banco_ademi/core/data/mock_data_service.dart';

// Obtener usuarios
final users = MockDataService.instance.getUsers();

// Obtener cuentas de un usuario
final accounts = MockDataService.instance.getAccountsByUserId('user_001');

// Obtener transacciones de una cuenta
final transactions = MockDataService.instance
    .getTransactionsByAccountId('acc_001');

// Obtener tarjetas de un usuario
final cards = MockDataService.instance.getCardsByUserId('user_001');
```

### En DataSources

```dart
class AccountMockDataSource {
  Future<List<AccountModel>> getAccounts(String userId) async {
    // 1. Simular latencia de red
    await Future.delayed(const Duration(milliseconds: 800));
    
    // 2. Obtener datos del servicio mock
    final accountsJson = MockDataService.instance
        .getAccountsByUserId(userId);
    
    // 3. Convertir a modelos
    return accountsJson
        .map((json) => AccountModel.fromJson(json))
        .toList();
  }
}
```

---

## 🎯 Features del Proyecto

### ✅ Implementado (Estructura)
- [x] Clean Architecture completa
- [x] Configuración de proyecto
- [x] Datos mockeados (8 archivos JSON)
- [x] Servicio de mock data
- [x] Sistema de routing
- [x] Sistema de theming
- [x] Utilidades (formatters, validators, logger)

### 📋 Por Implementar (UI + Lógica)
- [ ] Authentication (login, biométrico, OTP)
- [ ] Home/Dashboard
- [ ] Gestión de Cuentas
- [ ] Gestión de Tarjetas
- [ ] Transferencias
- [ ] Pagos de Servicios
- [ ] Préstamos
- [ ] Inversiones
- [ ] Perfil de Usuario
- [ ] Notificaciones

---

## 🏗️ Arquitectura

### Clean Architecture (3 Capas)

```
┌─────────────────────────────────────────┐
│         PRESENTATION LAYER              │
│   (BLoC, Pages, Widgets)               │
│   - No conoce detalles de datos        │
└─────────────────────────────────────────┘
              ▼
┌─────────────────────────────────────────┐
│          DOMAIN LAYER                   │
│   (Entities, UseCases, Repositories)   │
│   - Lógica de negocio pura             │
└─────────────────────────────────────────┘
              ▼
┌─────────────────────────────────────────┐
│           DATA LAYER                    │
│   (Models, DataSources, Repositories)  │
│   - Datos mock desde JSON              │
└─────────────────────────────────────────┘
```

### Flujo de Datos

```
JSON Mock → MockDataService → DataSource → Repository 
  → UseCase → BLoC → UI
```

---

## 💡 Ventajas de este Approach

### ✅ Para Desarrollo
- Desarrollo sin dependencia de backend
- Datos consistentes y predecibles
- Testing simplificado
- Iteración rápida

### ✅ Para Demos
- Funciona completamente offline
- Siempre muestra los mismos datos
- No hay sorpresas ni errores de red
- Perfecto para presentaciones

### ✅ Para Arquitectura
- Clean Architecture real
- Fácil migrar a APIs reales
- Código de dominio y presentación no cambia
- Solo se reemplaza DataSource

---

## 🔄 Migración a Producción (Futuro)

Cuando quieras conectar con APIs reales:

1. **Mantén** toda la estructura actual
2. **Reemplaza** MockDataSource con RemoteDataSource (Dio/Retrofit)
3. **Implementa** LocalDataSource (Hive/SQLite) para caché
4. **NO cambies** Repository, UseCase, BLoC, UI
5. **Mantén** mocks para testing

```dart
// ANTES (Mock)
class AccountMockDataSource implements AccountDataSource {
  Future<List<AccountModel>> getAccounts(String userId) async {
    await Future.delayed(Duration(milliseconds: 800));
    return MockDataService.instance.getAccountsByUserId(userId);
  }
}

// DESPUÉS (Real)
@LazySingleton(as: AccountDataSource)
class AccountRemoteDataSource implements AccountDataSource {
  final Dio dio;
  
  Future<List<AccountModel>> getAccounts(String userId) async {
    final response = await dio.get('/api/v1/accounts?userId=$userId');
    return response.data.map((json) => AccountModel.fromJson(json)).toList();
  }
}
```

---

## 📝 Plan de Desarrollo

### Semana 1-2: Autenticación + Home
- Login con email/PIN
- Validación OTP (mock)
- Biométrico (opcional)
- Dashboard principal

### Semana 2-3: Productos Bancarios
- Lista de cuentas
- Detalle de cuenta
- Lista de tarjetas
- Detalle de tarjeta

### Semana 3-4: Transacciones
- Transferencias entre cuentas
- Transferencias a beneficiarios
- Pagos de servicios
- Historial de movimientos

### Semana 4-5: Créditos e Inversiones
- Lista de préstamos
- Detalle y amortización
- Portafolio de inversiones
- Simuladores

### Semana 5-6: Perfil y Ajustes
- Información personal
- Configuraciones
- Notificaciones
- Soporte

**📖 Ver plan detallado en [NEXT_STEPS.md](NEXT_STEPS.md)**

---

## 🛠️ Comandos Útiles

```bash
# Instalar dependencias
flutter pub get

# Generar código (models, DI, etc.)
flutter pub run build_runner build --delete-conflicting-outputs

# Analizar código
flutter analyze

# Ejecutar app
flutter run

# Ejecutar en web
flutter run -d chrome

# Limpiar y reconstruir
flutter clean && flutter pub get && flutter pub run build_runner build

# Ver logs filtrados
flutter run | grep "Mock data"
```

---

## 🧪 Testing

```bash
# Unit tests
flutter test

# Widget tests
flutter test test/features/accounts/presentation/widgets/

# Integration tests (cuando estén implementados)
flutter test integration_test/
```

---

## 📱 Plataformas Soportadas

- ✅ iOS
- ✅ Android
- ✅ Web
- ⚠️ macOS/Windows/Linux (no testeado aún)

---

## 🎨 Personalización

### Cambiar Colores

Edita [lib/core/theme/app_colors.dart](lib/core/theme/app_colors.dart):

```dart
static const Color primary = Color(0xFF2E7D32); // Tu color aquí
```

### Agregar Más Datos Mock

Edita los JSON en `assets/mock_data/`:

```json
// assets/mock_data/accounts.json
{
  "accounts": [
    {
      "id": "acc_NEW",
      "userId": "user_001",
      // ... más campos
    }
  ]
}
```

Luego haz **restart** (no hot reload):

```bash
r  # En consola de Flutter
```

---

## ❓ Preguntas Frecuentes

**Q: ¿Dónde están los datos?**  
A: En `assets/mock_data/*.json`

**Q: ¿Cómo cambio los datos?**  
A: Edita los JSON y haz restart (r)

**Q: ¿Los cambios persisten?**  
A: No, cada restart resetea a los datos originales

**Q: ¿Puedo agregar más usuarios?**  
A: Sí, edita `users.json` y crea sus cuentas/tarjetas

**Q: ¿Cómo simulo errores?**  
A: En el DataSource lanza excepciones

**Q: ¿Esto funciona offline?**  
A: Sí, 100% offline

**Q: ¿Puedo usarlo en producción?**  
A: No, es solo demo. Para producción usa APIs reales

---

## 📞 Soporte

- **Issues técnicos:** Revisa [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- **Guía de implementación:** Ver [IMPLEMENTATION_EXAMPLE.dart](IMPLEMENTATION_EXAMPLE.dart)
- **Plan de desarrollo:** Seguir [NEXT_STEPS.md](NEXT_STEPS.md)

---

## 📄 Licencia

Este es un proyecto de demostración. Ajusta según tus necesidades.

---

## 🎯 Resumen

Este proyecto te da:

✅ **Estructura completa** de Clean Architecture  
✅ **Datos realistas** de 3 usuarios con cuentas, tarjetas, préstamos  
✅ **Servicio mock** centralizado fácil de usar  
✅ **Ejemplos completos** de implementación  
✅ **Plan de desarrollo** detallado para 6 semanas  
✅ **Base sólida** para presentaciones y demos  

**🚀 Empieza con Authentication y construye feature por feature siguiendo [NEXT_STEPS.md](NEXT_STEPS.md)**

---

**Última actualización:** Febrero 7, 2026  
**Versión:** 0.1.0 (Demo)
