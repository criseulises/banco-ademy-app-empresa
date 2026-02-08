import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';

/// Transfer receipt page - Detalles de transacción
class TransferReceiptPage extends StatelessWidget {
  final String origen;
  final String destino;
  final String concepto;
  final double monto;

  const TransferReceiptPage({
    super.key,
    required this.origen,
    required this.destino,
    required this.concepto,
    required this.monto,
  });

  @override
  Widget build(BuildContext context) {
    final fecha = DateFormat('d \'de\' MMMM, yyyy', 'es').format(DateTime.now());
    final referencia = DateTime.now().millisecondsSinceEpoch.toString();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            color: const Color(0xFFECEFF1),
            child: const SafeArea(
              bottom: false,
              child: Text(
                'Detalles de transacción',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),

          // Body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Success icon
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary,
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: AppColors.primary,
                      size: 36,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Transacción completada',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF757575),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'RD\$ ${monto.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Divider
                  const Divider(color: Color(0xFFBDBDBD), height: 1),

                  const SizedBox(height: 24),

                  // Detalles
                  _buildDetailRow('Origen', origen),
                  const SizedBox(height: 16),
                  _buildDetailRow('Destino', destino),
                  const SizedBox(height: 16),
                  _buildDetailRow('Concepto', concepto),

                  const SizedBox(height: 24),

                  // Dashed line
                  _buildDashedLine(),

                  const SizedBox(height: 24),

                  // Fecha y referencia
                  _buildDetailRow('Fecha', fecha),
                  const SizedBox(height: 16),
                  _buildDetailRow('Número de referencia', referencia),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Bottom button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Compartiendo recibo...'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              icon: const Icon(
                Icons.share,
                color: Colors.white,
                size: 20,
              ),
              label: const Text(
                'Compartir recibo de transacción',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF757575),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDashedLine() {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 6.0;
        const dashSpace = 4.0;
        final dashCount =
            (constraints.maxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return const SizedBox(
              width: dashWidth,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFBDBDBD)),
              ),
            );
          }),
        );
      },
    );
  }
}
