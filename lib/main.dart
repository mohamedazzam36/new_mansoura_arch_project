import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_theme.dart';
import 'features/home/presentation/views/home_view.dart';

void main() {
  runApp(const NourArchApp());
}

/// Root application widget.
class NourArchApp extends StatelessWidget {
  const NourArchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Mansoura Development Project',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeView(),
    );
  }
}
