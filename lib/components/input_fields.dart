import 'package:flutter/material.dart';
import 'package:login_test/core/app_colors.dart';

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  String? selectedBox;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
            child: EmailTextField(hint: 'email@example.com'),
          ),
          // SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
            child: PasswordTextField(),
          ),
        ],
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.hint});
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: AppColors.primary,
        filled: true,
        hintText: hint,
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        fillColor: AppColors.primary,
        filled: true,
        hintText: 'password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.password_rounded),
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
      ),
    );
  }
}
