import 'package:flutter/material.dart';
import 'package:product_browser/config/theme_manager.dart';
import 'package:product_browser/view/tabview.dart';

void main() {
  runApp(const PBApp());
}

class PBApp extends StatefulWidget {
  const PBApp({super.key});

  @override
  State<PBApp> createState() => _PBAppState();
}

class _PBAppState extends State<PBApp> {

  ThemeKey themeKey = ThemeKey.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAA',
      theme: ThemeManager.themeForKey(themeKey),
      home: TabView(),
    );
  }
}
