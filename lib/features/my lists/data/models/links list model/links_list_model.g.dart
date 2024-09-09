// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LinksListModelAdapter extends TypeAdapter<LinksListModel> {
  @override
  final int typeId = 6;

  @override
  LinksListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LinksListModel(
      name: fields[0] as String,
      links: (fields[1] as List).cast<LinkItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, LinksListModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.links);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinksListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
