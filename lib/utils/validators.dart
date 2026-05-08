// lib/utils/validators.dart

class Validators {
  // Validasi email: tidak kosong + format benar
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }
    // Regex untuk cek format email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Format email tidak valid';
    }
    return null; // null artinya VALID
  }

  // Validasi password: tidak kosong, min 8 karakter, ada huruf & angka
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }
    // Cek ada huruf
    if (!value.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Password harus mengandung huruf';
    }
    // Cek ada angka
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password harus mengandung angka';
    }
    return null;
  }
}
