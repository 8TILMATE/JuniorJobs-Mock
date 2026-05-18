import 'package:flutter/material.dart';

import '../core/app_brand.dart';
import '../core/app_scope.dart';
import '../viewmodels/auth_view_model.dart';
import '../widgets/app_chrome.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _nameController = TextEditingController(text: 'Mititelu Bianca');
  final _emailController = TextEditingController(text: 'sam@junior.jobs');
  final _passwordController = TextEditingController(text: 'mockpass');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = AppScope.of(context).auth;
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        final isSignup = viewModel.mode == AuthMode.signup;
        return Scaffold(
          body: GradientBackground(
            colors: const [
              AppBrand.background,
              AppBrand.surface,
              Color(0xFF061A33),
            ],
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 36, 24, 24),
                children: [
                  const Center(child: BrandLogo(size: 118)),
                  const SizedBox(height: 18),
                  Text(
                    "JuniorJobs",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Archivo",
                    ),
                  ),
                  const SizedBox(height: 58),
                  const TypedIntroText(),
                  const SizedBox(height: 18),
                  Text(
                    isSignup
                        ? 'Configureaza-ti VideoCV-ul si CV-ul clasic intr-un singur loc.'
                        : 'Aplicari cu VideoCV, CV clasic de rezerva si oportunitati reale pentru tineri.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, height: 1.35),
                  ),
                  const SizedBox(height: 34),
                  GlassPanel(
                    child: Column(
                      children: [
                        SegmentedButton<AuthMode>(
                          segments: const [
                            ButtonSegment(
                              value: AuthMode.login,
                              label: Text('Autentificare'),
                            ),
                            ButtonSegment(
                              value: AuthMode.signup,
                              label: Text('Cont nou'),
                            ),
                          ],
                          selected: {viewModel.mode},
                          onSelectionChanged: (selection) {
                            selection.first == AuthMode.login
                                ? viewModel.showLogin()
                                : viewModel.showSignup();
                          },
                        ),
                        const SizedBox(height: 18),
                        if (isSignup) ...[
                          TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Nume',
                              prefixIcon: Icon(Icons.person_outline),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                            prefixIcon: Icon(Icons.mail_outline),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Parola',
                            prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                        const SizedBox(height: 18),
                        GradientButton(
                          label: isSignup
                              ? 'Creeaza cont demo'
                              : 'Intra in Junior Jobs',
                          icon: isSignup ? Icons.person_add_alt_1 : Icons.login,
                          isBusy: viewModel.isBusy,
                          onPressed: () {
                            if (isSignup) {
                              viewModel.signup(
                                _nameController.text,
                                _emailController.text,
                                _passwordController.text,
                              );
                            } else {
                              viewModel.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
