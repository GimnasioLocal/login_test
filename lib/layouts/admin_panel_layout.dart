import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_test/core/app_colors.dart';
import 'package:login_test/layouts/stocks_layout.dart';


class AdminPanelLayout extends StatelessWidget {
  const AdminPanelLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -------------------------
      // APP BAR
      // -------------------------
      appBar: AppBar(
        title: const Text("Panel de administradores"),
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final confirmar = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Cerrar sesión"),
                    content: const Text(
                      "¿Estás seguro de que deseas cerrar sesión?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(color: AppColors.secondary),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text(
                          "Sí, salir",
                          style: TextStyle(color: AppColors.secondary),
                        ),
                      ),
                    ],
                  );
                },
              );

              if (confirmar != true) return;

              // Logout limpio: AuthWrapper se encarga del resto
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),

      // -------------------------
      // BODY
      // -------------------------
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------
            // RESUMEN GENERAL
            // -------------------------
            Text(
              "Resumen general",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),

            const SizedBox(height: 10),
            _buildCard("Ocupación del box", "—"),
            _buildCard("Alertas de stock", "—"),
            _buildCard("Clases programadas", "—"),
            _buildCard("Miembros totales", "—"),

            const SizedBox(height: 20),

            // -------------------------
            // SECCIONES
            // -------------------------
            Text(
              "Secciones",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                children: [
                  _buildSection("Clases"),
                  _buildSection("Miembros"),
                  _buildSection(
                    "Gestor de stocks",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const StocksLayout()),
                      );
                    },
                  ),

                  _buildSection("Pagos"),
                  _buildSection("Tienda"),
                  _buildSection("Comunidad"),
                  _buildSection("Entrenamientos"),
                  _buildSection("Informes y análisis"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------
  // TARJETAS DE RESUMEN
  // -------------------------
  Widget _buildCard(String title, String subtitle) {
    return Card(
      elevation: 3,
      child: ListTile(title: Text(title), subtitle: Text(subtitle)),
    );
  }

  // -------------------------
  // SECCIONES DEL PANEL
  // -------------------------
  Widget _buildSection(String title, {VoidCallback? onTap}) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
