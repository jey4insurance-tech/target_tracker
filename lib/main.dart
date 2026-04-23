import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'theme.dart';

void main() {
  runApp(TargetTrackerApp());
}

class TargetTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Target Tracker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: DashboardScreen(),
    );
  }
}