import 'dart:math';
import 'package:flutter/material.dart';
import 'package:router_sample/scene/scene.dart';

class GradientScene extends StatelessWidget {
  final random = Random();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
              Color.fromARGB(255, random.nextInt(255), random.nextInt(128),
                  random.nextInt(128)),
              Color.fromARGB(255, random.nextInt(128), random.nextInt(255),
                  random.nextInt(128)),
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Gradient Scene'),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gradient Scene',
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .apply(color: Colors.white)),
                    SizedBox(height: 16),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              Scene.gradient.toString(),
                              arguments: {'transition_type': 'modal'});
                        },
                        color: Colors.white,
                        child: Text('MODAL',
                            style: Theme.of(context).textTheme.headline6)),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Scene.gradient.toString());
                        },
                        color: Colors.white,
                        child: Text('PUSH',
                            style: Theme.of(context).textTheme.headline6))
                  ]),
            )));
  }
}
