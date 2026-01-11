// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:mygarage/coreFeature/auth/screens/login_screen.dart' as _i1;
import 'package:mygarage/coreFeature/auth/screens/reset_password_screen.dart'
    as _i5;
import 'package:mygarage/coreFeature/auth/screens/send_otp_screen.dart' as _i6;
import 'package:mygarage/coreFeature/auth/screens/sign_up_screen.dart' as _i7;
import 'package:mygarage/coreFeature/onboarding/onboarding_screen.dart' as _i3;
import 'package:mygarage/coreFeature/splash/splash_screen.dart' as _i8;
import 'package:mygarage/coreFeature/terms/privacy_policy_screen.dart' as _i4;
import 'package:mygarage/coreFeature/terms/terms_of_use_screen.dart' as _i9;
import 'package:mygarage/navigation/screens/navigation_screen.dart' as _i2;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.NavigationScreen]
class NavigationRoute extends _i10.PageRouteInfo<void> {
  const NavigationRoute({List<_i10.PageRouteInfo>? children})
    : super(NavigationRoute.name, initialChildren: children);

  static const String name = 'NavigationRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.NavigationScreen();
    },
  );
}

/// generated route for
/// [_i3.OnboardingScreen]
class OnboardingRoute extends _i10.PageRouteInfo<void> {
  const OnboardingRoute({List<_i10.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i4.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i10.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i10.PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i5.ResetPasswordScreen]
class ResetPasswordRoute extends _i10.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i10.PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.ResetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i6.SendOtpScreen]
class SendOtpRoute extends _i10.PageRouteInfo<SendOtpRouteArgs> {
  SendOtpRoute({
    _i11.Key? key,
    required Function onSuccess,
    required String title,
    required String username,
    bool isSignup = false,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         SendOtpRoute.name,
         args: SendOtpRouteArgs(
           key: key,
           onSuccess: onSuccess,
           title: title,
           username: username,
           isSignup: isSignup,
         ),
         initialChildren: children,
       );

  static const String name = 'SendOtpRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SendOtpRouteArgs>();
      return _i6.SendOtpScreen(
        key: args.key,
        onSuccess: args.onSuccess,
        title: args.title,
        username: args.username,
        isSignup: args.isSignup,
      );
    },
  );
}

class SendOtpRouteArgs {
  const SendOtpRouteArgs({
    this.key,
    required this.onSuccess,
    required this.title,
    required this.username,
    this.isSignup = false,
  });

  final _i11.Key? key;

  final Function onSuccess;

  final String title;

  final String username;

  final bool isSignup;

  @override
  String toString() {
    return 'SendOtpRouteArgs{key: $key, onSuccess: $onSuccess, title: $title, username: $username, isSignup: $isSignup}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SendOtpRouteArgs) return false;
    return key == other.key &&
        onSuccess == other.onSuccess &&
        title == other.title &&
        username == other.username &&
        isSignup == other.isSignup;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      onSuccess.hashCode ^
      title.hashCode ^
      username.hashCode ^
      isSignup.hashCode;
}

/// generated route for
/// [_i7.SignUpScreen]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute({List<_i10.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}

/// generated route for
/// [_i9.TermsOfUseScreen]
class TermsOfUseRoute extends _i10.PageRouteInfo<void> {
  const TermsOfUseRoute({List<_i10.PageRouteInfo>? children})
    : super(TermsOfUseRoute.name, initialChildren: children);

  static const String name = 'TermsOfUseRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.TermsOfUseScreen();
    },
  );
}
