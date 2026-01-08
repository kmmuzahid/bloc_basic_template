/*
 * @Author: Km Muzahid
 * @Date: 2026-01-07 15:37:37
 * @Email: km.muzahid@gmail.com
 */
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarage/config/api/api_end_point.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router_observer.dart';
import 'package:mygarage/coreFeature/auth/cubit/auth_cubit.dart';
import 'package:mygarage/coreFeature/auth/cubit/auth_state.dart';
import 'package:mygarage/gen/assets.gen.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(); // or ClampingScrollPhysics, etc.
  }

  @override
  ScrollViewKeyboardDismissBehavior getKeyboardDismissBehavior(BuildContext context) {
    return ScrollViewKeyboardDismissBehavior.onDrag;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => ThemeCubit()..update(), lazy: false),
        // BlocProvider(create: (_) => LanguageCubit()..init(), lazy: false),
        BlocProvider(create: (_) => AuthCubit()),
      ],
      child: MaterialApp.router(
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(navigatorObservers: () => [AppRouterObserver()]),
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: AppColor.background,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.primary,
            primary: AppColor.primary, // button
            onPrimary: AppColor.onPrimary, // text on button
            secondary: AppColor.textSecondary, // unselected radio
            onSurface: AppColor.onPrimary, //text on card
            surface: AppColor.surfaceColor, //card color
            outline: AppColor.outlineColor, // border color
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: AppColor.outlineColor, width: 1),
            ),
            hintStyle: TextStyle(
              color: AppColor.textSecondary,
              fontStyle: FontStyle.normal,
            ), //hint and prefix color
          ),
        ),
        themeMode: ThemeMode.dark,
        builder: (context, child) {
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return CoreKit.init(
                back: () {
                  appRouter.pop();
                },
                designSize: const Size(393, 690),
                imageBaseUrl: ApiEndPoint.instance.baseUrl,
                navigatorKey: appRouter.navigatorKey,
                backButton: CommonImage(size: 40, src: Assets.images.back),
                dioServiceConfig: DioServiceConfig(
                  baseUrl: ApiEndPoint.instance.baseUrl,
                  refreshTokenEndpoint: ApiEndPoint.instance.refreshTokenEndpoint,
                  onLogout: () {},
                  enableDebugLogs: true,
                ),
                tokenProvider: TokenProvider(
                  accessToken: () => state.accessToken,
                  refreshToken: () => state.refreshToken,
                  updateTokens: (accessToken, refreshToken) async {
                    context.read<AuthCubit>().updateTokens(accessToken, refreshToken);
                  },
                  clearTokens: () async {
                    context.read<AuthCubit>().logout();
                  },
                ),
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
