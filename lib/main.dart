import 'package:bloc/bloc.dart';
import 'package:detection_app/config/routes/router.dart';
import 'package:detection_app/core/observer/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'DetecttionApp.dart';
import 'core/di/dependancy_injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DetectionApp(
      appRouter: AppRouter(),
    ),
  );
}
