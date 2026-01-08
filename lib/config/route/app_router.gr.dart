// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:mygarage/coreFeature/auth/screens/login_screen.dart' as _i1;
import 'package:mygarage/coreFeature/auth/screens/sign_up_screen.dart' as _i4;
import 'package:mygarage/coreFeature/onboarding/onboarding_screen.dart' as _i2;
import 'package:mygarage/coreFeature/splash/splash_screen.dart' as _i5;
import 'package:mygarage/coreFeature/terms/privacy_policy_screen.dart' as _i3;
import 'package:mygarage/coreFeature/terms/terms_of_use_screen.dart' as _i6;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute({List<_i7.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i3.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i7.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i7.PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}

/// generated route for
/// [_i6.TermsOfUseScreen]
class TermsOfUseRoute extends _i7.PageRouteInfo<void> {
  const TermsOfUseRoute({List<_i7.PageRouteInfo>? children})
    : super(TermsOfUseRoute.name, initialChildren: children);

  static const String name = 'TermsOfUseRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.TermsOfUseScreen();
    },
  );
}
