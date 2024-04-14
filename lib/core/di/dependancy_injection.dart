import 'package:detection_app/features/authentication/controller/auth_cubit.dart';
import 'package:detection_app/features/chatbot/logic/chat_bot_cubit.dart';
import 'package:detection_app/features/custom_rooms/logic/rooms_cubit.dart';
import 'package:detection_app/features/home/logic/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt
    .instance; // Create a singleton instance of GetIt for dependency injection

// This function initializes and registers dependencies using GetIt
Future<void> setupGetIt() async {
  // Register your other dependencies here

  // Register the AuthCubit as a factory.
  // This means a new instance of AuthCubit will be created each time it is requested.
  getIt.registerFactory<AuthCubit>(() => AuthCubit());

  // Register the ChatBotCubit as a factory.
  // This means a new instance of ChatBotCubit will be created each time it is requested.
  getIt.registerFactory<ChatBotCubit>(() => ChatBotCubit());

  // Register the HomeCubit as a factory.
  // This means a new instance of HomeCubit will be created each time it is requested.
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<RoomsCubit>(() => RoomsCubit());
}
