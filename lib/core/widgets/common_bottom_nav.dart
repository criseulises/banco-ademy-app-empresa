import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

/// Common bottom navigation bar used across the app
///
/// This ensures consistent navigation behavior throughout the application
class CommonBottomNav extends StatelessWidget {
  /// The currently selected tab index:
  /// - 0: Mis productos (/home)
  /// - 1: Transacciones (/transactions)
  /// - 2: Solicitudes (not implemented)
  /// - 3: Otras opciones (/other-options)
  final int selectedIndex;

  const CommonBottomNav({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _buildNavItem(
                  context: context,
                  icon: 'resources/tabler-icon-wallet.svg',
                  label: 'Mis productos',
                  index: 0,
                  route: '/home',
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  context: context,
                  icon: 'resources/tabler-icon-arrows-exchange-2.svg',
                  label: 'Transacciones',
                  index: 1,
                  route: '/transactions',
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  context: context,
                  icon: 'resources/tabler-icon-category-plus.svg',
                  label: 'Solicitudes',
                  index: 2,
                  route: '/requests',
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  context: context,
                  icon: 'resources/tabler-icon-stack-2.svg',
                  label: 'Otras opciones',
                  index: 3,
                  route: '/other-options',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required String icon,
    required String label,
    required int index,
    required String? route,
  }) {
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        // Navigate to the specified route if available
        if (route != null) {
          // Always navigate to ensure we go to the main menu from any submenu
          context.go(route);
        }
        // If route is null (not implemented), do nothing silently
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
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
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
