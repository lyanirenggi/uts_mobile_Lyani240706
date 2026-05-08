// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/user_model.dart';
import '../models/schedule_item_model.dart';
import '../widgets/schedule_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Data jadwal harian dummy (minimal 10 item)
  static final List<ScheduleItem> _schedules = [
    ScheduleItem(
      time: '05.00',
      title: 'Bangun Pagi',
      description: 'Mulai hari dengan istirahat yang cukup',
      emoji: '🌅',
    ),
    ScheduleItem(
      time: '05.30',
      title: 'Olahraga Pagi',
      description: 'Jogging atau stretching 30 menit',
      emoji: '🏃',
    ),
    ScheduleItem(
      time: '06.30',
      title: 'Mandi & Siap-siap',
      description: 'Bersiap untuk hari yang produktif',
      emoji: '🚿',
    ),
    ScheduleItem(
      time: '07.00',
      title: 'Sarapan',
      description: 'Makan sehat dan bergizi',
      emoji: '🥗',
    ),
    ScheduleItem(
      time: '08.00',
      title: 'Kuliah',
      description: 'Fokus dan semangat!',
      emoji: '💻',
    ),
    ScheduleItem(
      time: '12.00',
      title: 'Istirahat & Makan Siang',
      description: 'Recharge energi',
      emoji: '🍱',
    ),
    ScheduleItem(
      time: '13.00',
      title: 'Sesi Belajar',
      description: 'Review materi atau tugas',
      emoji: '📚',
    ),
    ScheduleItem(
      time: '15.30',
      title: 'Screen Time Drakor',
      description: 'Jeda sejenak',
      emoji: '🍿',
    ),
    ScheduleItem(
      time: '17.00',
      title: 'Me Time',
      description: 'Waktu untuk diri sendiri',
      emoji: '🎨',
    ),
    ScheduleItem(
      time: '19.00',
      title: 'Makan Malam',
      description: 'Makan',
      emoji: '🍽️',
    ),
    ScheduleItem(
      time: '20.00',
      title: 'Review Hari Ini',
      description: 'Jurnal dan refleksi harian',
      emoji: '📓',
    ),
    ScheduleItem(
      time: '21.30',
      title: 'Persiapan Tidur',
      description: 'Skincare dan istirahat',
      emoji: '🌙',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Ambil data user yang dikirim dari Login
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: kGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Hamoo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false, // sembunyikan tombol back
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              // pushAndRemoveUntil → hapus semua halaman sebelumnya dari stack
              // sehingga user tidak bisa kembali ke dashboard dengan tombol back
              Navigator.pushNamedAndRemoveUntil(
                context,
                routeLogin,
                (route) => false, // hapus semua route
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header sambutan
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              color: kGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Haii, ${user.name}! 👋',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ini jadwal harianmu hari ini ✨',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '📅 Jadwal Hari Ini',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D5A3E),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ListView.builder → tampilkan daftar jadwal
          Expanded(
            child: ListView.builder(
              itemCount: _schedules.length,
              itemBuilder: (context, index) {
                return ScheduleCard(item: _schedules[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
