/*
 * @Author: Km Muzahid
 * @Date: 2026-01-08 12:44:55
 * @Email: km.muzahid@gmail.com
 */
import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarage/common_widgets/common_widget.dart';
import 'package:mygarage/config/bloc/cubit_scope.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';
import 'package:mygarage/constant/constants.dart';
import 'package:mygarage/coreFeature/auth/cubit/auth_cubit.dart';
import 'package:mygarage/coreFeature/auth/cubit/auth_flow_cubit.dart';
import 'package:mygarage/coreFeature/auth/entity/login_entity.dart';
import 'package:mygarage/coreFeature/auth/widgets/action_spawn_widget.dart';
import 'package:mygarage/gen/assets.gen.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(disableBack: true, hideBack: true),
      body: FormBuilder(
        entity: LoginEntity(),
        builder: (context, formKey, entity) => Padding(
          padding: Constants.bodyPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: CommonImage(size: 80, src: Assets.images.appIcon.path)),
              40.height,
              CommonText(
                text: "Welcome Back!",
                textColor: AppColor.onPrimary,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ).center,
              const CommonText(
                text: "Please log in to continue",
                textColor: Colors.white70,
                fontSize: 16,
              ).center,
              40.height,

              // Email Field
              buildLabel("Email Address"),
              CommonTextField(
                hintText: "Enter email address here...",
                validationType: ValidationType.validateEmail,
                prefixIcon: const Icon(Icons.email_outlined),
                onSaved: (value, controller) => entity.email = value,
              ),
              20.height,

              // Password Field
              buildLabel("Password"),
              CommonTextField(
                hintText: "Enter password here...",
                validationType: ValidationType.validatePassword,
                prefixIcon: const Icon(Icons.lock_outline),
                onSaved: (value, controller) => entity.password = value,
              ),
              10.height,
              GestureDetector(
                onTap: () {
                  final email = entity.email ?? '';
                  appRouter.push(
                    SendOtpRoute( 
                      onSuccess: ({required email, required token}) {
                        appRouter.push(ResetPasswordRoute(verificationToken: token, email: email));
                      },
                      username: email,
                    ),
                  );
                },
                child: CommonText(
                  text: "Forgot Password?",
                  textColor: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ).end,
              ),

              30.height,

              CubitScope(
                create: () => AuthFlowCubit(context.read<AuthCubit>()),
                builder: (context, cubit, state) {
                  return CommonButton(
                    isLoading: state,
                    onTap: () {
                      formKey.currentState?.save();
                      if ((formKey.currentState?.validate() ?? false)) {
                        cubit.login(entity);
                      }
                    },
                    titleText: "Log In",
                    buttonWidth: double.infinity,
                  );
                },
              ),

              25.height,
              const Center(
                child: Text("OR", style: TextStyle(color: Colors.white38)),
              ),
              25.height,

              // Google Login Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata, size: 30, color: Colors.white),
                  label: const Text("Log in With Google", style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              const Spacer(),
              ActionSpawnWidget(
                title: 'Don\'t have an account?',
                actionTitle: 'Sign Up',
                onTap: () {
                  appRouter.replace(const SignUpRoute());
                },
              ).center,

              50.height,
            ],
          ),
        ),
      ),
    );
  }
}
