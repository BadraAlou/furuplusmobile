// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReservationAdapter extends TypeAdapter<ReservationHiveModel> {
  @override
  final int typeId = 0;

  @override
  ReservationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReservationHiveModel(
      packId: fields[0] as int,
      date: fields[1] as String,
      firstName: fields[2] as String,
      lastName: fields[3] as String,
      phoneNumber: fields[4] as String,
      weddingDate: fields[5] as String,
      address: fields[6] as String,
      packName: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReservationHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.packId)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.weddingDate)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.packName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
