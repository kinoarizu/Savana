import 'package:hive/hive.dart';

part 'history.g.dart';

@HiveType(typeId: 1)
class History {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String targetName;

  @HiveField(2)
  final int nominal;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final int createdAt;

  History({
    this.id,
    this.targetName,
    this.nominal,
    this.description,
    this.createdAt,
  });

  static void storeHistory(History history) {
    Box<History> historyBox = Hive.box<History>("histories");
    historyBox.add(history);
  }
}
