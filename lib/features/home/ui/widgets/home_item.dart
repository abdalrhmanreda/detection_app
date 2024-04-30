import 'package:flutter/material.dart';

import '../../../../config/colors/app_colors.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.kHomeContainerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
