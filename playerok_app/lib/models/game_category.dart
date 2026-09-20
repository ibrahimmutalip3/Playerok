import 'package:flutter/material.dart';

class GameCategory {
  final String title;
  final Color accentColor;
  final IconData icon;
  final bool isNew;

  const GameCategory({
    required this.title,
    required this.accentColor,
    required this.icon,
    this.isNew = false,
  });
}
