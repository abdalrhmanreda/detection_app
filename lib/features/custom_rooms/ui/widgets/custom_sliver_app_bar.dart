import 'package:detection_app/core/constant/app_constant.dart';
import 'package:detection_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final Widget leading;
  final List<Widget> actions;

  const CustomSliverAppBar({
    super.key,
    this.title = 'Custom Rooms',
    this.leading = const SizedBox(),
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      leading: leading,
      actions: actions,
      expandedHeight: AppConstant.deviceHeight(context) / 2.5,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title),
        background: Image.asset(
          Assets.imagesAndroid,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
