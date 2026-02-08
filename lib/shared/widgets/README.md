# Shared Widgets

This directory contains reusable UI components used across the entire application.

## Structure

```
shared/widgets/
├── buttons/          # Button components
├── inputs/           # Input field components
├── cards/            # Card components
├── dialogs/          # Dialog and modal components
└── loaders/          # Loading indicator components
```

## Components to Implement

### Buttons
- primary_button.dart
- secondary_button.dart
- text_button_custom.dart
- icon_button_custom.dart
- floating_action_button_custom.dart

### Inputs
- text_field_custom.dart
- password_field.dart
- search_field.dart
- dropdown_field.dart
- date_picker_field.dart
- amount_input_field.dart

### Cards
- account_card.dart
- transaction_card.dart
- credit_card_widget.dart
- info_card.dart
- action_card.dart

### Dialogs
- confirmation_dialog.dart
- error_dialog.dart
- success_dialog.dart
- loading_dialog.dart
- bottom_sheet_custom.dart

### Loaders
- circular_loader.dart
- linear_loader.dart
- shimmer_loader.dart
- skeleton_loader.dart

## Usage Example

```dart
import 'package:banco_ademi/shared/widgets/buttons/primary_button.dart';

PrimaryButton(
  text: 'Iniciar Sesión',
  onPressed: () => _handleLogin(),
  isLoading: state is LoginLoading,
)
```
