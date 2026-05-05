class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email tidak boleh kosong';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Format email salah';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 8) return 'Minimal 8 karakter';
    if (!value.contains(RegExp(r'[0-9]')) ||
        !value.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Harus ada huruf dan angka';
    }
    return null;
  }
}
