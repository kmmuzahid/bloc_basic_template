import 'package:flutter/material.dart';
import 'package:mygarage/coreFeature/profile/screens/personal_info_screen.dart';
import 'package:mygarage/features/home/screens/home_screen.dart';

class NavigationState {
  int currentIndex = 0;
  List<Widget> pages;
  NavigationState({this.currentIndex = 0, this.pages = const [HomeScreen(), ProfileScreen()]});

  NavigationState copyWith({int? currentIndex, List<Widget>? pages}) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      pages: pages ?? this.pages,
    );
  }

  @override
  int get hashCode => currentIndex.hashCode ^ pages.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NavigationState && other.currentIndex == currentIndex && other.pages == pages;
  }
}
