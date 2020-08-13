import 'package:flutter/material.dart';
import 'package:router_sample/scene/gradient_scene.dart';
import 'package:router_sample/scene/scene.dart';

class ApplicationRoute {
  static Route<dynamic> build(RouteSettings settings) {
    final scene = SceneBuilder.fromString(settings.name);
    final map = (settings.arguments as Map<String, dynamic>) ?? {};
    final isModal = map['transition_type'] == 'modal';
    if (isModal) {
      return MaterialPageRoute(
          settings: settings, builder: builder(scene), fullscreenDialog: true);
    } else {
      return MaterialPageRoute(settings: settings, builder: builder(scene));
    }
  }

  static WidgetBuilder builder(Scene scene) {
    switch (scene) {
      case Scene.gradient:
        return (context) => GradientScene();
    }
    return (context) => GradientScene();
  }
}
