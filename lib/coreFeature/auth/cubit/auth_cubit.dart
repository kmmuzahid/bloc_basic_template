/*
 * @Author: Km Muzahid
 * @Date: 2026-01-07 14:10:08
 * @Email: km.muzahid@gmail.com
 */
import 'package:mygarage/config/bloc/safe_cubit.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart' show OnboardingRoute;
import 'package:mygarage/coreFeature/auth/cubit/auth_state.dart';

class AuthCubit extends SafeCubit<AuthState> {
  AuthCubit() : super(AuthState());
  final _delaySplash = const Duration(seconds: 3);

  Future<void> init() async {
    await Future.delayed(_delaySplash);
    appRouter.replace(const OnboardingRoute());
  }

  void updateTokens(String accessToken, String refreshToken) {
    emit(AuthState(accessToken: accessToken, refreshToken: refreshToken));
  }

  void logout() {
    emit(AuthState());
  }
}
