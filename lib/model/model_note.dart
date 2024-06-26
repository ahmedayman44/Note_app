import 'package:hive/hive.dart';

part 'model_note.g.dart';

@HiveType(typeId: 0)
class ModelNote extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  ModelNote({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
  });
}
