import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:bloc_basic_template/core/app_bar/common_app_bar.dart';
import 'package:bloc_basic_template/core/config/languages/cubit/language_cubit.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: CommonAppBar(title: AppString.privacyPolicy));
}
