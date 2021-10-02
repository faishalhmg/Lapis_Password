// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasswordItemAdapter extends TypeAdapter<PasswordItem> {
//Missing

  @override
  final int typeId = 0;
//Missing

  @override
  PasswordItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasswordItem(
      id: fields[0] as String,
      name: fields[1] as String,
      username: fields[2] as String,
      password: fields[3] as String,
      importantCode: fields[4] as String,
      desc: fields[5] as String,
      date: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordItem obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.importantCode)
      ..writeByte(5)
      ..write(obj.desc)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
