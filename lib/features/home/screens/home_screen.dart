/*
 * @Author: Km Muzahid
 * @Date: 2026-01-11 14:04:09
 * @Email: km.muzahid@gmail.com
 */
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CommonText(
          text: 'HomeScreen',
          fontSize: 24,
          textColor: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
