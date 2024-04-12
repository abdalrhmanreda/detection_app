// import 'dart:async';
//
// import 'package:dio/dio.dart';
// import 'package:easy_parking_system/features/register/controller/signup_cubit.dart';
// import 'package:easy_parking_system/features/register/data/repo/sign_up_repo.dart';
// import 'package:get_it/get_it.dart';
//
// import '../api/api_service.dart';
// import '../api/dio_factory.dart';
//
import 'package:detection_app/features/authentication/controller/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
//
Future<void> setupGetIt() async {
  // register your other dependencies here
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
}
