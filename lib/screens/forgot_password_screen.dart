// lib/screens/forgot_password_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSendReset() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Link reset telah dikirim ke email Anda 📩'),
        backgroundColor: Color(0xFF86A788),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Tombol kembali
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context), // kembali ke login
              ),
              const SizedBox(height: 24),
              const Text(
                'Lupa Password? 🔑',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D5A3E),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Masukkan email kamu, kami akan kirimkan link reset password.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.validateEmail,
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
                    const SizedBox(height: 24),
                    CustomButton(
                      label: 'Kirim Link Reset',
                      isLoading: _isLoading,
                      onPressed: _handleSendReset,
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Kembali ke Login',
                        style: TextStyle(color: Color(0xFF86A788)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
