import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bloc_basic_template/app.dart';
import 'package:bloc_basic_template/common/notifications/firebase/firebase_notification_handler.dart'
    show FirebaseNotificationHandler;
import 'package:bloc_basic_template/core/component/text/common_text.dart';
import 'package:bloc_basic_template/core/config/bloc/app_bloc_observer.dart';
import 'package:bloc_basic_template/core/config/dependency/dependency_injection.dart';
import 'package:bloc_basic_template/core/config/route/app_router.dart';
import 'package:bloc_basic_template/core/config/storage/storage_service.dart';
import 'package:bloc_basic_template/core/utils/constants/app_colors.dart';
import 'package:bloc_basic_template/core/utils/extensions/extension.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
//dart run build_runner watch
//create a new feature through
//emulator -list-avds
//emulator -avd Pixel_9a

//rename import-------
//Get-ChildItem -Recurse -Filter "*.dart" | ForEach-Object { (Get-Content $_.FullName) -replace 'package:bai_serve_agent', 'package:bai_serve_agent' | Set-Content $_.FullName }

//git----------
//git remote -v
//git push sta main
//git push origin main

//push notification---------
//npm install -g firebase-tools
//logout
//firebase logout
//firebase login
//flutterfire configure

//masion------------
// dart pub global activate mason_cli
// mason add bloc_feature
// mason make getx_feature --name packageName
// mason make bloc_feature --name packageName

//icon generate-------
//flutter pub run flutter_launcher_icons:main

void main() async {
  Bloc.observer = AppBlocObserver();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    debugPrint('Flutter error: ${details.exception}');
    return const Center(child: Text('Oops, something went wrong'));
  };

  WidgetsFlutterBinding.ensureInitialized();

  await init();
  await getIt.isReady<StorageService>();
  //need to configure firebase to run.
  await Firebase.initializeApp();
  await FirebaseNotificationHandler.instance.init();
  runApp(const MyApp());
}

Future<void> init() async {
  _diInit();
  await Future.wait([dotenv.load()]);
}

void _diInit() {
  final DependencyInjection dI = DependencyInjection();
  dI.dependencies();
}

void showSnackBar(String text) {
  ScaffoldMessenger.of(appRouter.navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 800),
      backgroundColor: AppColors.primaryColor,
      content: CommonText(text: text, color: AppColors.textWhite, fontWeight: FontWeight.bold),
    ),
  );
}
