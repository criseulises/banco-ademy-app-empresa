# 📊 Estructura de Datos Mock - Referencia Rápida

## 📁 Archivos JSON Disponibles

```
assets/mock_data/
├── users.json           # 3 usuarios
├── accounts.json        # 6 cuentas
├── cards.json           # 5 tarjetas
├── transactions.json    # 10 transacciones
├── loans.json           # 4 préstamos
├── investments.json     # 5 inversiones
├── beneficiaries.json   # 6 beneficiarios
└── notifications.json   # 10 notificaciones
```

---

## 👥 users.json

### Estructura
```json
{
  "users": [
    {
      "id": "user_001",
      "documentId": "001-1234567-8",
      "documentType": "CEDULA",
      "firstName": "Juan",
      "lastName": "Pérez García",
      "email": "juan.perez@email.com",
      "phone": "(809) 555-1234",
      "dateOfBirth": "1985-03-15",
      "gender": "M",
      "address": {
        "street": "Av. Winston Churchill #45",
        "city": "Santo Domingo",
        "province": "Distrito Nacional",
        "postalCode": "10101",
        "country": "República Dominicana"
      },
      "profileImage": "https://i.pravatar.cc/150?u=user_001",
      "pin": "1234",
      "biometricEnabled": true,
      "twoFactorEnabled": true,
      "registeredAt": "2024-01-15T10:30:00Z",
      "lastLogin": "2026-02-07T08:15:00Z",
      "status": "ACTIVE",
      "deviceId": "device_001"
    }
  ]
}
```

### Campos Clave
| Campo | Tipo | Descripción |
|-------|------|-------------|
| id | string | ID único del usuario |
| email | string | Para login |
| pin | string | PIN de 4 dígitos |
| documentId | string | Cédula formateada |
| biometricEnabled | boolean | Si tiene biométrico activo |
| twoFactorEnabled | boolean | Si usa 2FA |

---

## 💰 accounts.json

### Estructura
```json
{
  "accounts": [
    {
      "id": "acc_001",
      "userId": "user_001",
      "accountNumber": "1001234567890",
      "accountType": "AHORRO",
      "currency": "DOP",
      "balance": 125450.50,
      "availableBalance": 125450.50,
      "holdBalance": 0.00,
      "status": "ACTIVE",
      "openedDate": "2024-01-15T10:30:00Z",
      "nickname": "Mi Cuenta de Ahorro",
      "isDefault": true,
      "interestRate": 3.5
    }
  ]
}
```

### Tipos de Cuenta
- `AHORRO` - Cuenta de ahorros
- `CORRIENTE` - Cuenta corriente
- `NOMINA` - Cuenta nómina
- `PLAZO_FIJO` - Depósito a plazo fijo

### Monedas
- `DOP` - Pesos dominicanos
- `USD` - Dólares estadounidenses

---

## 💳 cards.json

### Estructura
```json
{
  "cards": [
    {
      "id": "card_001",
      "userId": "user_001",
      "accountId": "acc_001",
      "cardNumber": "4532123456789012",
      "cardType": "DEBITO",
      "brand": "VISA",
      "holderName": "JUAN PEREZ GARCIA",
      "expiryDate": "12/28",
      "cvv": "123",
      "status": "ACTIVE",
      "issuedDate": "2024-02-01T10:00:00Z",
      "creditLimit": null,
      "availableCredit": null,
      "usedCredit": null,
      "nickname": "Visa Débito Principal",
      "isDefault": true,
      "contactless": true,
      "dailyLimit": 50000.00,
      "monthlyLimit": 500000.00,
      "internationalEnabled": true,
      "onlineEnabled": true
    }
  ]
}
```

### Tipos de Tarjeta
- `DEBITO` - Tarjeta de débito
- `CREDITO` - Tarjeta de crédito

### Marcas
- `VISA`
- `MASTERCARD`
- `AMEX`

### Campos Exclusivos de Crédito
```json
{
  "creditLimit": 200000.00,
  "availableCredit": 165432.50,
  "usedCredit": 34567.50,
  "minimumPayment": 8641.88,
  "totalDue": 34567.50,
  "dueDate": "2026-02-15",
  "rewardPoints": 3456
}
```

---

## 💸 transactions.json

### Estructura
```json
{
  "transactions": [
    {
      "id": "txn_001",
      "userId": "user_001",
      "accountId": "acc_001",
      "type": "TRANSFERENCIA_ENVIADA",
      "category": "TRANSFERENCIA",
      "amount": -5000.00,
      "currency": "DOP",
      "description": "Transferencia a María Rodríguez",
      "reference": "TRF20260207001",
      "date": "2026-02-07T08:30:00Z",
      "status": "COMPLETADA",
      "balance": 125450.50,
      "recipient": {
        "name": "María Rodríguez Santos",
        "accountNumber": "1009876543210"
      }
    }
  ]
}
```

