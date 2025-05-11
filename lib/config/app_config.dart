import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment {
  dev('dev'),
  staging('staging'),
  prod('prod');

  final String label;

  const Environment(this.label);

  static Environment fromString(String value) {
    return Environment.values.firstWhere(
      (e) => e.label == value.toLowerCase(),
      orElse: () => Environment.dev,
    );
  }
}

class AppConfig {
  final Environment env;
  final String localDatabaseName;

  const AppConfig({
    required this.env,
    required this.localDatabaseName,
  });

  /// Loads the AppConfig for the current environment.
  ///
  /// This method does the following:
  /// 1. Reads the environment name from the compile-time constant `--dart-define=ENV=...`.
  /// 2. Converts the string into a strongly-typed [Environment] enum.
  /// 3. Loads the corresponding `.env` file (e.g., `.env.dev`, `.env.staging`, `.env.prod`).
  /// 4. Builds and returns an [AppConfig] instance using values from the `.env` file.
  static Future<AppConfig> load() async {
    // Read environment from --dart-define=ENV=dev (fallback to dev)
    String envName = String.fromEnvironment('ENV', defaultValue: Environment.dev.label);
    final env = Environment.fromString(envName);

    // Load corresponding .env file: .env.dev, .env.staging, .env.prod
    await dotenv.load(fileName: 'lib/.$envName.env');

    return AppConfig(
      env: env,
      localDatabaseName: dotenv.get('LOCAL_DATABASE_NAME', fallback: 'fides_dev'),
    );
  }
}
