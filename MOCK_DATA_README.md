# DEMO - Proyecto 100% Mockeado

⚠️ **IMPORTANTE: Este es un proyecto de DEMOSTRACIÓN**

- **NO** utiliza base de datos real
- **NO** hace llamadas a APIs reales
- **TODA** la información está en archivos JSON mockeados
- Los datos son completamente ficticios para propósitos de demo

## Datos Mockeados Disponibles

Toda la información de la aplicación está almacenada en archivos JSON en:

```
assets/mock_data/
├── users.json           # Usuarios de demo (3 usuarios)
├── accounts.json        # Cuentas bancarias
├── cards.json           # Tarjetas de débito/crédito
├── transactions.json    # Transacciones y movimientos
├── loans.json           # Préstamos
├── investments.json     # Inversiones
├── beneficiaries.json   # Beneficiarios guardados
└── notifications.json   # Notificaciones
```

## Usuarios de Demo

Puedes usar cualquiera de estos usuarios para probar la app:

### Usuario 1: Juan Pérez García
- **Email**: juan.perez@email.com
- **PIN**: 1234
- **Cédula**: 001-1234567-8
- **Cuentas**: 3 (Ahorro, Corriente, Nómina)
- **Tarjetas**: 2 (Visa Débito, Mastercard Crédito)
- **Préstamos**: 2 (Personal, Vehículo)

### Usuario 2: María Rodríguez Santos
- **Email**: maria.rodriguez@email.com
- **PIN**: 5678
- **Cédula**: 001-9876543-2
- **Cuentas**: 2 (Ahorro, Plazo Fijo USD)
- **Tarjetas**: 2 (Visa Débito, American Express)
- **Préstamos**: 1 (Hipotecario)

### Usuario 3: Carlos Martínez López
- **Email**: carlos.martinez@email.com
- **PIN**: 9999
- **Cédula**: 001-5555555-5
- **Cuentas**: 1 (Ahorro)
- **Tarjetas**: 1 (Mastercard Débito)
- **Préstamos**: 1 (Personal)

## Servicio de Datos Mock

El proyecto incluye `MockDataService` que carga y gestiona todos los datos:

```dart
// Inicializar en main.dart
await MockDataService.instance.init();

// Usar en cualquier lugar
final users = MockDataService.instance.getUsers();
final userAccounts = MockDataService.instance.getAccountsByUserId('user_001');
final userTransactions = MockDataService.instance.getTransactionsByUserId('user_001');
```

## Arquitectura Mock

En lugar de llamadas API reales, los `DataSource` deben:

1. Importar `MockDataService`
2. Leer datos de los métodos del servicio
3. Simular delays con `await Future.delayed(Duration(seconds: 1))`
4. Retornar los datos como si vinieran de una API

### Ejemplo de DataSource Mock

```dart
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  @override
  Future<List<AccountModel>> getAccounts(String userId) async {
    // Simular latencia de red
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Obtener datos mockeados
    final accountsJson = MockDataService.instance.getAccountsByUserId(userId);
    
    // Convertir a modelos
    return accountsJson.map((json) => AccountModel.fromJson(json)).toList();
  }
}
```

## Características de los Datos Mock

### Realismo
- Números de cuenta, tarjetas y cédulas válidos para RD
- Fechas recientes y coherentes
- Montos y balances realistas
- Transacciones relacionadas entre usuarios

### Variedad
- 3 tipos de cuentas (Ahorro, Corriente, Nómina, Plazo Fijo)
- 3 tipos de tarjetas (Débito, Crédito con Visa/Mastercard/Amex)
- 3 tipos de préstamos (Personal, Vehículo, Hipotecario)
- 2 tipos de inversiones (Fondos Mutuos, Certificados)
- Múltiples categorías de transacciones

### Relaciones
- Transacciones vinculadas entre usuarios (transferencias)
- Tarjetas vinculadas a cuentas
- Beneficiarios guardados
- Historial de transacciones por cuenta

## Modificar Datos Mock

Para agregar más datos de prueba:

1. Edita los archivos JSON en `assets/mock_data/`
2. Sigue el formato existente
3. Asegura coherencia en IDs y relaciones
4. Recarga la app (hot restart requerido para cambios en assets)

## Ventajas del Approach Mock

✅ Desarrollo rápido sin dependencia de backend  
✅ Testing sencillo con datos controlados  
✅ Demos consistentes y predecibles  
✅ No requiere conectividad  
✅ Fácil de modificar y extender  
✅ Ideal para presentaciones a stakeholders  

## Migración a Datos Reales (Futuro)

Cuando quieras conectar con APIs reales:

1. Implementa los métodos reales en los `DataSource`
2. Reemplaza `MockDataService` con llamadas HTTP (Dio)
3. El resto de la arquitectura (Repository, UseCase, BLoC) permanece igual
4. Mantén los mocks para testing

## Notas Importantes

- Los datos se cargan en memoria al iniciar la app
- No hay persistencia entre sesiones (cada restart resetea)
- No hay validaciones de negocio complejas
- Las "transacciones" no modifican balances (solo se muestran)
- Es **solo para demo visual**, no para lógica de negocio real

---

**Este proyecto demuestra la UI/UX y arquitectura, NO es un sistema bancario funcional**
