import 'package:flutter/material.dart';
import 'package:product_browser/config/theme_manager.dart';
import 'package:product_browser/model/chat/message/chat_message_model.dart';
import 'package:product_browser/model/user/user.dart';
import 'package:product_browser/view/tabview.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => User()),
    ],
    child: const PBApp(),
  ));
}

class PBApp extends StatefulWidget {
  const PBApp({super.key});

  @override
  State<PBApp> createState() => _PBAppState();
}

class _PBAppState extends State<PBApp> {
  ThemeKey themeKey = ThemeKey.dark;

  @override
  void initState() {
    super.initState();
    context.read<User>().changeUid('1');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAA',
      theme: ThemeManager.themeForKey(themeKey),
      home: TabView(),
    );
  }
}
