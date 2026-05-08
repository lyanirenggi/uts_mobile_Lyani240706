# Hamoo_Your Daily Schedule App

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-Null%20Safety-brightgreen?logo=dart)
![License](https://img.shields.io/badge/License-MIT-pink)

> Aplikasi Flutter untuk manajemen jadwal harian dengan tampilan yang manis dan minimalis. Dibuat untuk praktikum Ujian Tengah Semester Mobile Programming.

---

## Deskripsi Aplikasi

**Hamoo** adalah aplikasi mobile berbasis Flutter yang membantu pengguna mengorganisir jadwal harian mereka. Aplikasi ini menampilkan daftar kegiatan harian lengkap dengan waktu dan deskripsi, serta dilengkapi fitur autentikasi (login & lupa password).

Palette warna yang digunakan:
- Hijau muda `#86A788` — warna utama / primary
- Pink lembut `#FFE2E2` — warna latar / background

---

## Daftar Fitur

### Halaman 1 — Login Screen
- [x] Form login dengan field **Email** dan **Password**
- [x] Validasi client-side menggunakan `Form`, `TextFormField`, dan `GlobalKey<FormState>`
  - Email: tidak boleh kosong + format email valid (regex)
  - Password: tidak boleh kosong, minimal 8 karakter, mengandung huruf & angka
- [x] State management dengan `setState`:
  - `isLoading` — tombol berubah jadi loading indicator saat ditekan
  - `errorMessage` — pesan error ditampilkan via Snackbar
  - `isPasswordVisible` — toggle show/hide password
- [x] Navigasi ke Halaman Lupa Password menggunakan `Navigator.pushNamed`
- [x] Navigasi ke Dashboard setelah login sukses
- [x] Mock credential: `helenalyani@gmail.com` / `admin249`

### Halaman 2 — Lupa Password Screen
- [x] Form input email dengan validasi format
- [x] Tombol "Kirim Link Reset" dengan loading state
- [x] Feedback visual via Snackbar setelah submit
- [x] Tombol "Kembali ke Login" menggunakan `Navigator.pop`
- [x] Layout menggunakan `Column`, `Padding`, `SizedBox`, dan `SafeArea`

### Halaman 3 — Dashboard Screen
- [x] `AppBar` dengan judul dan tombol logout (`Icons.logout`)
- [x] Tampilan nama user yang sedang login
- [x] `ListView.builder` menampilkan 12 item jadwal harian dummy
- [x] `Card` dengan shadow, rounded corner, dan padding
- [x] Fungsi logout menggunakan `Navigator.pushNamedAndRemoveUntil`

---

## Screenshot

| Login Screen | Lupa Password | Dashboard |
|:---:|:---:|:---:|
| ![Login](screenshots/loginpage.png) | ![Forgot](screenshots/forgotpassword.png) | ![Dashboard](screenshots/dashboard.png) |

## Cara Menjalankan Aplikasi

### Prasyarat
Pastikan sudah menginstal:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) versi stable terbaru
- Android Studio / VS Code dengan plugin Flutter & Dart
- Emulator Android / iOS atau device fisik

### Langkah-langkah

**1. Clone repository**
```bash
git clone https://github.com/lyanirenggi/uts_mobile_Lyani240706.git
cd uts_mobile_Lyani240706
```

**2. Install semua dependencies**
```bash
flutter pub get
```

**3. Jalankan aplikasi**
```bash
flutter run
```

**4. Login menggunakan akun mock**
```
Email    : helenalyani@gmail.com
Password : admin249
```

---

## Struktur Folder

```
uts_project/
├── lib/
│   ├── main.dart                  # Entry point & konfigurasi route
│   ├── models/
│   │   ├── user_model.dart        # Model data user
│   │   └── schedule_item_model.dart  # Model item jadwal
│   ├── screens/
│   │   ├── login_screen.dart      # Halaman login
│   │   ├── forgot_password_screen.dart  # Halaman lupa password
│   │   └── dashboard_screen.dart  # Halaman dashboard
│   ├── widgets/
│   │   ├── custom_button.dart     # Widget tombol reusable
│   │   └── schedule_card.dart     # Widget card jadwal
│   └── utils/
│       ├── constants.dart         # Warna, string, route constants
│       └── validators.dart        # Fungsi validasi form
├── screenshots/
│   ├── login.png
│   ├── forgot_password.png
│   └── dashboard.png
├── pubspec.yaml
└── README.md
```

---

## Daftar Package yang Digunakan

| Package | Versi | Alasan Penggunaan |
|---|---|---|
| `flutter` (SDK) | stable | Framework utama pengembangan aplikasi |

> Aplikasi ini **tidak menggunakan package tambahan** di luar Flutter SDK bawaan. Semua fitur dibangun menggunakan widget dan library standar Flutter untuk memastikan pemahaman terhadap materi perkuliahan.

---

## Named Routes

| Route Name | Konstanta | Halaman |
|---|---|---|
| `/` | `routeLogin` | Login Screen |
| `/forgot-password` | `routeForgotPassword` | Lupa Password Screen |
| `/dashboard` | `routeDashboard` | Dashboard Screen |

---

## Konsep yang Diimplementasikan
- **Basic Widgets:** `Container`, `Text`, `Icon`, `ElevatedButton`, `TextButton`, `Scaffold`, `AppBar`
- **Layout Widgets:** `Column`, `Row`, `Stack`, `Expanded`, `Padding`, `SizedBox`, `SafeArea`
- **Advanced Widgets:** `TextFormField`, `ListView.builder`, `Card`, `SnackBar`
- **Navigation:** Named Routes dengan `Navigator.pushNamed`, `Navigator.pop`, `Navigator.pushNamedAndRemoveUntil`
- **State Management:** `setState` pada `StatefulWidget`
- **Form Validation:** `Form` + `GlobalKey<FormState>` + `validator`
- **Dart Null Safety:** Aktif (project dibuat dengan Flutter stable)

## Developer

**Nama:** [Helena Putri Lyani Renggi]  
**NIM:** [2401010706]  
**Kelas:** [Kelas O]  
**Mata Kuliah:** Mobile Programming
