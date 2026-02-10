import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

/// Página para el pago a empleados
class EmployeePaymentPage extends StatefulWidget {
  const EmployeePaymentPage({super.key});

  @override
  State<EmployeePaymentPage> createState() => _EmployeePaymentPageState();
}

class _EmployeePaymentPageState extends State<EmployeePaymentPage> {
  static const _borderColor = Color(0xFF616161);

  String? _selectedOrigen;
  String? _selectedEmpleado;
  final TextEditingController _montoController = TextEditingController();
  final TextEditingController _conceptoController = TextEditingController();

  final List<String> _cuentasOrigen = [
    'Cuenta Corriente **** 1234',
    'Cuenta de Ahorros **** 5678',
    'Cuenta Empresarial **** 9012',
  ];

  final List<String> _empleados = [
    'Juan Pérez - 001-1234567-8',
    'María García - 001-2345678-9',
    'Carlos Rodríguez - 001-3456789-0',
    'Ana Martínez - 001-4567890-1',
    'Luis Fernández - 001-5678901-2',
  ];

  @override
  void dispose() {
    _montoController.dispose();
    _conceptoController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    if (_selectedOrigen == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor seleccione una cuenta de origen'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    if (_selectedEmpleado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor seleccione un empleado'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    if (_montoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor ingrese el monto'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    final monto = double.tryParse(_montoController.text);
    if (monto == null || monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor ingrese un monto válido'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }

  void _handleContinue() {
    if (_validateForm()) {
      _showConfirmDialog();
    }
  }

  void _showConfirmDialog() {
    final monto = double.tryParse(_montoController.text) ?? 0;
    final impuesto = monto * 0.0015;
    final total = monto + impuesto;

    final origen = _selectedOrigen ?? '';
    final empleado = _selectedEmpleado ?? '';
    final concepto = _conceptoController.text.isEmpty
        ? '-'
        : _conceptoController.text;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 32),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Confirmar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.textPrimary,
                      size: 24,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Divider(color: Color(0xFFBDBDBD), height: 1),
              const SizedBox(height: 16),

              // Detalles
              _buildConfirmRow('Origen', origen),
              const SizedBox(height: 12),
              _buildConfirmRow('Empleado', empleado),
              const SizedBox(height: 12),
              _buildConfirmRow('Concepto', concepto),

              const SizedBox(height: 20),
              _buildDashedLine(),
              const SizedBox(height: 20),

              // Montos
              _buildConfirmRow(
                'Monto',
                'RD\$ ${monto.toStringAsFixed(2)}',
              ),
              const SizedBox(height: 12),
              _buildConfirmRow(
                'Impuesto',
                'RD\$ ${impuesto.toStringAsFixed(2)}',
              ),

              const SizedBox(height: 16),

              // Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'RD\$ ${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Botón Proceder
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    context.push('/transfers/receipt', extra: {
                      'origen': origen,
                      'destino': empleado,
                      'concepto': concepto,
                      'monto': total,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Proceder',
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
        ),
      ),
    );
  }

  Widget _buildConfirmRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textPrimary,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cuenta de origen
                  _buildLabel('Cuenta de origen', required: true),
                  const SizedBox(height: 8),
                  _buildDropdown(
                    value: _selectedOrigen,
                    hint: 'Seleccione cuenta',
                    items: _cuentasOrigen,
                    onChanged: (value) => setState(() => _selectedOrigen = value),
                  ),

                  const SizedBox(height: 24),

                  // Empleado
                  _buildLabel('Empleado', required: true),
                  const SizedBox(height: 8),
                  _buildDropdown(
                    value: _selectedEmpleado,
                    hint: 'Seleccione empleado',
                    items: _empleados,
                    onChanged: (value) => setState(() => _selectedEmpleado = value),
                  ),

                  const SizedBox(height: 24),

                  // Monto
                  _buildLabel('Monto', required: true),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: _borderColor),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      controller: _montoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Digite el monto a pagar',
                        prefixIcon: Icon(Icons.attach_money, color: AppColors.primary),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Concepto
                  _buildLabel('Concepto'),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: _borderColor),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      controller: _conceptoController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'Escribe un comentario',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // Botones
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => context.pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextButton(
                    onPressed: _handleContinue,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                'Pago empleados',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, {bool required = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        children: required
            ? [
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
              ]
            : [],
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: const TextStyle(color: Color(0xFF9E9E9E)),
          ),
          isExpanded: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
