import 'package:auto_route/auto_route.dart';
import 'package:core_kit/image/common_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/bloc/cubit_scope.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/gen/assets.gen.dart';
import 'package:mygarage/navigation/cubit/navigation_cubit.dart';
import 'package:mygarage/navigation/cubit/navigation_state.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope(
      create: () => NavigationCubit(),
      builder: (context, cubit, state) {
        return Scaffold(
          body: state.pages[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) => cubit.changeIndex(index),
            items: [
              _navBuilder(index: 0, image: Assets.images.category, state: state),
              _navBuilder(index: 1, image: Assets.images.profile, state: state),
            ],
          ),
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
