import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/colors/app_colors.dart';

void showAlertDialog(
  BuildContext context, {
  required String title,
  required String image,
  bool? isCancel,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(title),
        content: Lottie.asset(image, width: 150.w, height: 150.h),
        actions: [
          TextButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              'Ok',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
          ),
        ],
      );
    },
  );
}
