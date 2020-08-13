enum Scene {
  gradient,
}

class SceneBuilder {
  static Scene fromString(String value) {
    return Scene.values.firstWhere((e) => e.toString() == value);
  }
}
