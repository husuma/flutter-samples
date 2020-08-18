class EnvironmentConfig {
  static const AppName = String.fromEnvironment('DART_DEFINE_APP_NAME');
  static const AppIdSuffix =
      String.fromEnvironment('DART_DEFINE_APP_ID_SUFFIX');
  static const APIHost = String.fromEnvironment('DART_DEFINE_API_HOST');
}
