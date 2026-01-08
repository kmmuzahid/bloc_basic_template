/*
 * @Author: Km Muzahid
 * @Date: 2026-01-08 12:44:55
 * @Email: km.muzahid@gmail.com
 */
import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';
import 'package:mygarage/coreFeature/auth/widgets/action_spawn_widget.dart';
import 'package:mygarage/coreFeature/auth/widgets/terms_agreement_widget.dart';
import 'package:mygarage/coreFeature/common/common_widget.dart';
import 'package:mygarage/gen/assets.gen.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(disableBack: true, hideBack: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CommonImage(size: 80, src: Assets.images.appIcon.path)),
            40.height,
            CommonText(
              text: "Create Your Account",
              textColor: AppColor.onPrimary,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ).center,
            const CommonText(
              text: "Join the ultimate car ranking community",
              textColor: Colors.white70,
              fontSize: 16,
            ).center,
            40.height,

            // Email Field
            buildLabel("Full Name"),
            CommonTextField(
              hintText: "Enter full Name",
              validationType: ValidationType.validateRequired,
              prefixIcon: const Icon(Icons.email_outlined),
              onSaved: (value, controller) {},
            ),
            20.height,
            // Email Field
            buildLabel("Email Address"),
            CommonTextField(
              hintText: "Enter email address",
              validationType: ValidationType.validateEmail,
              prefixIcon: const Icon(Icons.email_outlined),
              onSaved: (value, controller) {},
            ),
            20.height,

            // Password Field
            buildLabel("Password"),
            CommonTextField(
              hintText: "Enter password",
              validationType: ValidationType.validatePassword,
              prefixIcon: const Icon(Icons.lock_outline),
              onSaved: (value, controller) {},
            ),
            20.height,

            // Password Field
            buildLabel("Confirm Password"),
            CommonTextField(
              hintText: "Enter confirm password",
              validationType: ValidationType.validatePassword,
              prefixIcon: const Icon(Icons.lock_outline),
              onSaved: (value, controller) {},
            ),
            20.height,

            CommonButton(
              onTap: () {},
              titleText: "Log In",
              buttonWidth: double.infinity,
              buttonRadius: 40,
            ),

            30.height,
            const TermsAgreementWidget(),

            ActionSpawnWidget(
              title: 'Already have an account?',
              actionTitle: 'Log In',
              onTap: () {
                appRouter.replace(const LoginRoute());
              },
            ).center,
            50.height,
          ],
        ),
      ),
    );
  }
}
