/*
 * @Author: Km Muzahid
 * @Date: 2026-01-08 10:38:30
 * @Email: km.muzahid@gmail.com
 */

import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';
import 'package:mygarage/coreFeature/auth/widgets/action_spawn_widget.dart';
import 'package:mygarage/gen/assets.gen.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBar(backgroundColor: Colors.transparent),
          // 1. Background Image Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: CommonImage(src: Assets.images.sample1.path),
          ),

          // 2. Content Card Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColor.background.withValues(alpha: .9), AppColor.background],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                children: [
                  10.height,

                  CommonText(
                    text: "Time To Get Your",
                    textColor: AppColor.onPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  CommonText(
                    text: "Car Ranked.",
                    textColor: AppColor.primary,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  20.height,

                  // Subtitle
                  CommonText(
                    text:
                        "Discover exclusive builds, vote on the best designs, and earn rewards as you climb the ranks of the car community.",
                    textAlign: TextAlign.center,
                    textColor: AppColor.onPrimary,
                    maxLines: 5,
                    fontSize: 15,
                    height: 1.5,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFeatureIcon(Icons.directions_car_filled_outlined, "Discover"),
                      _buildFeatureIcon(Icons.how_to_vote_outlined, "Vote"),
                      _buildFeatureIcon(Icons.leaderboard_outlined, "Rank Up"),
                    ],
                  ),
                  20.height,

                  CommonButton(
                    buttonWidth: double.infinity,
                    buttonRadius: 40,
                    titleText: "Get Started",
                    onTap: () {
                      appRouter.replace(const SignUpRoute());
                    },
                  ),
                  20.height,

                  ActionSpawnWidget(
                    title: 'Already have an account?',
                    actionTitle: 'Log In',
                    onTap: () {
                      appRouter.replace(const LoginRoute());
                    },
                  ),
                  20.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), shape: BoxShape.circle),
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
