/*
 * @Author: Km Muzahid
 * @Date: 2026-01-08 12:44:55
 * @Email: km.muzahid@gmail.com
 */
import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/common_widgets/common_widget.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';
import 'package:mygarage/constant/constants.dart';
import 'package:mygarage/coreFeature/notification/notification_button.dart';
import 'package:mygarage/gen/assets.gen.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Change Password", actions: [NotificationIconWidget()]),
      body: Padding(
        padding: Constants.bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.height,
            CommonImage(size: 80, src: Assets.images.appIcon.path).center,
            const CommonText(
              text: "Set Your Password",
              textColor: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ).center,
            const CommonText(
              text: "In order to keep your account safe you need to create a strong password.",
              maxLines: 2,
              textAlign: TextAlign.center,
              textColor: Colors.white,
              fontSize: 16,
            ),
            20.height,

            // Password Field
            buildLabel("Current password"),
            CommonTextField(
              hintText: "Enter current password here...",
              validationType: ValidationType.validatePassword,
              prefixIcon: const Icon(Icons.lock_outline),
              onSaved: (value, controller) {},
            ),
            10.height,
            buildLabel("New password"),
            CommonTextField(
              hintText: "Enter new password here...",
              validationType: ValidationType.validatePassword,
              prefixIcon: const Icon(Icons.lock_outline),
              onSaved: (value, controller) {},
            ),
            10.height,
            buildLabel("Confirm new password"),
            CommonTextField(
              hintText: "Enter confirm new password here...",
              validationType: ValidationType.validatePassword,
              prefixIcon: const Icon(Icons.lock_outline),
              onSaved: (value, controller) {},
            ),
            30.height,

            CommonButton(
              onTap: () {
                appRouter.replaceAll([const LoginRoute()]);
              },
              titleText: "Change Password",
              buttonWidth: double.infinity,
              buttonRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}
