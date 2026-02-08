import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';

/// Scheduled third party transfer page - Transferencia a tercero agendada
class ScheduledThirdPartyTransferPage extends StatefulWidget {
  const ScheduledThirdPartyTransferPage({super.key});

  @override
  State<ScheduledThirdPartyTransferPage> createState() =>
      _ScheduledThirdPartyTransferPageState();
}

class _ScheduledThirdPartyTransferPageState
    extends State<ScheduledThirdPartyTransferPage> {
  static const _borderColor = Color(0xFF616161);

  String? _selectedOrigen;
  String? _selectedBeneficiario;
  String _selectedMetodo = 'ACH';
  final _montoController = TextEditingController();
  final _conceptoController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedFrecuencia = 'Mensual';

  final List<String> _productos = [
    'Cuenta de ahorro - 0012345678',
    'Cuenta corriente - 0098765432',
    'Cuenta nómina - 0011223344',
  ];

  final List<Map<String, String>> _beneficiarios = [
    {
      'nombre': 'Juan Pérez',
      'cuenta': '0012345678',
      'banco': 'Banco ADEMI',
    },
    {
      'nombre': 'María García',
      'cuenta': '9988776655',
      'banco': 'Banreservas',
    },
    {
      'nombre': 'Carlos López',
      'cuenta': '5544332211',
      'banco': 'Popular',
    },
  ];

  final List<String> _frecuencias = [
    'Única vez',
    'Diaria',
    'Semanal',
    'Quincenal',
    'Mensual',
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
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
              _buildLabel('Método', required: true),
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

            const SizedBox(height: 20),

            // Fecha de inicio y Frecuencia
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Fecha de inicio', required: true),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: _borderColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('d MMMM yyyy', 'es')
                                    .format(_selectedDate),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const Icon(
                                Icons.calendar_today,
                                color: AppColors.primary,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Frecuencia', required: true),
                      const SizedBox(height: 8),
                      _buildDropdown(
                        value: _selectedFrecuencia,
                        hint: 'Frecuencia',
                        items: _frecuencias,
                        onChanged: (value) {
                          setState(() {
                            _selectedFrecuencia = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Transferencia agendada exitosamente'),
                        ),
                      );
                      Navigator.pop(context);
                    },
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
