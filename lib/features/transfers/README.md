# Transfers Feature

## Overview
Handle money transfers between accounts (own, internal, ACH, LBTR).

## Key Features
- Own account transfers
- Internal bank transfers
- ACH transfers
- LBTR transfers
- Scheduled/recurring transfers
- Beneficiary management
- Transfer history

## Files to Create
### Data Layer
- transfers_remote_datasource.dart
- transfer_model.dart
- beneficiary_model.dart
- scheduled_transfer_model.dart

### Domain Layer
- transfer_entity.dart
- beneficiary_entity.dart
- create_own_transfer_usecase.dart
- create_internal_transfer_usecase.dart
- create_ach_transfer_usecase.dart
- create_lbtr_transfer_usecase.dart
- schedule_transfer_usecase.dart
- add_beneficiary_usecase.dart
- get_beneficiaries_usecase.dart

### Presentation Layer
- transfers_bloc.dart
- transfer_type_selection_page.dart
- own_transfer_page.dart
- internal_transfer_page.dart
- ach_transfer_page.dart
- transfer_confirmation_page.dart
- transfer_receipt_page.dart
- beneficiaries_page.dart
- add_beneficiary_page.dart
