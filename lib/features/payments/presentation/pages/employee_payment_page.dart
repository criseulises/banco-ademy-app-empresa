import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

/// Employee Payment Page - Pago a Empleados
class EmployeePaymentPage extends StatefulWidget {
  const EmployeePaymentPage({super.key});

  @override
  State<EmployeePaymentPage> createState() => _EmployeePaymentPageState();
}

class _EmployeePaymentPageState extends State<EmployeePaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _employeeNameController = TextEditingController();
  final _employeeIdController = TextEditingController();
  final _accountController = TextEditingController();
  final _amountController = TextEditingController();
  final _conceptController = TextEditingController();
  
  String? _selectedPaymentType;
  String? _selectedAccount;
  
  final List<String> _paymentTypes = [
    'Nómina Regular',
    'Bono',
    'Comisión',
    'Horas Extra',
    'Aguinaldo',
    'Vacaciones',
  ];
  
  final List<String> _accounts = [
    'Cuenta Corriente - **** 1234',
    'Cuenta de Nómina - **** 5678',
    'Cuenta de Ahorros - **** 9012',
  ];

  @override
  void dispose() {
    _employeeNameController.dispose();
    _employeeIdController.dispose();
    _accountController.dispose();
    _amountController.dispose();
    _conceptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSectionTitle('Información del Empleado'),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _employeeNameController,
                  label: 'Nombre del Empleado',
                  icon: 'resources/tabler-icon-user.svg',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el nombre del empleado';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _employeeIdController,
                  label: 'Cédula/ID',
                  icon: 'resources/tabler-icon-id.svg',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la cédula del empleado';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _accountController,
                  label: 'Número de Cuenta',
                  icon: 'resources/tabler-icon-building-bank.svg',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el número de cuenta';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Detalles del Pago'),
                const SizedBox(height: 16),
                _buildDropdownField(
                  value: _selectedPaymentType,
                  label: 'Tipo de Pago',
                  icon: 'resources/tabler-icon-receipt-tax.svg',
                  items: _paymentTypes,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentType = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _amountController,
                  label: 'Monto (RD\$)',
                  icon: 'resources/tabler-icon-wallet.svg',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el monto';
                    }
                    final amount = double.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return 'Por favor ingrese un monto válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildDropdownField(
                  value: _selectedAccount,
                  label: 'Cuenta de Débito',
                  icon: 'resources/bank.svg',
                  items: _accounts,
                  onChanged: (value) {
                    setState(() {
                      _selectedAccount = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _conceptController,
                  label: 'Concepto (Opcional)',
                  icon: 'resources/tabler-icon-file-document.svg',
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                _buildPaymentButton(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      toolbarHeight: 80,
      leading: IconButton(
        icon: SvgPicture.asset(
          'resources/tabler-icon-chevron-left.svg',
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
          width: 24,
          height: 24,
        ),
        onPressed: () => context.pop(),
      ),
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Image.asset(
                'resources/logo_ademi_blanco.png',
                height: 45,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              const Text(
                'Pago a Empleados',
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                Colors.grey.shade600,
                BlendMode.srcIn,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String? value,
    required String label,
    required String icon,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                Colors.grey.shade600,
                BlendMode.srcIn,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor seleccione una opción';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPaymentButton() {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: _handlePayment,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'resources/tabler-icon-arrow-bar-up.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Procesar Pago',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePayment() {
    if (_formKey.currentState!.validate()) {
      // Validar que los campos de dropdown estén seleccionados
      if (_selectedPaymentType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor seleccione un tipo de pago'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      
      if (_selectedAccount == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor seleccione una cuenta de débito'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Mostrar diálogo de confirmación
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'resources/tabler-icon-users.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Confirmar Pago',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildConfirmationRow('Empleado:', _employeeNameController.text),
              _buildConfirmationRow('Cédula:', _employeeIdController.text),
              _buildConfirmationRow('Tipo:', _selectedPaymentType!),
              _buildConfirmationRow(
                'Monto:',
                'RD\$ ${_amountController.text}',
              ),
              _buildConfirmationRow('Cuenta:', _selectedAccount!),
              if (_conceptController.text.isNotEmpty)
                _buildConfirmationRow('Concepto:', _conceptController.text),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _processPayment();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Confirmar',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildConfirmationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _processPayment() {
    // Simular procesamiento
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Cerrar loading
      
      // Mostrar éxito
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 64,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '¡Pago Exitoso!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'El pago a ${_employeeNameController.text} ha sido procesado correctamente.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cerrar diálogo
                  context.pop(); // Volver a la página anterior
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Aceptar',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
