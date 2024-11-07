import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/config/ui_colors.dart';
import 'package:flutter_smart_home_ui/screens/detail_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: UiColors.scaffoldBgColor,
      ),
      home: const DetailScreen(),
    );
  }
}
