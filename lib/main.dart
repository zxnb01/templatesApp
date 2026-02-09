import 'package:flutter/material.dart';
import 'theme.dart';
import 'features/templates/screens/template_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template Marketplace',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const TemplateListPage(),
    );
  }
}
