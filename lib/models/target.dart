import 'package:hive/hive.dart';
import 'category.dart';

part 'target.g.dart';

@HiveType(typeId: 2)
class Target {
  @HiveField(0)
  int id;

  @HiveField(1)
  final String targetName;

  @HiveField(2)
  final int nominal;

  @HiveField(3)
  final int period;

  @HiveField(4)
  final String durationType;

  @HiveField(5)
  final int currentMoney;

  @HiveField(6)
  final Category category;

  @HiveField(7)
  final String priorityLevel;

  @HiveField(8)
  final String description;

  @HiveField(9)
  final int createdAt;

  Target({
    this.id,
    this.targetName,
    this.nominal,
    this.period,
    this.durationType,
    this.currentMoney,
    this.category,
    this.priorityLevel,
    this.description,
    this.createdAt,
  });

  static void storeTarget(Target target) {
    Box<Target> targetBox = Hive.box<Target>("targets");
    targetBox.add(target);
  }

  static void updateCurrentMoney(int index, Target target, int nominal) {
    Box<Target> targetBox = Hive.box<Target>("targets");
    targetBox.putAt(index, Target(
      targetName: target.targetName,
      nominal: target.nominal,
      period: target.period,
      durationType: target.durationType,
      currentMoney: target.currentMoney + nominal,
      category: target.category,
      priorityLevel: target.priorityLevel,
      description: target.description,
      createdAt: target.createdAt,
    ));
  }

  static void updateTarget(int index, Target target) {
    Box<Target> targetBox = Hive.box<Target>("targets");
    targetBox.putAt(index, Target(
      targetName: target.targetName,
      nominal: target.nominal,
      period: target.period,
      durationType: target.durationType,
      currentMoney: target.currentMoney,
      category: target.category,
      priorityLevel: target.priorityLevel,
      description: target.description,
      createdAt: target.createdAt,
    ));
  }

  static void deleteTarget(int index) {
    Box<Target> targetBox = Hive.box<Target>("targets");
    targetBox.deleteAt(index);
  }
}
