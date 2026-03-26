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
    return Column(
      children: [
        SizedBox(height: 70),
        Text('LoginGym', style: AppColors.brand),
        Text('Optimiza tu cuerpo, no sólo tu código.', style: AppColors.h1),
        SizedBox(height: 150),
        InputFields(),
        SizedBox(height: 10),
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
        SizedBox(height: 10),
        SizedBox(
          height: 60,
          width: 200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(40),
              ),
              backgroundColor: AppColors.secondary,
            ),
            onPressed: () {},
            child: Text(
              'Iniciar sesión',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
