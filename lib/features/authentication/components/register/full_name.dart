import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../common/container_with_text_from_feild.dart';

class TitleAndTextFormFeild extends StatelessWidget {
  const TitleAndTextFormFeild({
    super.key,
    required this.nameController,
    required this.title,
    required this.hint,
    this.validator,
  });
  final String? Function(String?)? validator;

  final TextEditingController nameController;
  final String title;
  final String hint;
  final TextInputType keyboardType;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15.sp),
        ),
        Spacing.verticalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerTextFormFeild(
              isPass: false,
              controller: nameController,
              hint: hint,
            keyboardType: keyboardType,
            ),
          ],
        ),
      ],
    );
  }
}
