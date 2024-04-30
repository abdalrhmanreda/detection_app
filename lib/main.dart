import 'package:bloc/bloc.dart';
import 'package:detection_app/config/routes/router.dart';
import 'package:detection_app/core/cache/hive_cache.dart';
import 'package:detection_app/core/observer/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'DetecttionApp.dart';
import 'config/routes/routes_path.dart';
import 'core/constant/strings.dart';
import 'core/di/dependancy_injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  Hive.initFlutter();
  await HiveCache.openHive();
  Bloc.observer = MyBlocObserver();
  userId = HiveCache.getData(key: 'userId');
  String initRoute = userId == null ? RoutePath.login : RoutePath.home;
  print(userId);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DetectionApp(
      appRouter: AppRouter(),
      initRoute: initRoute,
    ),
  );
}
