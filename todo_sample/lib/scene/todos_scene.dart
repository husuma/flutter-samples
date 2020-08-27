import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample/entity/todo.dart';
import 'package:todo_sample/scene/todo_create_scene.dart';
import 'package:todo_sample/widget/scene_container.dart';

class TodosScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SceneContainer(
      title: 'TODO',
      child: ChangeNotifierProvider<TodosSceneModel>(
          create: (_) => TodosSceneModel(),
          child: Consumer<TodosSceneModel>(builder: (context, model, child) {
            return Column(
              children: [
                SizedBox(height: 32),
                Flexible(
                    child: ListView.builder(
                        itemCount: model.box?.length ?? 0,
                        itemBuilder: (context, index) {
                          final todo = model.box?.getAt(index);
                          return Card(
                            child: ListTile(
                                title: Text('${todo.title}'),
                                trailing: IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {
                                    model.box?.delete(todo.id);
                                  },
                                )),
                          );
                        }))
              ],
            );
          })),
      appBarActions: [
        IconButton(
            iconSize: 32,
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, animation2) =>
                      TodoCreateScene(),
                  transitionsBuilder: (context, animation, animation2, child) =>
                      FadeTransition(opacity: animation, child: child),
                  fullscreenDialog: true));
            })
      ],
    );
  }
}

class TodosSceneModel extends ChangeNotifier {
  Box<Todo> box;

  TodosSceneModel() {
    Hive.openBox<Todo>((Todo).toString()).then((value) {
      value.watch().listen((event) {
        notifyListeners();
      });
      this.box = value;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    box.close();
  }
}
