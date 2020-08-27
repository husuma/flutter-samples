import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample/entity/todo.dart';
import 'package:todo_sample/widget/scene_container.dart';

class TodoCreateScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SceneContainer(
        title: 'Create TODO',
        child: ChangeNotifierProvider<TodoCreateSceneModel>(
            create: (_) => TodoCreateSceneModel(),
            child: Consumer<TodoCreateSceneModel>(
                builder: (context, model, child) {
              return Center(
                  child: Column(
                children: [
                  SizedBox(height: 64),
                  Padding(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: TextField(
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(hintText: 'Input your todo.'),
                      onChanged: (value) {
                        model.todo = value;
                      },
                    ),
                  ),
                  SizedBox(height: 32),
                  FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        if (model.hasTodo() && model.box != null) {
                          final todo = Todo(model.todo);
                          model.box.put(todo.id, todo);
                          Navigator.of(context).pop();
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('No Input'),
                                  content: Text('Todoを入力してください。'),
                                  actions: [
                                    RaisedButton(
                                        child: Text('OK',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1),
                                        onPressed: () =>
                                            Navigator.of(context).pop(context))
                                  ],
                                );
                              });
                        }
                      },
                      child: Text('CREATE',
                          style: Theme.of(context).textTheme.headline6))
                ],
              ));
            })));
  }
}

class TodoCreateSceneModel extends ChangeNotifier {
  String todo = '';
  bool hasTodo() => todo.isNotEmpty;

  Box<Todo> box;

  TodoCreateSceneModel() {
    Hive.openBox<Todo>((Todo).toString()).then((value) => this.box = value);
  }
}
