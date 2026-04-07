import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_test/core/app_colors.dart';

class UserPanelLayout extends StatelessWidget {
  const UserPanelLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panel de usuario"),
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

              // Si el usuario cancela, no hacemos nada
              if (confirmar != true) return;

              // Si confirma, cerramos sesión
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Resumen general",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),

            const SizedBox(height: 10),
            _buildCard("Próxima clase", "CrossFit - 18:00"),
            _buildCard("Racha", "3 días seguidos"),
            _buildCard("Acciones rápidas", "Reservar / Cancelar"),

            const SizedBox(height: 20),
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
                  _buildSection("Mi perfil"),
                  _buildSection("Progreso"),
                  _buildSection("Clases"),
                  _buildSection("WOD"),
                  _buildSection("Tienda"),
                  _buildSection("Comunidad"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle) {
    return Card(
      elevation: 3,
      child: ListTile(title: Text(title), subtitle: Text(subtitle)),
    );
  }

  Widget _buildSection(String title) {
    return Card(
      elevation: 3,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
