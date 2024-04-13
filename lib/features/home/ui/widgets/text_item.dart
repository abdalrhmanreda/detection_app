import 'package:detection_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextItem extends StatelessWidget {
  const TextItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.aBeeZee(
            fontSize: 18.sp,
          ),
        ),
        Spacing.verticalSpace(10),
        Text(
          value,
          style: GoogleFonts.aBeeZee(
            fontSize: 15.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
