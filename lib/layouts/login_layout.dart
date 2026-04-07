import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_test/core/app_colors.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // ❌ IMPORTANTE: NO NAVEGAR MANUALMENTE
      // El AuthWrapper detectará el login y cambiará de pantalla automáticamente.
    } on FirebaseAuthException catch (e) {
      String mensaje = "Email o contraseña incorrectos";
      if (e.code == 'invalid-email') mensaje = "Email no válido";

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(mensaje)));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error al iniciar sesión")));
    }
  }

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
              child: Container(color: Colors.black.withOpacity(0.6)),
            ),
          ),

          // Contenido
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  Image.asset(
                    "assets/images/icons8-levantamiento-de-pesas-50.png",
                    height: 50,
                  ),

                  const SizedBox(height: 20),

                  Text('EmpreGym', style: AppColors.brand),

                  Text(
                    'Optimiza tu cuerpo, no sólo tu código.',
                    style: AppColors.h1,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 120),

                  InputFields(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'He olvidado mi contraseña',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),
                  ),

                  const SizedBox(height: 10),

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
                      onPressed: login,
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 22, color: Colors.white),
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

class InputFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const InputFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: EmailTextField(controller: emailController),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: PasswordTextField(controller: passwordController),
        ),
      ],
    );
  }
}

class EmailTextField extends StatefulWidget {
  final TextEditingController controller;

  const EmailTextField({super.key, required this.controller});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // Refresca la UI cuando cambia el foco
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_focusNode.hasFocus ? 0.25 : 0.15),
            blurRadius: _focusNode.hasFocus ? 15 : 10,
            offset: Offset(0, _focusNode.hasFocus ? 6 : 4),
          ),
        ],
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        focusNode: _focusNode,
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: AppColors.primary,
          filled: true,
          hintText: "Email",
          prefixIcon: const Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // Actualiza sombra cuando cambia el foco
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_focusNode.hasFocus ? 0.25 : 0.15),
            blurRadius: _focusNode.hasFocus ? 15 : 10,
            offset: Offset(0, _focusNode.hasFocus ? 6 : 4),
          ),
        ],
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        focusNode: _focusNode,
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          fillColor: AppColors.primary,
          filled: true,
          hintText: 'Contraseña',
          prefixIcon: const Icon(Icons.password_rounded),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off_rounded : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
