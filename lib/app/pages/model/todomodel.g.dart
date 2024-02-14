// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todomodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoModelAdapter extends TypeAdapter<TodoModel> {
  @override
  final int typeId = 1;

  @override
  TodoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoModel(
      Taskname: fields[0] as String?,
      Description: fields[1] as String?,
      CreateDate: fields[2] as DateTime?,
      IsCompleted: fields[3] == null ? false : fields[3] as bool?,
      Id: fields[4] as String?,
      categoryId: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TodoModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.Taskname)
      ..writeByte(1)
      ..write(obj.Description)
      ..writeByte(2)
      ..write(obj.CreateDate)
      ..writeByte(3)
      ..write(obj.IsCompleted)
      ..writeByte(4)
      ..write(obj.Id)
      ..writeByte(5)
      ..write(obj.categoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
