import 'package:flutter/material.dart';

import 'core/app_brand.dart';
import 'core/app_controller.dart';
import 'core/app_scope.dart';
import 'views/auth_screen.dart';
import 'views/main_shell.dart';
import 'widgets/app_chrome.dart';

void main() {
  runApp(const JuniorJobsApp());
}

class JuniorJobsApp extends StatefulWidget {
  const JuniorJobsApp({super.key});

  @override
  State<JuniorJobsApp> createState() => _JuniorJobsAppState();
}

class _JuniorJobsAppState extends State<JuniorJobsApp> {
  late final AppController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AppController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      controller: _controller,
      child: MaterialApp(
        title: 'Junior Jobs',
        debugShowCheckedModeBanner: false,
        theme: _theme(),
        home: PhoneCanvas(
          child: AnimatedBuilder(
            animation: _controller.auth,
            builder: (context, _) {
              return _controller.auth.isAuthenticated
                  ? const MainShell()
                  : const AuthScreen();
            },
          ),
        ),
      ),
    );
  }

  ThemeData _theme() {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppBrand.primaryBlue,
      brightness: Brightness.dark,
      surface: AppBrand.surface,
      primary: AppBrand.primaryBlue,
      secondary: AppBrand.brightBlue,
    );
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      scaffoldBackgroundColor: AppBrand.background,
      fontFamily: AppBrand.fontFamily,
      textTheme: AppBrand.textTheme(
        const TextTheme(
          displaySmall: TextStyle(letterSpacing: 0),
          headlineSmall: TextStyle(letterSpacing: 0),
          titleLarge: TextStyle(letterSpacing: 0),
          titleMedium: TextStyle(letterSpacing: 0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.08),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppBrand.brightBlue),
        ),
      ),
    );
  }
}
