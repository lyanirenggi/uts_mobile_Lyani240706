// lib/widgets/schedule_card.dart
import 'package:flutter/material.dart';
import '../models/schedule_item_model.dart';
import '../utils/constants.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleItem item;

  const ScheduleCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // rounded corner
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Emoji / ikon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: kPink,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(item.emoji, style: const TextStyle(fontSize: 22)),
              ),
            ),
            const SizedBox(width: 12),
            // Info jadwal
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.time,
                    style: TextStyle(
                      color: kDarkGreen,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.description,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
