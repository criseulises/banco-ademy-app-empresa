import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/common_bottom_nav.dart';

/// Payments page - Pagos
class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildOptionCard(
              icon: 'resources/tabler-icon-receipt-tax.svg',
              label: 'Pago de Impuestos y TSS',
              onTap: () => context.push('/payments/taxes'),
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/tabler-icon-credit-card.svg',
              label: 'Tarjetas de Crédito',
              onTap: () => context.push('/payments/card'),
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/tabler-icon-bulb.svg',
              label: 'Servicios y Facturas',
              onTap: () => context.push('/payments/service'),
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/loans.svg',
              label: 'Pagar Préstamo',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pagar préstamo...')),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/tabler-icon-users.svg',
              label: 'Empleados',
              onTap: () => context.push('/payments/employees'),
            ),
            
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: 'resources/tabler-icon-building-factory-2.svg',
              label: 'Suplidores',
              onTap: () => context.push('/payments/suppliers'),
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
                'Pagos',
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 32,
              height: 32,
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
