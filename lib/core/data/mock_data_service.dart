import 'dart:convert';
import 'package:flutter/services.dart';

/// Service for loading and managing mock data from JSON files
/// This is used for demo purposes - NO REAL DATABASE OR API
class MockDataService {
  MockDataService._();

  static final MockDataService instance = MockDataService._();

  // Cached data
  Map<String, dynamic>? _users;
  Map<String, dynamic>? _accounts;
  Map<String, dynamic>? _cards;
  Map<String, dynamic>? _transactions;
  Map<String, dynamic>? _loans;
  Map<String, dynamic>? _investments;
  Map<String, dynamic>? _beneficiaries;
  Map<String, dynamic>? _notifications;

  /// Initialize mock data service and preload all data
  Future<void> init() async {
    await Future.wait([
      _loadUsers(),
      _loadAccounts(),
      _loadCards(),
      _loadTransactions(),
      _loadLoans(),
      _loadInvestments(),
      _loadBeneficiaries(),
      _loadNotifications(),
    ]);
  }

  // USERS
  Future<void> _loadUsers() async {
    final jsonString = await rootBundle.loadString('assets/mock_data/users.json');
    _users = json.decode(jsonString) as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getUsers() {
    return List<Map<String, dynamic>>.from(_users?['users'] ?? []);
  }

  Map<String, dynamic>? getUserById(String id) {
    final users = getUsers();
    return users.firstWhere(
      (user) => user['id'] == id,
      orElse: () => {},
    );
  }

  Map<String, dynamic>? getUserByEmail(String email) {
    final users = getUsers();
    try {
      return users.firstWhere(
        (user) => user['email'] == email,
      );
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? getUserByDocumentId(String documentId) {
    final users = getUsers();
    try {
      return users.firstWhere(
        (user) => user['documentId'] == documentId,
      );
    } catch (e) {
      return null;
    }
  }

  // ACCOUNTS
  Future<void> _loadAccounts() async {
    final jsonString = await rootBundle.loadString('assets/mock_data/accounts.json');
    _accounts = json.decode(jsonString) as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getAccounts() {
    return List<Map<String, dynamic>>.from(_accounts?['accounts'] ?? []);
  }

  List<Map<String, dynamic>> getAccountsByUserId(String userId) {
    final accounts = getAccounts();
    return accounts.where((account) => account['userId'] == userId).toList();
  }

  Map<String, dynamic>? getAccountById(String id) {
    final accounts = getAccounts();
    try {
      return accounts.firstWhere((account) => account['id'] == id);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? getAccountByNumber(String accountNumber) {
    final accounts = getAccounts();
    try {
      return accounts.firstWhere(
        (account) => account['accountNumber'] == accountNumber,
      );
    } catch (e) {
      return null;
    }
  }

  // CARDS
  Future<void> _loadCards() async {
    final jsonString = await rootBundle.loadString('assets/mock_data/cards.json');
    _cards = json.decode(jsonString) as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getCards() {
    return List<Map<String, dynamic>>.from(_cards?['cards'] ?? []);
  }

  List<Map<String, dynamic>> getCardsByUserId(String userId) {
    final cards = getCards();
    return cards.where((card) => card['userId'] == userId).toList();
  }

  Map<String, dynamic>? getCardById(String id) {
    final cards = getCards();
    try {
      return cards.firstWhere((card) => card['id'] == id);
    } catch (e) {
      return null;
    }
  }

  // TRANSACTIONS
  Future<void> _loadTransactions() async {
    final jsonString = await rootBundle.loadString('assets/mock_data/transactions.json');
    _transactions = json.decode(jsonString) as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getTransactions() {
    return List<Map<String, dynamic>>.from(_transactions?['transactions'] ?? []);
  }

  List<Map<String, dynamic>> getTransactionsByUserId(String userId) {
    final transactions = getTransactions();
    return transactions.where((txn) => txn['userId'] == userId).toList();
  }

  List<Map<String, dynamic>> getTransactionsByAccountId(String accountId) {
    final transactions = getTransactions();
    return transactions.where((txn) => txn['accountId'] == accountId).toList();
  }

  Map<String, dynamic>? getTransactionById(String id) {
    final transactions = getTransactions();
    try {
      return transactions.firstWhere((txn) => txn['id'] == id);
    } catch (e) {
      return null;
    }
  }

  // LOANS
  Future<void> _loadLoans() async {
    final jsonString = await rootBundle.loadString('assets/mock_data/loans.json');
    _loans = json.decode(jsonString) as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getLoans() {
    return List<Map<String, dynamic>>.from(_loans?['loans'] ?? []);
  }

  List<Map<String, dynamic>> getLoansByUserId(String userId) {
    final loans = getLoans();
    return loans.where((loan) => loan['userId'] == userId).toList();
  }

  Map<String, dynamic>? getLoanById(String id) {
    final loans = getLoans();
    try {
      return loans.firstWhere((loan) => loan['id'] == id);
    } catch (e) {
      return null;
    }
  }

  // INVESTMENTS
  Future<void> _loadInvestments() async {
    final jsonString = await rootBundle.loadString('assets/mock_data/investments.json');
    _investments = json.decode(jsonString) as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getInvestments() {
    return List<Map<String, dynamic>>.from(_investments?['investments'] ?? []);
  }

  List<Map<String, dynamic>> getInvestmentsByUserId(String userId) {
    final investments = getInvestments();
    return investments.where((inv) => inv['userId'] == userId).toList();
  }

  Map<String, dynamic>? getInvestmentById(String id) {
    final investments = getInvestments();
    try {
      return investments.firstWhere((inv) => inv['id'] == id);
    } catch (e) {
      return null;
    }
  }

  // BENEFICIARIES
  Future<void> _loadBeneficiaries() async {
    final jsonString = await rootBundle.loadString('assets/mock_data/beneficiaries.json');
    _beneficiaries = json.decode(jsonString) as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getBeneficiaries() {
    return List<Map<String, dynamic>>.from(_beneficiaries?['beneficiaries'] ?? []);
  }

  List<Map<String, dynamic>> getBeneficiariesByUserId(String userId) {
    final beneficiaries = getBeneficiaries();
    return beneficiaries.where((ben) => ben['userId'] == userId).toList();
  }

  Map<String, dynamic>? getBeneficiaryById(String id) {
    final beneficiaries = getBeneficiaries();
    try {
      return beneficiaries.firstWhere((ben) => ben['id'] == id);
    } catch (e) {
      return null;
    }
  }

  // NOTIFICATIONS
  Future<void> _loadNotifications() async {
    final jsonString = await rootBundle.loadString('assets/mock_data/notifications.json');
    _notifications = json.decode(jsonString) as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getNotifications() {
    return List<Map<String, dynamic>>.from(_notifications?['notifications'] ?? []);
  }

  List<Map<String, dynamic>> getNotificationsByUserId(String userId) {
    final notifications = getNotifications();
    return notifications.where((notif) => notif['userId'] == userId).toList();
  }

  List<Map<String, dynamic>> getUnreadNotificationsByUserId(String userId) {
    final notifications = getNotificationsByUserId(userId);
    return notifications.where((notif) => notif['isRead'] == false).toList();
  }

  Map<String, dynamic>? getNotificationById(String id) {
    final notifications = getNotifications();
    try {
      return notifications.firstWhere((notif) => notif['id'] == id);
    } catch (e) {
      return null;
    }
  }

  /// Clear all cached data (useful for testing or reload)
  void clearCache() {
    _users = null;
    _accounts = null;
    _cards = null;
    _transactions = null;
    _loans = null;
    _investments = null;
    _beneficiaries = null;
    _notifications = null;
  }
}
