import 'package:hive/hive.dart';

part 'todomodel.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  TodoModel(
      {required this.Taskname,
      required this.Description,
      required this.CreateDate,
      required this.IsCompleted,
      required this.Id,
      this.categoryId});

  @HiveField(0)
  String? Taskname;

  @HiveField(1)
  String? Description;

  @HiveField(2)
  DateTime? CreateDate;

  @HiveField(3, defaultValue: false)
  bool? IsCompleted;

  @HiveField(4)
  String? Id;

  @HiveField(5)
  int? categoryId;
}
