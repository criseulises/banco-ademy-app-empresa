# Accounts Feature

## Overview
Manage user bank accounts, view balances, transactions, and statements.

## Key Features
- List all accounts
- View account details
- Check balance
- View transaction history
- Download account statements (PDF/Excel)
- Account filters and search

## Files to Create
### Data Layer
- accounts_remote_datasource.dart
- accounts_local_datasource.dart
- account_model.dart
- transaction_model.dart
- statement_model.dart

### Domain Layer
- account_entity.dart
- transaction_entity.dart
- get_accounts_usecase.dart
- get_account_details_usecase.dart
- get_transactions_usecase.dart
- download_statement_usecase.dart

### Presentation Layer
- accounts_bloc.dart
- account_details_bloc.dart
- accounts_list_page.dart
- account_details_page.dart
- transactions_list_page.dart
- account_card_widget.dart
- transaction_item_widget.dart
