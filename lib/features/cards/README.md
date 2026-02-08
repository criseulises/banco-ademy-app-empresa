# Cards Feature

## Overview
Manage debit and credit cards including viewing, blocking, activating, and setting limits.

## Key Features
- List all cards
- View card details
- Block/unblock cards
- Activate new cards
- Set PIN
- Manage card limits
- View card transactions

## Files to Create
### Data Layer
- cards_remote_datasource.dart
- card_model.dart
- card_transaction_model.dart

### Domain Layer
- card_entity.dart
- get_cards_usecase.dart
- block_card_usecase.dart
- unblock_card_usecase.dart
- activate_card_usecase.dart
- set_card_pin_usecase.dart
- update_card_limits_usecase.dart

### Presentation Layer
- cards_bloc.dart
- card_management_bloc.dart
- cards_list_page.dart
- card_details_page.dart
- block_card_page.dart
- set_pin_page.dart
- card_limits_page.dart
- credit_card_widget.dart
