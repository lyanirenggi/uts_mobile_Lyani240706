import 'package:flutter/material.dart';
import '../utils/validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _handleReset() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 1)); // Simulasi proses
      setState(() => _isLoading = false);

      // Tampilkan Snackbar sebagai feedback (Poin Penilaian)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Link reset telah dikirim ke email Anda")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lupa Password")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Masukkan email untuk menerima link reset."),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: AppValidators.validateEmail,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _handleReset,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Kirim Link"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context), // Kembali ke Login
                child: const Text("Kembali ke Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
