// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FatModelAdapter extends TypeAdapter<FatModel> {
  @override
  final typeId = 0;

  @override
  FatModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FatModel(
      date: fields[0] as DateTime,
      fatResult: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FatModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.fatResult);
  }
}
