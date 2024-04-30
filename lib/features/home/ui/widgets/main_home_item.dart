import 'package:detection_app/config/themes/font_weight.dart';
import 'package:detection_app/core/constant/app_constant.dart';
import 'package:detection_app/core/helpers/spacing.dart';
import 'package:detection_app/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'home_item.dart';

class MainHomeItem extends StatelessWidget {
  const MainHomeItem({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // First Column
        HomeItem(
          width: AppConstant.deviceWidth(context) / 2.3,
          height: 250.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gradient Text widget for displaying Android version
              GradientText(
                'Android\n${context.read<HomeCubit>().androidInfo!.version.release}',
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  fontSize: 30.0.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
                colors: const [
                  Color(0xFF00256b), // Blue color
                  Color(0xFFc4ddfc), // Sun color
                  // Red color is missing here
                ],
              ),
              Spacing.verticalSpace(25),
              // Text widget for displaying device brand
              Text(
                AppLocalizations.of(context)!.deviceBrand,
                style: GoogleFonts.aBeeZee(
                  fontSize: 17.sp,
                ),
              ),
              Spacing.verticalSpace(10),
              // Text widget for displaying brand name
              Text(
                context.read<HomeCubit>().androidInfo!.brand,
                style: GoogleFonts.aBeeZee(
                  fontSize: 15.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        // Second Column
        Column(
          children: [
            // HomeItem widget for displaying device name
            HomeItem(
              width: AppConstant.deviceWidth(context) / 2.2,
              height: 120.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text widget for displaying 'Device Name' label
                  Text(
                    AppLocalizations.of(context)!.deviceName,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 17.sp,
                    ),
                  ),
                  Spacing.verticalSpace(10),
                  // Text widget for displaying device model
                  Text(
                    context.read<HomeCubit>().androidInfo!.model,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Spacing.verticalSpace(10),
            // HomeItem widget for displaying device code name
            HomeItem(
              width: AppConstant.deviceWidth(context) / 2.2,
              height: 120.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text widget for displaying 'Code Name' label
                  Text(
                    AppLocalizations.of(context)!.codeName,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 17.sp,
                    ),
                  ),
                  Spacing.verticalSpace(10),
                  // Text widget for displaying device code name
                  Text(
                    context.read<HomeCubit>().androidInfo!.device,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
