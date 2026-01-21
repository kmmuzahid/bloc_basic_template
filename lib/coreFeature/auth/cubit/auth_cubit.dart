/*
 * @Author: Km Muzahid
 * @Date: 2026-01-07 14:10:08
 * @Email: km.muzahid@gmail.com
 */
import 'package:mygarage/config/bloc/safe_cubit.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart'
    show LoginRoute, NavigationRoute, OnboardingRoute;
import 'package:mygarage/config/storage/storage_key.dart';
import 'package:mygarage/coreFeature/auth/cubit/auth_state.dart';
import 'package:mygarage/coreFeature/auth/repository/auth_repository.dart';

class AuthCubit extends SafeCubit<AuthState> {
  AuthCubit() : super(const AuthState());
  final _delaySplash = const Duration(seconds: 3);
  final AuthRepository _authRepository = AuthRepository();

  Future<void> init() async {
    // await StorageService.instance.clearDb();
    await Future.delayed(_delaySplash);

    final accessToken = await StorageService.instance.accessToken;
    final refreshToken = await StorageService.instance.refreshToken;
    if ((accessToken?.isNotEmpty ?? false) && (refreshToken?.isNotEmpty ?? false)) {
      emit(AuthState(accessToken: accessToken!, refreshToken: refreshToken!));
      appRouter.replaceAll([const NavigationRoute()]);
    } else {
      appRouter.replace(const OnboardingRoute());
    }
  }

  Future<void> updateTokens(String accessToken, String refreshToken) async {
    emit(AuthState(accessToken: accessToken, refreshToken: refreshToken));
    StorageService.instance.accessToken = accessToken;
    StorageService.instance.refreshToken = refreshToken;
  }

  void logout() async {
    final result = await _authRepository.logout(
      refreshToken: state.refreshToken,
      accessToken: state.accessToken,
    );
    if (result.isSuccess) {
      clearTokens();
    }
  }

  void clearTokens() async {
    await StorageService.instance.clearDb();
    emit(const AuthState());
    appRouter.replaceAll([const LoginRoute()]);
  }
}
