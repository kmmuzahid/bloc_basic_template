/*
 * @Author: Km Muzahid
 * @Date: 2026-01-12 16:57:56
 * @Email: km.muzahid@gmail.com
 */
import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/common_widgets/build_circular_icon.dart';
import 'package:mygarage/config/bloc/cubit_scope.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/coreFeature/navigation/cubit/navigation_cubit.dart';
import 'package:mygarage/coreFeature/navigation/cubit/navigation_state.dart';
import 'package:mygarage/coreFeature/navigation/widget/drawer_widget.dart';
import 'package:mygarage/coreFeature/notification/notification_button.dart';
import 'package:mygarage/gen/assets.gen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope(
      create: () => NavigationCubit(),
      builder: (context, cubit, state) {
        return Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              children: [
                Row(
                  children: [
                    20.width,
                    CommonImage(src: Assets.images.appIcon.path, size: 48),
                    const Spacer(),
                    const NotificationIconWidget(),
                    10.width,
                    buildCircularButton(
                      child: const Icon(Icons.menu, color: Colors.white, size: 28),
                      onTap: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ],
                ),
                Divider(color: AppColor.outlineColor),
                Expanded(child: state.pages[state.currentIndex]),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            backgroundColor: AppColor.background,
            onTap: (index) => cubit.changeIndex(index),
            items: [
              _navBuilder(index: 0, image: Assets.images.category, state: state),
              _navBuilder(index: 4, image: Assets.images.profile, state: state),
            ],
          ),
          drawer: const DrawerWidget(),
        );
      },
    );
  }

  BottomNavigationBarItem _navBuilder({
    required int index,
    required String image,
    required NavigationState state,
  }) {
    final isSelected = index == state.currentIndex;
    final color = isSelected ? AppColor.primary : Colors.grey;
    final icon = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonImage(size: 25, fill: BoxFit.contain, src: image, imageColor: color),
        const SizedBox(height: 4),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: 2,
          width: isSelected ? 20 : 0,
          decoration: BoxDecoration(
            color: isSelected ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
    return BottomNavigationBarItem(label: '', icon: icon);
  }
}
