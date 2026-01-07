/*
 * @Author: Km Muzahid
 * @Date: 2026-01-07 14:10:08
 * @Email: km.muzahid@gmail.com
 */
import 'package:mygarage/config/bloc/safe_cubit.dart';

import 'auth_state.dart';

class AuthCubit extends SafeCubit<AuthState> {
  AuthCubit() : super(AuthState());

  void updateTokens(String accessToken, String refreshToken) {
    emit(AuthState(accessToken: accessToken, refreshToken: refreshToken));
  }

  void logout() {
    emit(AuthState());
  }
}
