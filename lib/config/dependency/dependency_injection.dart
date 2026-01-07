import 'package:get_it/get_it.dart';

import 'core_dependency.dart';
import 'mock_repository_dependency.dart';
import 'real_repository_dependency.dart';

GetIt getIt = GetIt.instance;

class DependencyInjection {
  void dependencies() {
    CoreDependency.dependencies();

    //repositroy
    MockRepositoryDependency.dependencies();
    RealRepositoryDependency.dependencies();
  }
}