### Tipos de Transacción
- `TRANSFERENCIA_ENVIADA` - Dinero enviado
- `TRANSFERENCIA_RECIBIDA` - Dinero recibido
- `DEPOSITO` - Depósito en efectivo
- `DEPOSITO_NOMINA` - Pago de nómina
- `RETIRO_ATM` - Retiro en cajero
- `COMPRA` - Compra con tarjeta
- `PAGO_SERVICIO` - Pago de servicio
- `PAGO_PRESTAMO` - Pago de préstamo

### Categorías
- `TRANSFERENCIA`
- `DEPOSITO`
- `RETIRO`
- `COMPRAS`
- `RESTAURANTES`
- `SERVICIOS`
- `NOMINA`
- `PRESTAMO`

### Campos Opcionales por Tipo
```json
// Para transferencias
"recipient": { "name": "...", "accountNumber": "..." }
"sender": { "name": "...", "accountNumber": "..." }

// Para pagos de servicio
"billerName": "EDESUR"
"contractNumber": "123456789"

// Para retiros ATM
"location": "ATM Av. Winston Churchill"
"atmId": "ATM001"

// Para compras
"merchant": "La Sirena Supermercado"
"cardId": "card_001"

// Para nómina
"employer": "Empresa XYZ, S.A."

// Para préstamos
"loanId": "loan_001"
```

---

## 🏦 loans.json

### Estructura
```json
{
  "loans": [
    {
      "id": "loan_001",
      "userId": "user_001",
      "loanType": "PERSONAL",
      "amount": 150000.00,
      "currency": "DOP",
      "disbursedAmount": 150000.00,
      "outstandingBalance": 98500.00,
      "interestRate": 18.5,
      "monthlyPayment": 8500.00,
      "totalPayments": 24,
      "paidPayments": 8,
      "remainingPayments": 16,
      "nextPaymentDate": "2026-03-01",
      "startDate": "2024-07-01",
      "endDate": "2026-06-01",
      "status": "ACTIVE",
      "purpose": "Consolidación de deudas",
      "guaranteeType": "FIADOR",
      "paymentDay": 1,
      "lastPaymentDate": "2026-02-01",
      "lastPaymentAmount": 8500.00
    }
  ]
}
```

### Tipos de Préstamo
- `PERSONAL` - Préstamo personal
- `VEHICULO` - Préstamo de vehículo
- `HIPOTECARIO` - Préstamo hipotecario

### Tipos de Garantía
- `FIADOR` - Con fiador
- `VEHICULO` - Garantizado con vehículo
- `HIPOTECA` - Garantizado con propiedad

### Campos Adicionales

**Para Vehículo:**
```json
"vehicleDetails": {
  "brand": "Toyota",
  "model": "Corolla",
  "year": 2024,
  "plate": "A123456"
}
```

**Para Hipotecario:**
```json
"propertyDetails": {
  "address": "Calle Principal #456",
  "city": "Santo Domingo",
  "province": "Distrito Nacional",
  "appraisalValue": 6000000.00
}
```

---

## 📈 investments.json

### Estructura
```json
{
  "investments": [
    {
      "id": "inv_001",
      "userId": "user_001",
      "investmentType": "FONDO_MUTUO",
      "name": "Fondo Conservador Ademi",
      "currency": "DOP",
      "initialAmount": 50000.00,
      "currentValue": 54250.00,
      "gainLoss": 4250.00,
      "gainLossPercentage": 8.5,
      "units": 542.50,
      "unitPrice": 100.00,
      "interestRate": 8.5,
      "startDate": "2025-02-01",
      "maturityDate": null,
      "status": "ACTIVE",
      "riskLevel": "BAJO",
      "lastUpdateDate": "2026-02-07",
      "isLiquid": true
    }
  ]
}
```

### Tipos de Inversión
- `FONDO_MUTUO` - Fondo mutuo
- `CERTIFICADO_INVERSION` - Certificado de inversión

### Niveles de Riesgo
- `BAJO` - Bajo riesgo
- `MEDIO` - Riesgo medio
- `ALTO` - Alto riesgo

### Campos Clave
| Campo | Descripción |
|-------|-------------|
| isLiquid | Si se puede retirar en cualquier momento |
| maturityDate | Fecha de vencimiento (null si no aplica) |
| gainLoss | Ganancia/pérdida en valor absoluto |
| gainLossPercentage | Ganancia/pérdida en porcentaje |

---

## 👥 beneficiaries.json

### Estructura
```json
{
  "beneficiaries": [
    {
      "id": "ben_001",
      "userId": "user_001",
      "type": "CUENTA_ADEMI",
      "name": "María Rodríguez Santos",
      "nickname": "María",
      "documentId": "001-9876543-2",
      "accountNumber": "1009876543210",
      "bankName": "Banco ADEMI",
      "bankCode": "ADEMI",
      "email": "maria.rodriguez@email.com",
      "phone": "(809) 555-5678",
      "addedDate": "2024-03-15T10:00:00Z",
      "isFavorite": true,
      "lastTransactionDate": "2026-02-07T08:30:00Z"
    }
  ]
}
```

