# Home/Dashboard Feature

## Overview
Main dashboard/home screen showing account summaries, quick actions, and recent transactions.

## Key Features
- Account balance summary
- Quick action buttons (transfer, pay, etc.)
- Recent transactions
- Notifications
- Promotions/offers
- Financial insights

## Files to Create
### Data Layer
- home_remote_datasource.dart
- home_repository_impl.dart
- dashboard_model.dart
- quick_action_model.dart

### Domain Layer
- dashboard_entity.dart
- get_dashboard_data_usecase.dart
- refresh_data_usecase.dart

### Presentation Layer
- home_bloc.dart (event, state)
- home_page.dart
- dashboard_widget.dart
- quick_actions_widget.dart
- recent_transactions_widget.dart
