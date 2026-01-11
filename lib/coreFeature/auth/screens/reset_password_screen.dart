/*
 * @Author: Km Muzahid
 * @Date: 2026-01-08 12:44:55
 * @Email: km.muzahid@gmail.com
 */
import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';
import 'package:mygarage/constant/constants.dart';
import 'package:mygarage/coreFeature/common/common_widget.dart';
import 'package:mygarage/gen/assets.gen.dart';

@RoutePage()
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(disableBack: true, hideBack: true),
      body: Padding(
        padding: Constants.bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CommonImage(size: 80, src: Assets.images.appIcon.path)),
            40.height,
            const CommonText(
              text: "Enter your new password below.",
              textColor: Colors.white70,
              fontSize: 16,
            ).center,

            // Password Field
            buildLabel("Password"),
            CommonTextField(
              hintText: "Enter password here...",
              validationType: ValidationType.validatePassword,
              prefixIcon: const Icon(Icons.lock_outline),
              onSaved: (value, controller) {},
            ),
            10.height,
            buildLabel("Confirm Password"),
            CommonTextField(
              hintText: "Enter confirm password here...",
              validationType: ValidationType.validatePassword,
              prefixIcon: const Icon(Icons.lock_outline),
              onSaved: (value, controller) {},
            ),
            10.height,

            // Log In Button
            CommonButton(
              onTap: () {
                appRouter.replaceAll([const LoginRoute()]);
              },
              titleText: "Reset Password",
              buttonWidth: double.infinity,
              buttonRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}
