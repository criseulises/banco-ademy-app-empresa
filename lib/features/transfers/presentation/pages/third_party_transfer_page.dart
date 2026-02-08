import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

/// Third party transfer page - Transferencia a tercero
class ThirdPartyTransferPage extends StatefulWidget {
  const ThirdPartyTransferPage({super.key});

  @override
  State<ThirdPartyTransferPage> createState() => _ThirdPartyTransferPageState();
}

class _ThirdPartyTransferPageState extends State<ThirdPartyTransferPage> {
  static const _borderColor = Color(0xFF616161);

  String? _selectedOrigen;
  String? _selectedBeneficiario;
  String _selectedMetodo = 'ACH';
  final _montoController = TextEditingController();
  final _conceptoController = TextEditingController();

  final List<String> _productos = [
    'Cuenta de ahorro - 0012345678',
    'Cuenta corriente - 0098765432',
    'Cuenta n\u00f3mina - 0011223344',
  ];

  final List<Map<String, String>> _beneficiarios = [
    {
      'nombre': 'Juan P\u00e9rez',
      'cuenta': '0012345678',
      'banco': 'Banco ADEMI',
    },
    {
      'nombre': 'Mar\u00eda Garc\u00eda',
      'cuenta': '9988776655',
      'banco': 'Banreservas',
    },
    {
      'nombre': 'Carlos L\u00f3pez',
      'cuenta': '5544332211',
      'banco': 'Popular',
    },
  ];

  bool get _isInternalTransfer {
    if (_selectedBeneficiario == null) return false;
    final beneficiario = _beneficiarios.firstWhere(
      (b) => '${b['nombre']} - ${b['cuenta']}' == _selectedBeneficiario,
      orElse: () => {},
    );
    return beneficiario['banco'] == 'Banco ADEMI';
  }

  List<String> get _beneficiarioItems {
    return _beneficiarios
        .map((b) => '${b['nombre']} - ${b['cuenta']}')
        .toList();
  }

  @override
  void dispose() {
    _montoController.dispose();
    _conceptoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // Origen
            _buildLabel('Origen', required: true),
            const SizedBox(height: 8),
            _buildDropdown(
              value: _selectedOrigen,
              hint: 'Selecciona un producto origen',
              items: _productos,
              onChanged: (value) {
                setState(() {
                  _selectedOrigen = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Destino
            _buildLabel('Destino', required: true),
            const SizedBox(height: 8),
            _buildDropdown(
              value: _selectedBeneficiario,
              hint: 'Selecciona un beneficiario',
              items: _beneficiarioItems,
              onChanged: (value) {
                setState(() {
                  _selectedBeneficiario = value;
                  if (_isInternalTransfer) {
                    _selectedMetodo = 'ACH';
                  }
                });
              },
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Agregar beneficiario...'),
                  ),
                );
              },
              child: const Text(
                'Agregar beneficiario',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Monto
            _buildLabel('Monto', required: true),
            const SizedBox(height: 8),
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Digite el monto a transferir',
                hintStyle: const TextStyle(
                  color: _borderColor,
                  fontSize: 14,
                ),
                prefixIcon: Container(
                  width: 48,
                  alignment: Alignment.center,
                  child: const Text(
                    '\$',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: _borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: _borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),

            // Método (only shown for external transfers)
            if (!_isInternalTransfer) ...[
              const SizedBox(height: 20),
              _buildLabel('M\u00e9todo', required: true),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildMetodoChip('ACH'),
                  const SizedBox(width: 12),
                  _buildMetodoChip('LBTR'),
                ],
              ),
            ],

            const SizedBox(height: 20),

            // Concepto
            _buildLabel('Concepto'),
            const SizedBox(height: 8),
            TextField(
              controller: _conceptoController,
              decoration: InputDecoration(
                hintText: 'Escribe un comentario',
                hintStyle: const TextStyle(
                  color: _borderColor,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: _borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: _borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Botones Cancelar y Continuar
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _showConfirmDialog,
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                'Transferencia a tercero',
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

  Widget _buildLabel(String text, {bool required = false}) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        if (required)
          const Text(
            ' *',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _borderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: const TextStyle(
              color: _borderColor,
              fontSize: 14,
            ),
          ),
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.primary,
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  void _showConfirmDialog() {
    final monto = double.tryParse(_montoController.text) ?? 0;
    final impuesto = monto * 0.0015;
    final isLbtr = _selectedMetodo == 'LBTR' && !_isInternalTransfer;
    final cargoLbtr = isLbtr ? 100.0 : 0.0;
    final total = monto + impuesto + cargoLbtr;

    final origen = _selectedOrigen ?? '';
    final destino = _selectedBeneficiario ?? '';
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
              _buildConfirmRow('Destino', destino),
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
              if (isLbtr) ...[
                const SizedBox(height: 12),
                _buildConfirmRow(
                  'Cargo por LBTR',
                  'RD\$ ${cargoLbtr.toStringAsFixed(2)}',
                ),
              ],

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
                      'destino': destino,
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

  Widget _buildMetodoChip(String label) {
    final isSelected = _selectedMetodo == label;
    final isLbtr = label == 'LBTR';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMetodo = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.secondary : _borderColor,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected ? AppColors.secondary.withOpacity(0.08) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.secondary : _borderColor,
              ),
            ),
            if (isLbtr && isSelected) ...[
              const SizedBox(width: 8),
              Text(
                '+RD\$100',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
