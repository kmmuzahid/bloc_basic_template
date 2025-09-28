import 'package:bloc_basic_template/common/auth/repository/auth_repository.dart';
import 'package:bloc_basic_template/common/auth/repository/mock_auth_repository.dart';
import 'package:bloc_basic_template/core/config/dependency/dependency_injection.dart';
import 'package:bloc_basic_template/core/utils/log/app_log.dart';

class MockRepositoryDependency {
  static void dependencies() {
    getIt.registerLazySingleton<AuthRepository>(MockAuthRepository.new);

    AppLogger.debug('Mock repository dependency initalized', tag: 'dependency');
  }
}
