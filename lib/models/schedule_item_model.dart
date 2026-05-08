// lib/models/schedule_item_model.dart

class ScheduleItem {
  final String time;
  final String title;
  final String description;
  final String emoji;

  ScheduleItem({
    required this.time,
    required this.title,
    required this.description,
    required this.emoji,
  });
}
