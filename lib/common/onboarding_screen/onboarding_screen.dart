import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bloc_basic_template/common/auth/screen/otp_screen.dart';
import 'package:bloc_basic_template/common/auth/widgets/common_logo.dart';
import 'package:bloc_basic_template/core/component/button/common_button.dart';

import 'package:bloc_basic_template/core/component/text/common_text.dart';
import 'package:bloc_basic_template/core/config/languages/cubit/language_cubit.dart';
import 'package:bloc_basic_template/core/config/route/app_router.dart';
import 'package:bloc_basic_template/core/config/route/app_router.gr.dart';
import 'package:bloc_basic_template/core/utils/extensions/extension.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            const Spacer(),
            const Center(child: CommonLogo()),
            50.height,
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                  titleText: AppString.signIn,
                  buttonWidth: 100,
                  onTap: () {
                    appRouter.push(
                      SignInRoute(
                        ctrUsername: TextEditingController(),
                        ctrPassword: TextEditingController(),
                      ),
                    );
                  },
                ),
                28.width,
                CommonButton(
                  titleText: AppString.signUp,
                  buttonWidth: 100,
                  onTap: () {
                    appRouter.push(
                      OtpRoute(
                        onSuccess: () {
                          appRouter.push(const SignUpRoute());
                        },
                      ),
                    );
                  },
                ),
                100.height,
              ],
            )
          ],
        ),
      ),
    );
  }
}
