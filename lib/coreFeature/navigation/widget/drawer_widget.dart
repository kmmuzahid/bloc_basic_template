/*
 * @Author: Km Muzahid
 * @Date: 2026-01-12 17:27:40
 * @Email: km.muzahid@gmail.com
 */
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';
import 'package:mygarage/coreFeature/auth/cubit/auth_cubit.dart';
import 'package:mygarage/coreFeature/navigation/widget/account_delete_widget.dart';
import 'package:mygarage/gen/assets.gen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0D1B2A),
      child: SafeArea(
        child: Column(
          children: [
            30.height,
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CommonImage(
                  src: Assets.images.sample1.path,
                  borderRadius: 100,
                  size: 100,
                  fill: BoxFit.contain,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            15.height,
            const CommonText(
              text: '@FJ Miller’s',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const CommonText(
              text: 'JDM Enthusiast. San Diego, CA',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            30.height,

            // --- Menu Items ---
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: ListView(
                  children: [
                    _buildDrawerItem(
                      Icons.person_outline,
                      "Personal Information",
                      onTap: () {
                        appRouter.push(const ProfileRoute());
                      },
                    ),
                    _buildDrawerItem(
                      Icons.lock_outline,
                      "Change Password",
                      onTap: () {
                        appRouter.push(const ChangePasswordRoute());
                      },
                    ),
                    _buildDrawerItem(
                      Icons.shield_outlined,
                      "Privacy Policy",
                      onTap: () {
                        appRouter.push(const PrivacyPolicyRoute());
                      },
                    ),
                    _buildDrawerItem(
                      Icons.error_outline,
                      "Terms & Conditions",
                      onTap: () {
                        appRouter.push(const TermsOfUseRoute());
                      },
                    ),
                    _buildDrawerItem(
                      Icons.delete_outline,
                      "Delete Account",
                      onTap: () {
                        showDialog<Widget>(
                          context: context,
                          builder: (context) => const Dialog(child: AccountDeleteWidget()),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      Icons.logout,
                      "Logout",
                      textColor: Colors.redAccent,
                      iconColor: Colors.redAccent,
                      onTap: () {
                        context.read<AuthCubit>().logout();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title, {
    Color iconColor = Colors.white,
    Color textColor = Colors.white,
    Function? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColor.outlineColor),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: CommonText(
          text: title,
          textColor: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        onTap: () {
          appRouter.pop();
          onTap?.call();
        },
      ),
    );
  }
}
