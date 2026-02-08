import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';

/// Account detail page - Detalle de cuenta
class AccountDetailPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String accountNumber;
  final String balance;

  const AccountDetailPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.accountNumber,
    required this.balance,
  });

  @override
  State<AccountDetailPage> createState() => _AccountDetailPageState();
}

class _AccountDetailPageState extends State<AccountDetailPage> {
  int _selectedBottomIndex = 0;
  String? _selectedMovementFilter; // null = todo

  // Mock data de movimientos
  final List<Map<String, dynamic>> _movements = [
    {
      'title': 'Depósito mensual',
      'date': '26 de junio, 2025',
      'amount': 'RD\$ 10,000.00',
      'type': 'credito',
    },
    {
      'title': 'Pago préstamo lavadora',
      'date': '26 de junio, 2025',
      'amount': '-RD\$ 3,204.63',
      'type': 'debito',
    },
    {
      'title': 'Depósito mensual',
      'date': '26 de mayo, 2025',
      'amount': 'RD\$ 10,000.00',
      'type': 'credito',
    },
    {
      'title': 'Depósito mensual',
      'date': '26 de abril, 2025',
      'amount': 'RD\$ 10,000.00',
      'type': 'credito',
    },
    {
      'title': 'Depósito mensual',
      'date': '26 de marzo, 2025',
      'amount': 'RD\$ 10,000.00',
      'type': 'credito',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // Información de la cuenta
            _buildAccountInfoCard(),

            const SizedBox(height: 24),

            // Acciones rápidas
            _buildActionButtons(),

            const SizedBox(height: 32),

            // Movimientos
            _buildMovementsSection(),

            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              // Logo
              Image.asset(
                'resources/logo_ademi_blanco.png',
                height: 45,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              // Título
              const Text(
                'Detalle de cuenta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInfoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título con icono
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SvgPicture.asset(
                  'resources/pig.svg',
                  width: 28,
                  height: 28,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Subtítulo
            Text(
              widget.subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 20),

            // Número de cuenta y balance
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.accountNumber,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
                Text(
                  widget.balance,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActionButton(
            icon: 'resources/tabler-icon-file-transfer.svg',
            label: 'Transferir',
            onTap: () {},
          ),
          _buildActionButton(
            icon: 'resources/tabler-icon-file-pay.svg',
            label: 'Pagar',
            onTap: () {},
          ),
          _buildActionButton(
            icon: 'resources/tabler-icon-file-document.svg',
            label: 'Estado',
            onTap: () {},
          ),
          _buildActionButton(
            icon: 'resources/tabler-icon-share-3.svg',
            label: 'Compartir',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 28,
                height: 28,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovementsSection() {
    // Filtrar movimientos
    final filteredMovements = _selectedMovementFilter == null
        ? _movements
        : _movements
            .where((m) => m['type'] == _selectedMovementFilter)
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título y filtros
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              const Text(
                'Movimientos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildMovementFilterChip(
                        label: 'Todo',
                        value: null,
                        icon: Icons.swap_vert,
                      ),
                      const SizedBox(width: 12),
                      _buildMovementFilterChip(
                        label: 'Cr\u00e9dito',
                        value: 'credito',
                        icon: Icons.trending_up,
                      ),
                      const SizedBox(width: 12),
                      _buildMovementFilterChip(
                        label: 'D\u00e9bito',
                        value: 'debito',
                        icon: Icons.trending_down,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Lista de movimientos
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: filteredMovements.map((movement) {
              final isCredit = movement['type'] == 'credito';
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildMovementItem(
                  title: movement['title'],
                  date: movement['date'],
                  amount: movement['amount'],
                  isCredit: isCredit,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMovementFilterChip({
    required String label,
    required String? value,
    required IconData icon,
  }) {
    final isSelected = _selectedMovementFilter == value;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedMovementFilter = value;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.secondary : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? AppColors.secondary : Colors.grey.shade600,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.secondary : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovementItem({
    required String title,
    required String date,
    required String amount,
    required bool isCredit,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Icono de movimiento
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isCredit
                  ? AppColors.primary.withOpacity(0.1)
                  : AppColors.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                isCredit ? Icons.trending_up : Icons.trending_down,
                size: 22,
                color: isCredit ? AppColors.primary : AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Título y fecha
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),

          // Monto
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isCredit ? AppColors.primary : AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(
                icon: 'resources/tabler-icon-wallet.svg',
                label: 'Mis productos',
                index: 0,
              ),
              _buildBottomNavItem(
                icon: 'resources/tabler-icon-arrows-exchange-2.svg',
                label: 'Transacciones',
                index: 1,
              ),
              _buildBottomNavItem(
                icon: 'resources/tabler-icon-category-plus.svg',
                label: 'Solicitudes',
                index: 2,
              ),
              _buildBottomNavItem(
                icon: 'resources/tabler-icon-stack-2.svg',
                label: 'Otras opciones',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required String icon,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedBottomIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedBottomIndex = index;
        });
        if (index == 0) {
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(label)),
          );
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primary : Colors.grey.shade500,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.primary : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
