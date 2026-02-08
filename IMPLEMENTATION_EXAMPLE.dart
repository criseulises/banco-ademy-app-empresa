// EJEMPLO COMPLETO: Feature de Cuentas con Mock Data
// Este archivo muestra cómo implementar un feature completo usando datos mockeados

// ============================================================================
// 1. DATA LAYER - Model
// ============================================================================
// lib/features/accounts/data/models/account_model.dart

import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/account_entity.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final String id;
  final String userId;
  final String accountNumber;
  final String accountType;
  final String currency;
  final double balance;
  final double availableBalance;
  final double holdBalance;
  final String status;
  final String openedDate;
  final String nickname;
  final bool isDefault;
  final double interestRate;

  AccountModel({
    required this.id,
    required this.userId,
    required this.accountNumber,
    required this.accountType,
    required this.currency,
    required this.balance,
    required this.availableBalance,
    required this.holdBalance,
    required this.status,
    required this.openedDate,
    required this.nickname,
    required this.isDefault,
    required this.interestRate,
  });

  // JSON deserialization
  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  // JSON serialization
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  // Convertir a Entity (domain layer)
  AccountEntity toEntity() {
    return AccountEntity(
      id: id,
      userId: userId,
      accountNumber: accountNumber,
      accountType: accountType,
      currency: currency,
      balance: balance,
      availableBalance: availableBalance,
      holdBalance: holdBalance,
      status: status,
      openedDate: DateTime.parse(openedDate),
      nickname: nickname,
      isDefault: isDefault,
      interestRate: interestRate,
    );
  }
}

// ============================================================================
// 2. DATA LAYER - Mock Data Source
// ============================================================================
// lib/features/accounts/data/datasources/account_mock_data_source.dart

import 'package:injectable/injectable.dart';
import '../../../../core/data/mock_data_service.dart';
import '../models/account_model.dart';

abstract class AccountDataSource {
  Future<List<AccountModel>> getAccounts(String userId);
  Future<AccountModel> getAccountById(String accountId);
  Future<double> getAccountBalance(String accountId);
}

@LazySingleton(as: AccountDataSource)
class AccountMockDataSource implements AccountDataSource {
  @override
  Future<List<AccountModel>> getAccounts(String userId) async {
    // Simular latencia de red (300-800ms es realista)
    await Future.delayed(const Duration(milliseconds: 650));

    // Obtener datos del servicio mock
    final accountsJson = MockDataService.instance.getAccountsByUserId(userId);

    // Convertir JSON a modelos
    return accountsJson
        .map((json) => AccountModel.fromJson(json))
        .toList();
  }

  @override
  Future<AccountModel> getAccountById(String accountId) async {
    await Future.delayed(const Duration(milliseconds: 450));

    final accountJson = MockDataService.instance.getAccountById(accountId);

    if (accountJson == null) {
      throw Exception('Cuenta no encontrada');
    }

    return AccountModel.fromJson(accountJson);
  }

  @override
  Future<double> getAccountBalance(String accountId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final accountJson = MockDataService.instance.getAccountById(accountId);

    if (accountJson == null) {
      throw Exception('Cuenta no encontrada');
    }

    return accountJson['availableBalance'] as double;
  }
}

