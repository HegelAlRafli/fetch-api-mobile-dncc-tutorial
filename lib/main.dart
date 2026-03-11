import 'package:flutter/material.dart';
import 'package:learn_fetch_api_dncc/home/pages/home_page.dart';

import 'core/theme/app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch API - Mobile DNCC',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.getThemeLight(),
      home: const HomePage(),
    );
  }
}
