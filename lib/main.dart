// lib/main.dart
import 'package:flutter/material.dart';
import 'utils/constants.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const HamooApp());
}

class HamooApp extends StatelessWidget {
  const HamooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamoo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kGreen),
        useMaterial3: true,
      ),
      // Named Routes — minimal 3 route (syarat wajib!)
      initialRoute: routeLogin,
      routes: {
        routeLogin: (context) => const LoginScreen(),
        routeForgotPassword: (context) => const ForgotPasswordScreen(),
        routeDashboard: (context) => const DashboardScreen(),
      },
    );
  }
}
