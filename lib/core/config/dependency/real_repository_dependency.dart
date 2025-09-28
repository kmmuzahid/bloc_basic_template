import 'package:bloc_basic_template/common/auth/repository/auth_repository.dart';
import 'package:bloc_basic_template/common/auth/repository/real_auth_repository.dart';
import 'package:bloc_basic_template/core/config/dependency/dependency_injection.dart';
import 'package:bloc_basic_template/core/utils/log/app_log.dart';

class RealRepositoryDependency {
  static void dependencies() {
    getIt.registerLazySingleton<AuthRepository>(RealAuthRepository.new);
    AppLogger.debug('Real repository dependency initalized', tag: 'dependency');
  }
}
