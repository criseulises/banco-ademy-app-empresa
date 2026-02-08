import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_nav.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
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
                  'Configuraciones',
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
      bottomNavigationBar: const CommonBottomNav(selectedIndex: 3),
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
}
