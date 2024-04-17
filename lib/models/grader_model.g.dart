// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grader_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GraderAdapter extends TypeAdapter<Grader> {
  @override
  final int typeId = 3;

  @override
  Grader read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Grader(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Grader obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.playerId)
      ..writeByte(2)
      ..write(obj.rightAnswer)
      ..writeByte(3)
      ..write(obj.wrongAnswer)
      ..writeByte(4)
      ..write(obj.whiteAnswer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
