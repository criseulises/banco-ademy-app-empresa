# Onboarding Feature

## Descripción
Este feature contiene las pantallas de onboarding (bienvenida) del usuario.

## Estructura

```
onboarding/
├── data/                    # Data layer
├── domain/                  # Domain layer (entities, use cases, repositories)
├── presentation/
│   ├── pages/              # Pantallas principales
│   │   └── onboarding_1_page.dart     # Pantalla 1: Bienvenida
│   └── widgets/            # Widgets reutilizables
└── README.md               # Este archivo
```

## Pantallas

### Onboarding 1 - Bienvenida
- **Archivo**: `presentation/pages/onboarding_1_page.dart`
- **Descripción**: Primera pantalla de onboarding con:
  - Logo Ademi
  - Mensaje de bienvenida
  - Botón "Empecemos" para continuar
  - Enlace para usuarios existentes: "¿Ya tienes una cuenta?"

## Cómo usar

```dart
import 'features/onboarding/presentation/pages/onboarding_1_page.dart';

// En tu router:
GoRoute(
  path: '/onboarding-1',
  builder: (context, state) => const Onboarding1Page(),
)
```

## Assets utilizados
- `assets/images/logo_ademi.png` - Logo de Ademi

## Requisitos
- Flutter 3.x+
- go_router para navegación
- Tema de app configurado (AppColors, AppTextStyles, AppDimensions)

## Próximos pasos
- [ ] Crear Onboarding 2
- [ ] Crear Onboarding 3
- [ ] Crear pantalla de registro
- [ ] Crear pantalla de login
- [ ] Integrar animaciones
