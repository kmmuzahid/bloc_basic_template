import 'package:core_kit/core_kit.dart';

class MockRepositoryDependency {
  static void dependencies() {
    AppLogger.debug('Mock repository dependency initalized', tag: 'dependency');
  }
}
