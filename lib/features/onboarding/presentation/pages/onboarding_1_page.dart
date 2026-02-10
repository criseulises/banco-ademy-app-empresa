import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../routing/routes.dart';

class Onboarding1Page extends StatelessWidget {
  const Onboarding1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacingLg,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo
                  Center(
                    child: SizedBox(
                      height: 104,
                      child: SvgPicture.asset(
                        'resources/logo_ademi.svg',
                        fit: BoxFit.contain,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '¡App Empresa!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: AppColors.textPrimary,
                      height: 1.4,
                      fontSize: 25,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Welcome Text
                  Text(
                    '¡Bienvenido al banco que da la\nmano!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: AppColors.textPrimary,
                      height: 1.4,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Start Button (full width respecting padding)
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push(Routes.onboarding2());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Empecemos',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Login link
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.push(Routes.login());
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '¿Ya tienes una cuenta? ',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
