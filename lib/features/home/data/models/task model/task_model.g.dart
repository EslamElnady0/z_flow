// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 1;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      sideTask: (fields[4] as List).cast<dynamic>(),
      title: fields[0] as String,
      notes: fields[1] as String,
      id: fields[8] as int,
      createdAt: fields[2] as String,
      isDoneBefore: fields[7] as bool,
      deadline: fields[3] as String,
      category: (fields[10] as List).cast<dynamic>(),
      isFavourited: fields[5] as bool,
      doneAt: fields[9] as String,
      isDone: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.notes)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.deadline)
      ..writeByte(4)
      ..write(obj.sideTask)
      ..writeByte(5)
      ..write(obj.isFavourited)
      ..writeByte(6)
      ..write(obj.isDone)
      ..writeByte(7)
      ..write(obj.isDoneBefore)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.doneAt)
      ..writeByte(10)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
