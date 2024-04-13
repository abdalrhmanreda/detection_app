import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  // Variable to store Android device information
  AndroidDeviceInfo? androidInfo;

  // Method to detect the device
  void detectDevice() async {
    // Emit loading state
    emit(const HomeState.loading());

    try {
      // Simulate a delay (optional)
      await Future.delayed(const Duration(seconds: 5));

      // Emit loaded state with device type

      // Initialize DeviceInfoPlugin
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      // Get Android device information
      androidInfo = await deviceInfo.androidInfo;
      emit(const HomeState.loaded('Mobile'));
    } catch (e) {
      // Emit error state if an exception occurs
      emit(const HomeState.error('Failed to detect device'));
    }
  }
}
