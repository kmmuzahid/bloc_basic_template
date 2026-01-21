import 'package:auto_route/annotations.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/bloc/cubit_scope.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/coreFeature/profile/cubit/person_info_cubit.dart';
import 'package:mygarage/gen/assets.gen.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CubitScope(
        create: () => PersonInfoCubit()..fetchProfile(),
        builder: (context, cubit, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.height,

                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CommonImage(
                            src: Assets.images.sample1.path,
                            size: 100,
                            borderRadius: 100,
                            fill: BoxFit.contain,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.blue,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const CommonText(
                        text: 'Change Your Photo',
                        textColor: Colors.white,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),

                40.height,

                // Input Fields
                _buildInputField(
                  label: 'Name',
                  icon: Icons.person_outline,
                  initialValue: "FJ Miller's",
                ),
                _buildInputField(
                  label: 'Email Address',
                  icon: Icons.email_outlined,
                  initialValue: 'info@example.com',
                  isReadOnly: true,
                ),
                _buildInputField(
                  label: 'Address',
                  icon: Icons.location_on_outlined,
                  initialValue: '1901 Thornridge Cir. Shiloh, Hawai...',
                ),

                const SizedBox(height: 40),

                CommonButton(
                  titleText: 'Save Changes',
                  buttonWidth: double.infinity,
                  buttonRadius: 40,
                  onTap: () {
                    appRouter.pop();
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required IconData icon,
    required String initialValue,
    bool isReadOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          CommonTextField(
            prefixIcon: Icon(icon, color: Colors.white),
            initialText: initialValue,
            isReadOnly: isReadOnly,
            validationType: ValidationType.validateRequired,
          ),
        ],
      ),
    );
  }
}
