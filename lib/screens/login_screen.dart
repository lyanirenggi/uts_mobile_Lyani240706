// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../models/user_model.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // GlobalKey untuk mengontrol Form (validasi, reset)
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil teks dari TextField
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // STATE yang wajib dikelola:
  bool _isLoading = false;
  String? _errorMessage;
  bool _isPasswordVisible = false;

  // Bersihkan controller saat widget dihancurkan (penting!)
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi login
  Future<void> _handleLogin() async {
    // Sembunyikan keyboard
    FocusScope.of(context).unfocus();

    // Validasi semua field di Form
    if (!_formKey.currentState!.validate()) return;

    // Set isLoading = true → tombol jadi loading
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Simulasi network delay (2 detik)
    await Future.delayed(const Duration(seconds: 2));

    // Cek credential
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email == kMockEmail && password == kMockPassword) {
      // Login sukses → buat user model
      final user = UserModel(name: kMockName, email: email);

      if (!mounted) return;

      // Navigasi ke Dashboard, kirim data user
      Navigator.pushNamed(context, routeDashboard, arguments: user);
    } else {
      // Login gagal → tampilkan error
      setState(() {
        _isLoading = false;
        _errorMessage = 'Email atau password salah!';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage!),
          backgroundColor: Colors.redAccent,
        ),
      );
    }

    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPink,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo / Judul
                const SizedBox(height: 40),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: kGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Hamoo',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D5A3E),
                  ),
                ),
                const Text(
                  'Your Daily Schedule App',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                // FORM
                Form(
                  key: _formKey, // hubungkan GlobalKey ke Form
                  child: Column(
                    children: [
                      // Field Email
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators
                            .validateEmail, // pakai validator dari utils
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFF86A788),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Field Password
                      TextFormField(
                        controller: _passwordController,
                        obscureText:
                            !_isPasswordVisible, // sembunyikan teks password
                        validator: Validators.validatePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF86A788),
                          ),
                          // Toggle show/hide password
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(
                                () => _isPasswordVisible = !_isPasswordVisible,
                              );
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Link Lupa Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, routeForgotPassword),
                          child: const Text(
                            'Lupa Password?',
                            style: TextStyle(color: Color(0xFF86A788)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Tombol Login
                      CustomButton(
                        label: 'Login',
                        isLoading: _isLoading,
                        onPressed: _handleLogin,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
