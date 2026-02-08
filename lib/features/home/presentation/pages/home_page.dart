import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/ademi_home_app_bar.dart';

/// Home page - Dashboard principal de Banco ADEMI
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBottomIndex = 0;
  String? _selectedFilter; // null = todos, 'cuentas', 'tarjetas', 'prestamos', 'inversiones'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AdemiHomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saludo
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.textPrimary,
                  ),
                  children: [
                    TextSpan(
                      text: '¡Buenos días, ',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: 'Cristian',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(text: '!'),
                  ],
                ),
              ),
            ),
            
            // Banner carousel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'resources/banner.png',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Título Productos
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Productos',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Filtros
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _buildFilterChip(
                    label: 'Cuentas',
                    icon: 'resources/pig.svg',
                    value: 'cuentas',
                  ),
                  const SizedBox(width: 12),
                  _buildFilterChip(
                    label: 'Tarjetas',
                    icon: 'resources/card.svg',
                    value: 'tarjetas',
                  ),
                  const SizedBox(width: 12),
                  _buildFilterChip(
                    label: 'Préstamos',
                    icon: 'resources/loans.svg',
                    value: 'prestamos',
                  ),
                  const SizedBox(width: 12),
                  _buildFilterChip(
                    label: 'Inversiones',
                    icon: 'resources/bank.svg',
                    value: 'inversiones',
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Lista de productos
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildProductCard(
                    title: 'Primera casa',
                    subtitle: 'Cuenta de ahorro',
                    accountNumber: '001010286647359',
                    balance: 'RD\$ 248,556.32',
                    icon: 'resources/pig.svg',
                    type: 'cuentas',
                  ),
                  const SizedBox(height: 16),
                  _buildProductCard(
                    title: 'Fondo de emergencia',
                    subtitle: 'Cuenta corriente',
                    accountNumber: '001008093080569',
                    balance: 'RD\$ 18,400.07',
                    icon: 'resources/pig.svg',
                    type: 'cuentas',
                  ),
                  const SizedBox(height: 16),
                  _buildProductCard(
                    title: 'Visa Platinum',
                    subtitle: 'Tarjeta de crédito',
                    accountNumber: '4532 **** **** 8901',
                    balance: 'RD\$ 145,000.00',
                    icon: 'resources/card.svg',
                    type: 'tarjetas',
                  ),
                  const SizedBox(height: 16),
                  _buildProductCard(
                    title: 'Préstamo personal',
                    subtitle: 'Préstamo',
                    accountNumber: '001012345678901',
                    balance: 'RD\$ 320,450.00',
                    icon: 'resources/loans.svg',
                    type: 'prestamos',
                  ),
                  const SizedBox(height: 16),
                  _buildProductCard(
                    title: 'Certificado Financiero',
                    subtitle: 'Inversión a plazo',
                    accountNumber: '001019876543210',
                    balance: 'RD\$ 500,000.00',
                    icon: 'resources/bank.svg',
                    type: 'inversiones',
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 100), // Espacio para el bottom nav
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Acceso rápido')),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.auto_awesome,
          color: AppColors.secondary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildFilterChip({
    required String label,
    required String icon,
    required String value,
  }) {
    final isSelected = _selectedFilter == value;
    
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = _selectedFilter == value ? null : value;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
            SvgPicture.asset(
              icon,
              width: 18,
              height: 18,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.secondary : Colors.grey.shade600,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.secondary : Colors.grey.shade600,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String subtitle,
    required String accountNumber,
    required String balance,
    required String icon,
    required String type,
  }) {
    // Filtrar según el tipo seleccionado
    if (_selectedFilter != null && _selectedFilter != type) {
      return const SizedBox.shrink();
    }

    return InkWell(
      onTap: () {
        if (type == 'cuentas') {
          context.push(
            '/accounts/$accountNumber',
            extra: {
              'title': title,
              'subtitle': subtitle,
              'accountNumber': accountNumber,
              'balance': balance,
            },
          );
        } else if (type == 'tarjetas') {
          context.push(
            '/cards/$accountNumber',
            extra: {
              'cardName': title,
              'cardNumber': '4716********0221',
              'cardHolder': 'CRISTIAN S\u00c1NCHEZ',
              'available': 'RD\$ 19,200.13',
              'balance': balance,
              'brand': 'VISA',
            },
          );
        } else if (type == 'prestamos') {
          context.push(
            '/loans/$accountNumber',
            extra: {
              'title': title,
              'subtitle': subtitle,
              'loanNumber': '022-104716',
              'remainingAmount': 'RD\$ 19,200.13',
              'originalAmount': 'RD\$ 32,000.00',
              'rate': '10.00%',
              'totalInstallments': 10,
              'paidInstallments': 4,
            },
          );
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título e icono
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SvgPicture.asset(
                icon,
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
            subtitle,
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
                accountNumber,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ),
              Text(
                balance,
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
        if (index == 1) {
          context.push('/transactions');
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
