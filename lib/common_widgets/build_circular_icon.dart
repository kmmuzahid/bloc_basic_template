/*
 * @Author: Km Muzahid
 * @Date: 2026-01-12 18:09:30
 * @Email: km.muzahid@gmail.com
 */
import 'package:flutter/material.dart';

Widget buildCircularButton({required Widget child, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF0D1B2A), // Matches the dark background
        border: Border.all(
          color: Colors.white12, // Subtle outer ring border
          width: 1,
        ),
      ),
      child: Center(child: child),
    ),
  );
}
