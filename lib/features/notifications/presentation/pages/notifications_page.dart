import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/common_bottom_nav.dart';

/// Notifications page - Lista de notificaciones
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Mock data de notificaciones
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Tu préstamo de RD\$ 250,000.00 ha sido aprobado',
      'time': 'Hace 4 minutos',
      'isRead': false,
      'isHighlighted': false,
    },
    {
      'title': 'Recuerda pagar tu préstamo "Préstamo lavadora"',
      'time': 'Hace 2 horas',
      'isRead': false,
      'isHighlighted': false,
    },
    {
      'title': 'Recuerda asistir a la charla del ahorro hoy a las 3 p.m.',
      'time': 'Ayer',
      'isRead': true,
      'isHighlighted': false,
    },
    {
      'title': 'Su solicitud de préstamo de RD\$ 250,000.00 está en proceso',
      'time': 'Ayer',
      'isRead': true,
      'isHighlighted': false,
    },
    {
      'title': '¡Únete a nuestra charla del ahorro! Toca aquí para saber más',
      'time': '24 de junio, 2025',
      'isRead': true,
      'isHighlighted': false,
    },
    {
      'title': '¡Aprovecha nuestra feria de préstamos a baja tasa de interés!',
      'time': '24 de junio, 2025',
      'isRead': true,
      'isHighlighted': false,
    },
    {
      'title': '¿Te interesa organizar mejor tu presupuesto? ¡Toca aquí!',
      'time': '24 de junio, 2025',
      'isRead': true,
      'isHighlighted': false,
    },
    {
      'title': 'Se acerca la fecha de pago de tu préstamo "Préstamo lavadora"',
      'time': '22 de junio, 2025',
      'isRead': true,
      'isHighlighted': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Padding(
            padding: EdgeInsets.only(bottom: index < _notifications.length - 1 ? 16 : 0),
            child: _buildNotificationCard(
              index: index,
              title: notification['title'],
              time: notification['time'],
              isRead: notification['isRead'],
              isHighlighted: notification['isHighlighted'],
            ),
          );
        },
      ),
      bottomNavigationBar: const CommonBottomNav(selectedIndex: 0),
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
              // Logo
              Image.asset(
                'resources/logo_ademi_blanco.png',
                height: 45,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              // Título Notificaciones
              const Text(
                'Notificaciones',
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

  Widget _buildNotificationCard({
    required int index,
    required String title,
    required String time,
    required bool isRead,
    required bool isHighlighted,
  }) {
    return InkWell(
      onTap: () {
        if (!isRead) {
          setState(() {
            _notifications[index]['isRead'] = true;
          });
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!isRead) ...[
            const SizedBox(width: 12),
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    ),
    );
  }
}
