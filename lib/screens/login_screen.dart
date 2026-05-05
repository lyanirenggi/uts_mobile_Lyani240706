import 'package:flutter/material.dart';
import '../utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 1. GlobalKey untuk validasi Form
  final _formKey = GlobalKey<FormState>();

  // 2. Controller untuk mengambil input teks
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // 3. State Variables
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  // 4. Fungsi Login (Logic)
  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulasi delay jaringan (Mocking proses login)
      await Future.delayed(const Duration(seconds: 2));

      setState(() => _isLoading = false);

      // Navigasi ke Dashboard (Named Route)
      // Mengirim email sebagai argumen untuk ditampilkan di Dashboard
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          '/dashboard',
          arguments: _emailController.text,
        );
      }
    }
  }

  @override
  void dispose() {
    // Penting: Hapus controller saat widget dibuang untuk mencegah memory leak
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey, // Hubungkan GlobalKey ke Form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Selamat Datang di INSTIKI",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Field Email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator:
                      AppValidators.validateEmail, // Gunakan util validator
                ),
                const SizedBox(height: 16),

                // Field Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible, // Kontrol visibilitas
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(
                          () => _isPasswordVisible = !_isPasswordVisible,
                        );
                      },
                    ),
                  ),
                  validator: AppValidators.validatePassword,
                ),
                const SizedBox(height: 24),

                // Tombol Login
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text("Login"),
                ),

                // Navigasi ke Lupa Password
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/forgot-password'),
                  child: const Text("Lupa Password?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
