# Payments Feature

## Overview
Pay bills, services, and mobile top-ups.

## Key Features
- Service payments
- Bill payments
- Mobile top-ups
- Payment affiliations
- Scheduled payments
- Payment history

## Files to Create
### Data Layer
- payments_remote_datasource.dart
- payment_model.dart
- payment_service_model.dart
- affiliation_model.dart

### Domain Layer
- payment_entity.dart
- service_entity.dart
- get_payment_services_usecase.dart
- pay_bill_usecase.dart
- mobile_topup_usecase.dart
- create_affiliation_usecase.dart
- schedule_payment_usecase.dart

### Presentation Layer
- payments_bloc.dart
- payment_services_page.dart
- pay_bill_page.dart
- mobile_topup_page.dart
- payment_affiliations_page.dart
- payment_confirmation_page.dart
- payment_receipt_page.dart
