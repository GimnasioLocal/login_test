import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:login_test/components/input_fields.dart';
import 'package:login_test/core/app_colors.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          SizedBox.expand(
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Filtro de desenfoque
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.black.withOpacity(0.1)),
            ),
          ),

          // Contenido principal
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // 👉 ICONO ARRIBA
                  Image.asset(
                    "assets/images/icons8-levantamiento-de-pesas-50.png",
                    height: 50,
                  ),

                  const SizedBox(height: 20),

                  // TÍTULO
                  Text('EmpreGym', style: AppColors.brand),

                  // SUBTÍTULO
                  Text(
                    'Optimiza tu cuerpo, no sólo tu código.',
                    style: AppColors.h1,
                    textAlign: TextAlign.center,
                  ),

                  // 👉 MENOS ESPACIO AQUÍ
                  const SizedBox(height: 120),

                  // CAMPOS DE TEXTO
                  const InputFields(),

                  const SizedBox(height: 10),

                  // OLVIDÉ CONTRASEÑA
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'He olvidado mi contraseña',
                      style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // BOTÓN
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        backgroundColor: AppColors.secondary,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
