// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TargetAdapter extends TypeAdapter<Target> {
  @override
  final int typeId = 2;

  @override
  Target read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Target(
      id: fields[0] as int,
      targetName: fields[1] as String,
      nominal: fields[2] as int,
      period: fields[3] as int,
      durationType: fields[4] as String,
      currentMoney: fields[5] as int,
      category: fields[6] as Category,
      priorityLevel: fields[7] as String,
      description: fields[8] as String,
      createdAt: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Target obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.targetName)
      ..writeByte(2)
      ..write(obj.nominal)
      ..writeByte(3)
      ..write(obj.period)
      ..writeByte(4)
      ..write(obj.durationType)
      ..writeByte(5)
      ..write(obj.currentMoney)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.priorityLevel)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TargetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
