/*
 * @Author: Km Muzahid
 * @Date: 2026-01-07 15:57:37
 * @Email: km.muzahid@gmail.com
 */
import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/coreFeature/auth/cubit/auth_cubit.dart';
import 'package:mygarage/gen/assets.gen.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().init();
    });
    return Scaffold(
      body: Stack(
        children: [
          const CommonAppBar(
            disableBack: true,
            hideBack: true,
            backgroundColor: Colors.transparent,
          ),
          Positioned.fill(child: Container(color: AppColor.background)),
          CoreSpotlight(
            center: Offset(
              MediaQuery.of(context).size.width / 2,
              (MediaQuery.of(context).size.height / 2) - 50,
            ),
            radius: MediaQuery.of(context).size.width * .8,
            color: AppColor.primary.withValues(alpha: .5),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonImage(size: 80, src: Assets.images.appIcon.path, fill: BoxFit.cover),
                const CommonText(
                  text: "My Garage",
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 4),
                CommonText(
                  text: "Vote. Rank. Win.",
                  fontSize: 20,
                  textColor: AppColor.textSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
