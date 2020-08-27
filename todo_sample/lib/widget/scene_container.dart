import 'package:flutter/material.dart';

class SceneContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> appBarActions;

  SceneContainer({this.title = '', this.appBarActions, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepOrange, Colors.deepPurpleAccent])),
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              actions: appBarActions,
            ),
            body: child));
  }
}
