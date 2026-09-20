import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/root_screen.dart';

void main() {
  runApp(const PlayerokApp());
}

class PlayerokApp extends StatelessWidget {
  const PlayerokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playerok',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const RootScreen(),
    );
  }
}
