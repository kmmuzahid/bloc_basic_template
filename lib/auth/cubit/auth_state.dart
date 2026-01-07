/*
 * @Author: Km Muzahid
 * @Date: 2026-01-07 14:11:36
 * @Email: km.muzahid@gmail.com
 */
class AuthState {
  final String accessToken;
  final String refreshToken;

  AuthState({this.accessToken = '', this.refreshToken = ''});
}
