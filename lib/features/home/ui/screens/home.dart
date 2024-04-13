import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:detection_app/config/routes/routes_path.dart';
import 'package:detection_app/core/components/custom_app_bar.dart';
import 'package:detection_app/core/constant/app_constant.dart';
import 'package:detection_app/core/helpers/extensions.dart';
import 'package:detection_app/features/home/logic/home_cubit.dart';
import 'package:detection_app/features/home/logic/home_state.dart';
import 'package:detection_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // Listener is not implemented yet
        // You can add code here to handle state changes if needed
      },
      builder: (context, state) {
        // Builder function rebuilds the UI based on the state of the HomeCubit
        return Scaffold(
          appBar: CustomAppBar(
            // Custom app bar with actions
            actions: [
              GestureDetector(
                onTap: () {
                  // Navigate to the chatbot screen when the chatbot icon is tapped
                  context.navigateToWidgetByNamed(context, RoutePath.chatbot);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: CachedNetworkImage(
                    // Display the chatbot image using CachedNetworkImage
                    imageUrl: AppConstant.chatBotImage,
                    height: 35.h,
                    width: 35.w,
                  ),
                ),
              ),
            ],
          ),
          body: ConditionalBuilder(
            condition: state is! Loading &&
                context.read<HomeCubit>().androidInfo != null,
            builder: (context) => const HomeBody(),
            fallback: (context) => Center(
              child: Lottie.asset(
                Assets.imagesLoading,
                height: 50.h,
                width: 50.w,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ), // Display the HomeBody widget
        );
      },
    );
  }
}
