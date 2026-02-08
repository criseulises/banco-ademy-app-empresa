import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Custom AppBar for Banco ADEMI with back button and white logo
class AdemiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdemiAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            // Botón de regresar
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            
            const Spacer(),
            
            // Logo en blanco
            Image.asset(
              'resources/logo_ademi_blanco.png',
              height: 45,
              fit: BoxFit.contain,
            ),
            
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
