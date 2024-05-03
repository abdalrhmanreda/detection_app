import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/constant/app_constant.dart';

class ContainerTextFormFeild extends StatelessWidget {
  const ContainerTextFormFeild({
    Key? key, // Add Key parameter here
    required this.isPass,
    required this.controller,
    required this.hint,
    required this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixPressed,
    this.onChanged,
    this.validator,
  }) : super(key: key); // Pass key to super constructor

  final bool isPass;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppConstant.deviceWidth(context),
          height: 47.h,
          decoration: BoxDecoration(
            color: AppColors.kLoginWithGoogleColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPass,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.kGreyColor,
                  ),
              prefixIcon: Icon(prefixIcon),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      onPressed: () {
                        suffixPressed?.call();
                      },
                      icon: Icon(
                        suffixIcon,
                        color: AppColors.kGreyColor,
                        size: 20,
                      ),
                    )
                  : null,
            ),
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
