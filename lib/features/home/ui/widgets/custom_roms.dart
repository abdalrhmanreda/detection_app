import 'package:detection_app/core/helpers/extensions.dart';
import 'package:detection_app/core/helpers/spacing.dart';
import 'package:detection_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../core/constant/app_constant.dart';

class CustomRoms extends StatelessWidget {
  const CustomRoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage(Assets.imagesCpu),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Spacing.horizontalSpace(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Custom ROMs',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacing.verticalSpace(10),
            Container(
              constraints: BoxConstraints(
                maxWidth: AppConstant.deviceWidth(context) / 2,
              ),
              child: Text(
                'Custom ROMs are custom versions of Android that you can flash onto your device if you are unhappy with the stock firmware.',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            // Navigate to the custom ROMs screen when the arrow icon is tapped
            context.navigateToWidgetByNamed(context, RoutePath.customRoms);
          },
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 25,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
