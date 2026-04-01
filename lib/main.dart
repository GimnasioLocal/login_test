import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:login_test/layouts/login_layout.dart';
//import 'package:login_test/layouts/register_layout.dart';
//import 'package:login_test/layouts/user_panel_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // LOGIN:
      home: Scaffold(body: LoginLayout()),
      // REGISTRO:
      // home: const RegisterLayout(),
      // PANEL DE USUARIO:
      // home: const UserPanelLayout(),
    );
  }
}
