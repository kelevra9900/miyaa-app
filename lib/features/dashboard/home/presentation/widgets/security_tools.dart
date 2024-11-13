import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miyaa/tools/custom_text.dart';

class SecurityToolsWidget extends StatelessWidget {
  final VoidCallback onReportIncident;
  final VoidCallback onSafeAreaLocations;
  final VoidCallback onCheckOut;

  const SecurityToolsWidget({
    super.key,
    required this.onReportIncident,
    required this.onSafeAreaLocations,
    required this.onCheckOut,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'Herramientas de Seguridad',
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 16), // Ajusta el espaciado vertical aquí
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ToolButton(
                icon: Icons.report_problem,
                label: 'Reporte de Incidente',
                onTap: onReportIncident,
              ),
              _ToolButton(
                icon: Icons.map,
                label: 'Áreas Seguras',
                onTap: onSafeAreaLocations,
              ),
              _ToolButton(
                icon: Icons.logout,
                label: 'Check-out',
                onTap: onCheckOut,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ToolButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ToolButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80, // Ancho fijo para todos los botones
        height:
            110, // Ajusta el alto para permitir espacio para dos líneas de texto
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            CustomText(
              label,
              textAlign: TextAlign.center,
              fontSize: 12,
              maxLines: 2, // Permite hasta 2 líneas de texto
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
