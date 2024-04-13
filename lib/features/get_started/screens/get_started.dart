import 'package:detection_app/config/colors/app_colors.dart';
import 'package:detection_app/core/helpers/extensions.dart';
import 'package:detection_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../config/routes/routes_path.dart';
import '../../../core/components/custom_button.dart';
import '../../../generated/assets.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20,
          vertical: MediaQuery.of(context).size.height / 20,
        ),
        child: buildGetStartedView(context),
      ),
    );
  }

  Column buildGetStartedView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Iconsax.arrow_left_outline,
                color: Colors.white,
              ),
            ),
            Spacing.horizontalSpace(10),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'How it',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                  TextSpan(
                    text: ' works',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: (AppColors.kPrimaryColor),
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
        Image.asset(
          Assets.imagesUpdateBro,
          height: 300.h,
        ),
        Text(
          AppLocalizations.of(context)!.getStartedTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
        ),
        Text(
          AppLocalizations.of(context)!.getStartedDesc,
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 13.sp,
                height: 1.4,
              ),
          textAlign: TextAlign.center,
        ),
        CustomButton(
          text: AppLocalizations.of(context)!.getStarted,
          onPressed: () {
            context.navigateAndFinishNyNamed(context, RoutePath.login);
          },
          width: MediaQuery.of(context).size.width,
          radius: 15,
        ),
      ],
    );
  }
}
