import 'package:flutter/material.dart';
import 'package:login_test/core/app_colors.dart';

class StocksLayout extends StatelessWidget {
  const StocksLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestor de Stocks"),
        backgroundColor: AppColors.secondary,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Acciones disponibles",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),

            const SizedBox(height: 20),

            _buildActionButton(
              context,
              "Añadir stock",
              Icons.add_circle_outline,
              () {
                // Aquí irá la lógica de añadir stock
              },
            ),

            const SizedBox(height: 15),

            _buildActionButton(context, "Actualizar stock", Icons.edit, () {
              // Aquí irá la lógica de actualizar stock
            }),

            const SizedBox(height: 15),

            _buildActionButton(
              context,
              "Eliminar stock",
              Icons.delete_outline,
              () {
                // Aquí irá la lógica de eliminar stock
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: Icon(icon, color: Colors.white),
        label: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        onPressed: onTap,
      ),
    );
  }
}