// ============================================================================
// 3. DATA LAYER - Repository Implementation
// ============================================================================
// lib/features/accounts/data/repositories/account_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/account_mock_data_source.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl implements AccountRepository {
  final AccountDataSource dataSource;

  AccountRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<AccountEntity>>> getAccounts(
    String userId,
  ) async {
    try {
      final accounts = await dataSource.getAccounts(userId);
      final entities = accounts.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on ServerException {
      return Left(ServerFailure(message: 'Error al cargar cuentas'));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> getAccountById(
    String accountId,
  ) async {
    try {
      final account = await dataSource.getAccountById(accountId);
      return Right(account.toEntity());
    } on ServerException {
      return Left(ServerFailure(message: 'Error al cargar cuenta'));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, double>> getAccountBalance(String accountId) async {
    try {
      final balance = await dataSource.getAccountBalance(accountId);
      return Right(balance);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

// ============================================================================
// 4. DOMAIN LAYER - Entity
// ============================================================================
// lib/features/accounts/domain/entities/account_entity.dart

import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String id;
  final String userId;
  final String accountNumber;
  final String accountType;
  final String currency;
  final double balance;
  final double availableBalance;
  final double holdBalance;
  final String status;
  final DateTime openedDate;
  final String nickname;
  final bool isDefault;
  final double interestRate;

  const AccountEntity({
    required this.id,
    required this.userId,
    required this.accountNumber,
    required this.accountType,
    required this.currency,
    required this.balance,
    required this.availableBalance,
    required this.holdBalance,
    required this.status,
    required this.openedDate,
    required this.nickname,
    required this.isDefault,
    required this.interestRate,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        accountNumber,
        accountType,
        currency,
        balance,
        availableBalance,
        holdBalance,
        status,
        openedDate,
        nickname,
        isDefault,
        interestRate,
      ];
}

// ============================================================================
// 5. DOMAIN LAYER - Repository Interface
// ============================================================================
// lib/features/accounts/domain/repositories/account_repository.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/account_entity.dart';

abstract class AccountRepository {
  Future<Either<Failure, List<AccountEntity>>> getAccounts(String userId);
  Future<Either<Failure, AccountEntity>> getAccountById(String accountId);
  Future<Either<Failure, double>> getAccountBalance(String accountId);
}

// ============================================================================
// 6. DOMAIN LAYER - Use Case
// ============================================================================
// lib/features/accounts/domain/usecases/get_accounts_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/account_entity.dart';
import '../repositories/account_repository.dart';

@lazySingleton
class GetAccountsUseCase {
  final AccountRepository repository;

  GetAccountsUseCase(this.repository);

  Future<Either<Failure, List<AccountEntity>>> call(String userId) {
    return repository.getAccounts(userId);
  }
}

// ============================================================================
// 7. PRESENTATION LAYER - BLoC Events
// ============================================================================
// lib/features/accounts/presentation/bloc/account_event.dart

part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object?> get props => [];
}

class LoadAccountsEvent extends AccountEvent {
  final String userId;

  const LoadAccountsEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

class LoadAccountByIdEvent extends AccountEvent {
  final String accountId;

  const LoadAccountByIdEvent(this.accountId);

  @override
  List<Object?> get props => [accountId];
}

class RefreshAccountsEvent extends AccountEvent {
  final String userId;

  const RefreshAccountsEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

// ============================================================================
// 8. PRESENTATION LAYER - BLoC States
// ============================================================================
// lib/features/accounts/presentation/bloc/account_state.dart

part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object?> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountsLoaded extends AccountState {
  final List<AccountEntity> accounts;

  const AccountsLoaded(this.accounts);

  @override
  List<Object?> get props => [accounts];
}

class AccountLoaded extends AccountState {
  final AccountEntity account;

  const AccountLoaded(this.account);

  @override
  List<Object?> get props => [account];
}

class AccountError extends AccountState {
  final String message;

  const AccountError(this.message);

  @override
  List<Object?> get props => [message];
}

// ============================================================================
// 9. PRESENTATION LAYER - BLoC
// ============================================================================
// lib/features/accounts/presentation/bloc/account_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/usecases/get_accounts_usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetAccountsUseCase getAccountsUseCase;

  AccountBloc(this.getAccountsUseCase) : super(AccountInitial()) {
    on<LoadAccountsEvent>(_onLoadAccounts);
    on<RefreshAccountsEvent>(_onRefreshAccounts);
  }

  Future<void> _onLoadAccounts(
    LoadAccountsEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());

    final result = await getAccountsUseCase(event.userId);

    result.fold(
      (failure) => emit(AccountError(failure.message)),
      (accounts) => emit(AccountsLoaded(accounts)),
    );
  }

  Future<void> _onRefreshAccounts(
    RefreshAccountsEvent event,
    Emitter<AccountState> emit,
  ) async {
    // No mostrar loading para refresh
    final result = await getAccountsUseCase(event.userId);

    result.fold(
      (failure) => emit(AccountError(failure.message)),
      (accounts) => emit(AccountsLoaded(accounts)),
    );
  }
}

// ============================================================================
// 10. PRESENTATION LAYER - UI Page
// ============================================================================
// lib/features/accounts/presentation/pages/accounts_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/formatters.dart';
import '../bloc/account_bloc.dart';
import '../widgets/account_card.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccountBloc>()
        ..add(const LoadAccountsEvent('user_001')), // Usuario demo
      child: const AccountsView(),
    );
  }
}

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Cuentas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<AccountBloc>().add(
                    const RefreshAccountsEvent('user_001'),
                  );
            },
          ),
        ],
      ),
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          if (state is AccountLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AccountError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AccountBloc>().add(
                            const LoadAccountsEvent('user_001'),
                          );
                    },
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          if (state is AccountsLoaded) {
            if (state.accounts.isEmpty) {
              return const Center(
                child: Text('No tienes cuentas registradas'),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<AccountBloc>().add(
                      const RefreshAccountsEvent('user_001'),
                    );
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.accounts.length,
                itemBuilder: (context, index) {
                  final account = state.accounts[index];
                  return AccountCard(account: account);
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

// ============================================================================
// 11. PRESENTATION LAYER - Widget
// ============================================================================
// lib/features/accounts/presentation/widgets/account_card.dart

import 'package:flutter/material.dart';
import '../../../../core/utils/formatters.dart';
import '../../domain/entities/account_entity.dart';

class AccountCard extends StatelessWidget {
  final AccountEntity account;

  const AccountCard({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  account.nickname,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (account.isDefault)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Principal',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              Formatters.formatAccountNumber(account.accountNumber),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              account.accountType.replaceAll('_', ' '),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance Disponible',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      Formatters.formatCurrency(
                        account.availableBalance,
                        currencySymbol: account.currency == 'USD'
                            ? 'US\$'
                            : 'RD\$',
                      ),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
============================================================================
RESUMEN DE IMPLEMENTACIÓN CON MOCK DATA
============================================================================

1. ✅ Model: Define estructura que coincide con JSON mock
2. ✅ DataSource: Lee de MockDataService y simula delays
3. ✅ Repository: Convierte modelos a entidades, maneja errores
4. ✅ UseCase: Define casos de uso de negocio
5. ✅ BLoC: Gestiona estados, no cambia vs implementación real
6. ✅ UI: Muestra datos, no cambia vs implementación real

VENTAJAS:
- Domain y Presentation NO saben que es mock data
- Fácil migrar a APIs reales: solo cambiar DataSource
- Testing simplificado con datos controlados
- Desarrollo independiente sin backend

PATRÓN PARA TODOS LOS FEATURES:
- Mismo approach para: Cards, Transactions, Loans, Investments, etc.
- Reutiliza MockDataService
- Simula delays realistas (300-800ms)
- Convierte JSON → Model → Entity

============================================================================
*/
