import 'package:core_kit/utils/app_log.dart';

class CoreDependency {
  static void dependencies() {
    AppLogger.debug('Core dependency initalized', tag: 'dependency');
  }
}
