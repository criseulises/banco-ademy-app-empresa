import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/common_bottom_nav.dart';

/// Transactions page - Transacciones
class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildOptionCard(
              icon: 'resources/tabler-icon-file-transfer.svg',
              label: 'Transferir',
              onTap: () => context.push('/transfers'),
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/tabler-icon-file-pay.svg',
              label: 'Pagar',
              onTap: () => context.push('/payments'),
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/tabler-icon-transaction-dollar.svg',
              label: 'Cambio de Divisas',
              onTap: () => context.push('/currency-exchange'),
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/tabler-icon-moneybag.svg',
              label: 'Desembolsos',
              onTap: () => context.push('/disbursements'),
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/tabler-icon-calendar-time.svg',
              label: 'Agendar',
              onTap: () => context.push('/scheduled'),
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/tabler-icon-file-time.svg',
              label: 'Hist\u00f3rico de movimientos',
              onTap: () => context.push('/transactions/history'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CommonBottomNav(selectedIndex: 1),
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
              Image.asset(
                'resources/logo_ademi_blanco.png',
                height: 45,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              const Text(
                'Transacciones',
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

  Widget _buildOptionCard({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 28,
              height: 28,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
