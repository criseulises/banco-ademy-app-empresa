import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';

/// Loan detail page - Detalles de préstamo
class LoanDetailPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String loanNumber;
  final String remainingAmount;
  final String originalAmount;
  final String rate;
  final int totalInstallments;
  final int paidInstallments;

  const LoanDetailPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.loanNumber,
    required this.remainingAmount,
    required this.originalAmount,
    required this.rate,
    required this.totalInstallments,
    required this.paidInstallments,
  });

  @override
  State<LoanDetailPage> createState() => _LoanDetailPageState();
}

class _LoanDetailPageState extends State<LoanDetailPage> {
  int _selectedBottomIndex = 0;
  String? _selectedCuotaFilter; // null = todo

  // Mock data de cuotas
  final List<Map<String, dynamic>> _cuotas = [
    {
      'title': 'Pr\u00f3xima cuota',
      'date': '26 de julio, 2025',
      'amount': 'RD\$ 3,204.63',
      'status': 'pendiente',
    },
    {
      'title': 'Pago cuota No. 4',
      'date': '26 de junio, 2025',
      'amount': 'RD\$ 3,204.63',
      'status': 'pagada',
    },
    {
      'title': 'Pago cuota No. 3',
      'date': '26 de mayo, 2025',
      'amount': 'RD\$ 3,204.63',
      'status': 'pagada',
    },
    {
      'title': 'Pago cuota No. 2',
      'date': '26 de abril, 2025',
      'amount': 'RD\$ 3,204.63',
      'status': 'pagada',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // Informaci\u00f3n del pr\u00e9stamo
            _buildLoanInfoCard(),

            const SizedBox(height: 24),

            // Acciones r\u00e1pidas
            _buildActionButtons(),

            const SizedBox(height: 32),

            // Cuotas
            _buildCuotasSection(),

            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
                'Detalles de pr\u00e9stamo',
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

  Widget _buildLoanInfoCard() {
    final pending = widget.totalInstallments - widget.paidInstallments;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // T\u00edtulo con icono
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.edit_outlined,
                      size: 18,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'resources/loans.svg',
                  width: 28,
                  height: 28,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),

            // Subt\u00edtulo
            Text(
              widget.subtitle,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 20),

            // Gr\u00e1fico circular + leyenda + datos
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gr\u00e1fico circular
                SizedBox(
                  width: 110,
                  height: 110,
                  child: CustomPaint(
                    painter: _LoanProgressPainter(
                      paid: widget.paidInstallments,
                      pending: pending,
                      total: widget.totalInstallments,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${widget.paidInstallments}/${widget.totalInstallments}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Cuotas pagadas',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 7,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Leyenda + Tasa y capital
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Leyenda
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLegendItem(
                            color: AppColors.primary,
                            label: '${widget.paidInstallments} Pagadas',
                          ),
                          const SizedBox(height: 6),
                          _buildLegendItem(
                            color: AppColors.secondary,
                            label: '$pending Pendientes',
                          ),
                          const SizedBox(height: 6),
                          _buildLegendItem(
                            color: AppColors.error,
                            label: '0 Vencidas',
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Tasa y capital
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Tasa',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.rate,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Capital original',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.originalAmount,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // N\u00famero de pr\u00e9stamo y monto restante
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.loanNumber,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Monto restante',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.remainingAmount,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem({
    required Color color,
    required String label,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              icon: 'resources/tabler-icon-file-pay.svg',
              label: 'Pagar pr\u00e9stamo',
              onTap: () {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildActionButton(
              icon: 'resources/tabler-icon-file-document.svg',
              label: 'Estado de cuenta',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCuotasSection() {
    final filteredCuotas = _selectedCuotaFilter == null
        ? _cuotas
        : _cuotas
            .where((c) => c['status'] == _selectedCuotaFilter)
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              const Text(
                'Cuotas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCuotaFilterChip(
                        label: 'Todo',
                        value: null,
                        icon: Icons.bar_chart,
                      ),
                      const SizedBox(width: 12),
                      _buildCuotaFilterChip(
                        label: 'Pagadas',
                        value: 'pagada',
                        icon: Icons.check_circle_outline,
                      ),
                      const SizedBox(width: 12),
                      _buildCuotaFilterChip(
                        label: 'Pendientes',
                        value: 'pendiente',
                        icon: Icons.access_time,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: filteredCuotas.map((cuota) {
              final isPaid = cuota['status'] == 'pagada';
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildCuotaItem(
                  title: cuota['title'],
                  date: cuota['date'],
                  amount: cuota['amount'],
                  isPaid: isPaid,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCuotaFilterChip({
    required String label,
    required String? value,
    required IconData icon,
  }) {
    final isSelected = _selectedCuotaFilter == value;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedCuotaFilter = value;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
            Icon(
              icon,
              size: 18,
              color: isSelected ? AppColors.secondary : Colors.grey.shade600,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.secondary : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCuotaItem({
    required String title,
    required String date,
    required String amount,
    required bool isPaid,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isPaid
                  ? AppColors.primary.withOpacity(0.1)
                  : AppColors.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                isPaid ? Icons.check_circle_outline : Icons.access_time,
                size: 22,
                color: isPaid ? AppColors.primary : AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),

          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isPaid ? AppColors.primary : AppColors.secondary,
            ),
          ),
        ],
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
        if (index == 0) {
          Navigator.pop(context);
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

/// Custom painter para el gr\u00e1fico circular del pr\u00e9stamo
class _LoanProgressPainter extends CustomPainter {
  final int paid;
  final int pending;
  final int total;

  _LoanProgressPainter({
    required this.paid,
    required this.pending,
    required this.total,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;
    const strokeWidth = 6.0;
    const startAngle = -pi / 2;

    final bgPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    if (total == 0) return;

    // Pagadas (primary/teal)
    final paidAngle = (paid / total) * 2 * pi;
    final paidPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      paidAngle,
      false,
      paidPaint,
    );

    // Pendientes (secondary/orange)
    final pendingAngle = (pending / total) * 2 * pi;
    final pendingPaint = Paint()
      ..color = AppColors.secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + paidAngle,
      pendingAngle,
      false,
      pendingPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
