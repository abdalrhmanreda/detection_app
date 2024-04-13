import 'package:detection_app/core/helpers/spacing.dart';
import 'package:detection_app/features/home/logic/home_cubit.dart';
import 'package:detection_app/features/home/logic/home_state.dart';
import 'package:detection_app/features/home/ui/widgets/text_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_home_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
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
              // Add your widgets here
              Text(
                AppLocalizations.of(context)!.aboutPhone,
                style: GoogleFonts.aBeeZee(
                  fontSize: 22.sp,
                ),
              ),
              Spacing.verticalSpace(20),
              const MainHomeItem(),
              Spacing.verticalSpace(25),

              TextItem(
                title: AppLocalizations.of(context)!.deviceModel,
                value: context.read<HomeCubit>().androidInfo!.model,
              ),
              Spacing.verticalSpace(25),
              TextItem(
                title: AppLocalizations.of(context)!.androidVersion,
                value:
                    '${context.read<HomeCubit>().androidInfo!.version.release} ${context.read<HomeCubit>().androidInfo!.display} ',
              ),
              Spacing.verticalSpace(25),
              TextItem(
                title: AppLocalizations.of(context)!.androidScurePatch,
                value: context
                    .read<HomeCubit>()
                    .androidInfo!
                    .version
                    .securityPatch!,
              ),
            ],
          ),
        );
      },
    );
  }
}
