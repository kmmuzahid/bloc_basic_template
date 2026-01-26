/*
 * @Author: Km Muzahid
 * @Date: 2026-01-07 15:37:37
 * @Email: km.muzahid@gmail.com
 */
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarage/common_widgets/build_circular_icon.dart';
import 'package:mygarage/config/api/api_end_point.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router_observer.dart';
import 'package:mygarage/config/storage/storage_key.dart';
import 'package:mygarage/coreFeature/auth/cubit/auth_cubit.dart';
import 'package:mygarage/coreFeature/auth/cubit/auth_state.dart';
import 'package:mygarage/coreFeature/navigation/cubit/navigation_cubit.dart';
import 'package:mygarage/coreFeature/notification/cubit/notification_cubit.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
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
        BlocProvider(create: (_) => NotificationCubit()),
        BlocProvider(create: (_) => NavigationCubit()),
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
            primary: AppColor.primary, // button, Snackbar Info
            onPrimary: AppColor.onPrimary, // text on button
            secondary: AppColor.textSecondary, // unselected radio
            onSurface: AppColor.onPrimary, //text on card
            surface: AppColor.surfaceColor, //card color, SnackBar Background
            outline: AppColor.outlineColor, // border color 
            tertiary: const Color(0xFFF59E0B), // SnackBar Warning
            error: const Color(0xFFEF4444), // SnackBar Error
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: AppColor.outlineColor, width: 1.5),
            ),
            hintStyle: TextStyle(
              color: AppColor.textSecondary,
              fontStyle: FontStyle.normal,
            ), //hint and prefix color
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(80, 50),
              backgroundColor: AppColor.primary, //button background
              foregroundColor: Colors.orangeAccent, //loader color
              textStyle: const TextStyle(color: Colors.white), //title color
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1.5, color: Colors.transparent),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
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
                scaffoldMessangeKey: scaffoldMessengerKey,
                backButton: buildCircularButton(
                  onTap: () {
                    appRouter.pop();
                  },
                  child: const Icon(Icons.arrow_back_ios_new, size: 20),
                ),
                dioServiceConfig: DioServiceConfig(
                  baseUrl: ApiEndPoint.instance.baseUrl,
                  refreshTokenEndpoint: ApiEndPoint.instance.refreshTokenEndpoint,
                  onLogout: () {
                    context.read<AuthCubit>().clearTokens();
                  },
                  enableDebugLogs: true,
                ),
                tokenProvider: TokenProvider(
                  accessToken: () async => (await StorageService.instance.accessToken) ?? '',
                  refreshToken: () async {
                    AppLogger.debug(
                      (await StorageService.instance.refreshToken).toString(),
                      tag: 'refreshToken',
                    );
                    return (await StorageService.instance.refreshToken) ?? '';
                  },
                  updateTokens: (data) async { 
                    AppLogger.debug('Update Tokens', tag: 'updateTokens');
                    await context.read<AuthCubit>().updateTokens(
                      data['accessToken'],
                      data['refreshToken'],
                    );
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
