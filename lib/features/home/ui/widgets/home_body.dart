import 'package:detection_app/core/helpers/spacing.dart';
import 'package:detection_app/features/home/logic/home_cubit.dart';
import 'package:detection_app/features/home/logic/home_state.dart';
import 'package:detection_app/features/home/ui/widgets/text_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_roms.dart';
import 'main_home_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // Listener can be implemented here to react to state changes
        // This function is called whenever the state changes
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title for the section
              Text(
                AppLocalizations.of(context)!.aboutPhone,
                style: GoogleFonts.aBeeZee(
                  fontSize: 22.sp,
                ),
              ),
              // Add vertical spacing
              Spacing.verticalSpace(20),
              // Widget for displaying main home items
              const MainHomeItem(),
              // Add vertical spacing
              Spacing.verticalSpace(25),
              // Widget for displaying device model
              TextItem(
                title: AppLocalizations.of(context)!.deviceModel,
                value: context.read<HomeCubit>().androidInfo!.model,
              ),
              // Add vertical spacing
              Spacing.verticalSpace(25),
              // Widget for displaying Android version
              TextItem(
                title: AppLocalizations.of(context)!.androidVersion,
                value:
                    '${context.read<HomeCubit>().androidInfo!.version.release} ${context.read<HomeCubit>().androidInfo!.display} ',
              ),
              // Add vertical spacing
              Spacing.verticalSpace(25),
              // Widget for displaying Android security patch level
              TextItem(
                title: AppLocalizations.of(context)!.androidScurePatch,
                value: context
                    .read<HomeCubit>()
                    .androidInfo!
                    .version
                    .securityPatch!,
              ),
              // Add vertical spacing
              Spacing.verticalSpace(40),
              CustomRoms(
                deviceName: context.read<HomeCubit>().androidInfo!.device,
              ),
            ],
          ),
        );
      },
    );
  }
}
