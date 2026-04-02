import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:login_test/core/app_colors.dart';

class RegisterLayout extends StatefulWidget {
  const RegisterLayout({super.key});

  @override
  State<RegisterLayout> createState() => _RegisterLayoutState();
}

class _RegisterLayoutState extends State<RegisterLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          SizedBox.expand(
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Blur
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.black.withOpacity(0.1)),
            ),
          ),

          // Contenido
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text('EmpreGym', style: AppColors.brand),
                  Text(
                    'Optimiza tu cuerpo, no sólo tu código.',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Campos
                  _buildField("Nombre"),
                  _buildField("Apellidos"),
                  _buildField("Email"),
                  _buildField("Teléfono"),
                  _buildField("Contraseña", obscure: true),
                  _buildField("Confirmar contraseña", obscure: true),

                  const SizedBox(height: 20),

                  // Botón
                  SizedBox(
                    height: 55,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        // Aquí luego irá Firebase Auth
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Regístrate",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "¿Ya tienes cuenta? Inicia sesión",
                      style: TextStyle(
                        color: AppColors.secondary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
