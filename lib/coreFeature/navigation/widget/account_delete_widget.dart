/*
 * @Author: Km Muzahid
 * @Date: 2026-01-15 16:07:07
 * @Email: km.muzahid@gmail.com
 */
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';

class AccountDeleteWidget extends StatelessWidget {
  const AccountDeleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.surfaceColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: .min,
        children: [
          const CommonText(
            text: "Are you sure you want to delete your account?",
            maxLines: 2,
            textColor: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          10.height,

          const CommonText(
            text:
                "Please be aware that Deleted account cannot be undone. All your data will be lost.",
            maxLines: 2,
            textColor: Colors.white,
            fontSize: 16,
          ),

          10.height,
          const CommonText(
            text: "Enter your password to confirm.",
            textColor: Colors.white,
            fontSize: 14,
          ).start,
          8.height,
          CommonTextField(
            borderColor: AppColor.background,
            hintText: "Enter your password",
            validationType: ValidationType.validatePassword,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: const Icon(Icons.visibility_off_outlined), 
          ),

          20.height,

          Row(
            children: [
              CommonButton(
                titleText: "Cancel",
                onTap: () {
                  navigatorRouterKey.currentState?.pop();
                },
                buttonColor: Colors.transparent,
                borderColor: AppColor.outlineColor,
              ),

              const Spacer(),
              CommonButton(
                titleText: "Delete",
                onTap: () {
                  appRouter.replace(const LoginRoute());
                },
                titleColor: Colors.red,
                buttonColor: Colors.transparent,
                borderColor: Colors.red,
              ),
            ],
          ),
          20.height,
        ],
      ),
    );
  }
}
