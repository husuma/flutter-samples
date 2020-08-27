import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_sample/scene/todos_scene.dart';

import 'entity/todo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(MyApp());
}

Future initialize() async {
  final dir = await getApplicationSupportDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(TodoAdapter());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
              textTheme: Theme.of(context).primaryTextTheme.copyWith(
                  title: Theme.of(context)
                      .primaryTextTheme
                      .title
                      .copyWith(fontSize: 32)),
              // iconTheme: Theme.of(context).primaryIconTheme.copyWith(size: 32),
              color: Colors.transparent,
              elevation: 0),
          scaffoldBackgroundColor: Colors.transparent,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.white,
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)))),
      home: TodosScene(),
    );
  }
}
