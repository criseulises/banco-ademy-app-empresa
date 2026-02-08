import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        elevation: 0,
        toolbarHeight: 64,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo_ademi_blanco.png',
              height: 28,
            ),
            Text(
              'Configuraciones',
              style: AppTextStyles.headlineSmall.copyWith(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          
          // Settings options
          Expanded(
            child: Column(
              children: [
                _buildSettingOption(
                  context,
                  icon: 'assets/icons/tabler-icon-lock.svg',
                  title: 'Seguridad',
                  onTap: () {
                    // TODO: Navigate to security settings
                  },
                ),
                _buildSettingOption(
                  context,
                  icon: 'assets/icons/tabler-icon-user.svg',
                  title: 'Cuenta',
                  onTap: () {
                    // TODO: Navigate to account settings
                  },
                ),
                _buildSettingOption(
                  context,
                  icon: 'assets/icons/tabler-icon-adjustments-horizontal.svg',
                  title: 'Otras configuraciones',
                  onTap: () {
                    // TODO: Navigate to other settings
                  },
                ),
                _buildSettingOption(
                  context,
                  icon: 'assets/icons/tabler-icon-star.svg',
                  title: 'Califica nuestra app',
                  onTap: () {
                    // TODO: Open app rating
                  },
                ),
                
                const SizedBox(height: 10),
                
                // Version text
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Versión 1.1.0',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildSettingOption(
    BuildContext context, {
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Title
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(
                context,
                'Mis productos',
                Icons.account_balance_wallet_outlined,
                0,
                () {
                  // TODO: Navigate to products
                },
              ),
              _buildBottomNavItem(
                context,
                'Transacciones',
                Icons.swap_horiz,
                1,
                () {
                  // TODO: Navigate to transactions
                },
              ),
              _buildBottomNavItem(
                context,
                'Solicitudes',
                Icons.apps,
                2,
                () {
                  // TODO: Navigate to requests
                },
              ),
              _buildBottomNavItem(
                context,
                'Otras opciones',
                Icons.layers_outlined,
                3,
                () {
                  context.go('/other-options');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
    BuildContext context,
    String label,
    IconData icon,
    int index,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: AppColors.textSecondary,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
