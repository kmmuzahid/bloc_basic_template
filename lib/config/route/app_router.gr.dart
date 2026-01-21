// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:mygarage/coreFeature/auth/screens/change_password_screen.dart'
    as _i1;
import 'package:mygarage/coreFeature/auth/screens/login_screen.dart' as _i2;
import 'package:mygarage/coreFeature/auth/screens/reset_password_screen.dart'
    as _i8;
import 'package:mygarage/coreFeature/auth/screens/send_otp_screen.dart' as _i9;
import 'package:mygarage/coreFeature/auth/screens/sign_up_screen.dart' as _i10;
import 'package:mygarage/coreFeature/navigation/screens/navigation_screen.dart'
    as _i3;
import 'package:mygarage/coreFeature/notification/notification_screen.dart'
    as _i4;
import 'package:mygarage/coreFeature/onboarding/onboarding_screen.dart' as _i5;
import 'package:mygarage/coreFeature/profile/screens/personal_info_screen.dart'
    as _i7;
import 'package:mygarage/coreFeature/splash/splash_screen.dart' as _i11;
import 'package:mygarage/coreFeature/terms/privacy_policy_screen.dart' as _i6;
import 'package:mygarage/coreFeature/terms/terms_of_use_screen.dart' as _i12;

/// generated route for
/// [_i1.ChangePasswordScreen]
class ChangePasswordRoute extends _i13.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i13.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen();
    },
  );
}

/// generated route for
/// [_i3.NavigationScreen]
class NavigationRoute extends _i13.PageRouteInfo<void> {
  const NavigationRoute({List<_i13.PageRouteInfo>? children})
    : super(NavigationRoute.name, initialChildren: children);

  static const String name = 'NavigationRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.NavigationScreen();
    },
  );
}

/// generated route for
/// [_i4.NotificationScreen]
class NotificationRoute extends _i13.PageRouteInfo<void> {
  const NotificationRoute({List<_i13.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute({List<_i13.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i6.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i13.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i13.PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i8.ResetPasswordScreen]
class ResetPasswordRoute extends _i13.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i14.Key? key,
    required String verificationToken,
    required String email,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(
           key: key,
           verificationToken: verificationToken,
           email: email,
         ),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i8.ResetPasswordScreen(
        key: args.key,
        verificationToken: args.verificationToken,
        email: args.email,
      );
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.verificationToken,
    required this.email,
  });

  final _i14.Key? key;

  final String verificationToken;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, verificationToken: $verificationToken, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return key == other.key &&
        verificationToken == other.verificationToken &&
        email == other.email;
  }

  @override
  int get hashCode =>
      key.hashCode ^ verificationToken.hashCode ^ email.hashCode;
}

/// generated route for
/// [_i9.SendOtpScreen]
class SendOtpRoute extends _i13.PageRouteInfo<SendOtpRouteArgs> {
  SendOtpRoute({
    _i14.Key? key,
    required dynamic Function({required String email, required String token})
    onSuccess,
    required String username,
    bool showSendToField = false,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         SendOtpRoute.name,
         args: SendOtpRouteArgs(
           key: key,
           onSuccess: onSuccess,
           username: username,
           showSendToField: showSendToField,
         ),
         initialChildren: children,
       );

  static const String name = 'SendOtpRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SendOtpRouteArgs>();
      return _i9.SendOtpScreen(
        key: args.key,
        onSuccess: args.onSuccess,
        username: args.username,
        showSendToField: args.showSendToField,
      );
    },
  );
}

class SendOtpRouteArgs {
  const SendOtpRouteArgs({
    this.key,
    required this.onSuccess,
    required this.username,
    this.showSendToField = false,
  });

  final _i14.Key? key;

  final dynamic Function({required String email, required String token})
  onSuccess;

  final String username;

  final bool showSendToField;

  @override
  String toString() {
    return 'SendOtpRouteArgs{key: $key, onSuccess: $onSuccess, username: $username, showSendToField: $showSendToField}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SendOtpRouteArgs) return false;
    return key == other.key &&
        username == other.username &&
        showSendToField == other.showSendToField;
  }

  @override
  int get hashCode =>
      key.hashCode ^ username.hashCode ^ showSendToField.hashCode;
}

/// generated route for
/// [_i10.SignUpScreen]
class SignUpRoute extends _i13.PageRouteInfo<void> {
  const SignUpRoute({List<_i13.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.SplashScreen();
    },
  );
}

/// generated route for
/// [_i12.TermsOfUseScreen]
class TermsOfUseRoute extends _i13.PageRouteInfo<void> {
  const TermsOfUseRoute({List<_i13.PageRouteInfo>? children})
    : super(TermsOfUseRoute.name, initialChildren: children);

  static const String name = 'TermsOfUseRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.TermsOfUseScreen();
    },
  );
}
