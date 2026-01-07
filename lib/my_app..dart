import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarage/auth/cubit/auth_cubit.dart';
import 'package:mygarage/auth/cubit/auth_state.dart';
import 'package:mygarage/config/color/app_color.dart';

import 'config/api/api_end_point.dart';
import 'config/route/app_router.dart';
import 'config/route/app_router_observer.dart';

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
            primary: AppColor.primary,
            onPrimary: AppColor.onPrimary,
            secondary: AppColor.textSecondary,
            onSurface: AppColor.onPrimary,
            surface: AppColor.surfaceColor,
            outline: AppColor.outlineColor,
          ),
        ),
        themeMode: ThemeMode.light,
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