### Tipos de Beneficiario
- `CUENTA_ADEMI` - Cuenta del mismo banco
- `OTRA_CUENTA` - Cuenta de otro banco
- `SERVICIO` - Proveedor de servicio

### Para Servicios
```json
{
  "type": "SERVICIO",
  "name": "EDESUR",
  "nickname": "Electricidad",
  "serviceType": "ELECTRICIDAD",
  "contractNumber": "123456789",
  "serviceProvider": "EDESUR"
}
```

### Tipos de Servicio
- `ELECTRICIDAD`
- `TELEFONIA`
- `AGUA`
- `CABLE`
- `INTERNET`

---

## 🔔 notifications.json

### Estructura
```json
{
  "notifications": [
    {
      "id": "notif_001",
      "userId": "user_001",
      "type": "TRANSACCION",
      "title": "Transferencia enviada",
      "message": "Has enviado RD$5,000.00 a María Rodríguez Santos",
      "date": "2026-02-07T08:30:00Z",
      "isRead": false,
      "priority": "NORMAL",
      "icon": "transfer",
      "actionUrl": "/transactions/txn_001"
    }
  ]
}
```

### Tipos de Notificación
- `TRANSACCION` - Transacción realizada
- `DEPOSITO` - Depósito recibido
- `PAGO` - Pago exitoso
- `RETIRO` - Retiro realizado
- `TARJETA` - Relacionado con tarjetas
- `ALERTA` - Alerta importante
- `SEGURIDAD` - Relacionado con seguridad
- `PROMOCION` - Oferta o promoción
- `COMPRA` - Compra realizada

### Prioridades
- `LOW` - Baja
- `NORMAL` - Normal
- `HIGH` - Alta

### Iconos Sugeridos
- `transfer` - Transferencias
- `deposit` - Depósitos
- `payment` - Pagos
- `atm` - Cajeros
- `card` - Tarjetas
- `security` - Seguridad
- `promotion` - Promociones
- `alert` - Alertas
- `shopping` - Compras

---

## 🔗 Relaciones Entre Entidades

```
USER (user_001)
  │
  ├─► ACCOUNTS (acc_001, acc_002, acc_003)
  │     └─► TRANSACTIONS (txn_001, txn_002, ...)
  │
  ├─► CARDS (card_001, card_002)
  │     └─► TRANSACTIONS (compras con tarjeta)
  │
  ├─► LOANS (loan_001, loan_002)
  │     └─► TRANSACTIONS (pagos de préstamo)
  │
  ├─► INVESTMENTS (inv_001)
  │
  ├─► BENEFICIARIES (ben_001, ben_002, ...)
  │
  └─► NOTIFICATIONS (notif_001, notif_002, ...)
```

---

## 📝 Notas de Implementación

### IDs
- Usa formato `{tipo}_{número}` (ej: `user_001`, `acc_001`)
- IDs son strings, no números
- Mantén consistencia en el formato

### Fechas
- Formato ISO 8601: `"2026-02-07T08:30:00Z"`
- Usa zona horaria UTC (Z al final)
- Para fechas sin hora: `"2026-02-07"`

### Montos
- Usa números con decimales: `125450.50`
- NO uses strings: ~~`"125450.50"`~~
- Montos negativos indican débito

### Booleanos
- Usa `true`/`false` (minúsculas)
- NO uses `"true"`/`"false"` (strings)

### Nulos
- Usa `null` para campos opcionales vacíos
- NO uses strings vacíos para números: ~~`""`~~

---

## 🔄 Agregar Nuevos Datos

### 1. Agregar Usuario
```json
// En users.json
{
  "id": "user_004",
  "documentId": "001-7777777-7",
  "firstName": "Nuevo",
  "lastName": "Usuario",
  "email": "nuevo@email.com",
  "pin": "7777",
  // ... resto de campos
}
```

### 2. Agregar Cuenta para Usuario
```json
// En accounts.json
{
  "id": "acc_007",
  "userId": "user_004",  // ← Link al usuario
  "accountNumber": "1007777777777",
  // ... resto de campos
}
```

### 3. Agregar Transacción para Cuenta
```json
// En transactions.json
{
  "id": "txn_011",
  "userId": "user_004",
  "accountId": "acc_007",  // ← Link a la cuenta
  // ... resto de campos
}
```

---

## ✅ Validaciones Recomendadas

### Números de Cuenta
- 13 dígitos
- Formato: `1001234567890`

### Cédulas
- 11 dígitos
- Formato: `001-1234567-8`

### Números de Tarjeta
- 16 dígitos para Visa/Mastercard
- 15 dígitos para Amex
- NO guardar en producción real

### Teléfonos
- Formato: `(809) 555-1234`
- 10 dígitos sin código de país

### Emails
- Formato estándar
- Validar con regex en UI

---

**💡 Tip:** Usa estos datos como referencia al crear modelos en tu código. Asegúrate de que los campos en tus `Model` classes coincidan exactamente con estos JSON.
