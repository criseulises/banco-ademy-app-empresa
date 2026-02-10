import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_nav.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
                  'Otras opciones',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildOptionItem(
                icon: 'assets/icons/tabler-icon-phone.svg',
                title: 'Contáctanos',
                onTap: () {
                  context.go('/contact');
                },
              ),
              _buildOptionItem(
                icon: 'assets/icons/tabler-icon-users.svg',
                title: 'Gestionar beneficiarios',
                onTap: () {
                  context.go('/beneficiaries');
                },
              ),
              _buildOptionItem(
                icon: 'assets/icons/tabler-icon-home-bolt.svg',
                title: 'Gestionar servicios afiliados',
                onTap: () {
                  // TODO: Navigate to affiliated services page
                },
              ),
              _buildOptionItem(
                icon: 'assets/icons/tabler-icon-calendar-time.svg',
                title: 'Gestionar transacciones agendadas',
                onTap: () {
                  context.go('/transfers/scheduled');
                },
              ),
              _buildOptionItem(
                icon: 'assets/icons/tabler-icon-rubber-stamp.svg',
                title: 'Authorizaciones Pendientes',
                onTap: () {
                  context.go('/pending-authorizations');
                },
              ),
              _buildOptionItem(
                icon: 'assets/icons/tabler-icon-settings.svg',
                title: 'Configuraciones',
                onTap: () {
                  context.go('/settings');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CommonBottomNav(selectedIndex: 3),
    );
  }

  Widget _buildOptionItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
