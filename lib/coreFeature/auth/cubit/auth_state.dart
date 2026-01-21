/*
 * @Author: Km Muzahid
 * @Date: 2026-01-07 14:11:36
 * @Email: km.muzahid@gmail.com
 */
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String accessToken;
  final String refreshToken;
  final bool isLoading;

  const AuthState({this.accessToken = '', this.refreshToken = '', this.isLoading = false});

  AuthState copyWith({String? accessToken, String? refreshToken, bool? isLoading}) {
    return AuthState(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [accessToken, refreshToken, isLoading];
}
