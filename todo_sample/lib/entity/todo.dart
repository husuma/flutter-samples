import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  String _id = '${DateTime.now().millisecondsSinceEpoch}';
  @HiveField(1)
  final String title;

  get id => _id;
  get createdAt => DateTime.fromMillisecondsSinceEpoch(int.parse(id));

  Todo(this.title);
}
