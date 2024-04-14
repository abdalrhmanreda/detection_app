import 'package:detection_app/core/components/custom_button.dart';
import 'package:detection_app/core/components/custom_divider.dart';
import 'package:detection_app/core/constant/app_constant.dart';
import 'package:detection_app/core/helpers/spacing.dart';
import 'package:detection_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    super.key,
    required this.roomName,
    required this.version,
    required this.device,
    required this.link,
    required this.xda,
  });
  final String roomName;
  final String version;
  final String device;
  final String link;
  final String xda;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            title: Text(roomName),
            leading: CircleAvatar(
              radius: 33.r,
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage(
                  Assets.imagesAnd,
                ),
              ),
            ),
            children: [
              Spacing.verticalSpace(10),
              Text('Version: $version'),
              Spacing.verticalSpace(10),
              Text('Device: $device'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    onPressed: () async {
                      Uri donwload = Uri.parse(link);
                      await launchUrl(donwload);
                    },
                    text: 'download',
                    height: 42.h,
                    width: AppConstant.deviceWidth(context) / 2.5,
                    radius: 10.r,
                  ),
                  SizedBox(
                    height: 42.h,
                    width: AppConstant.deviceWidth(context) / 2.5,
                    child: OutlinedButton(
                      onPressed: () async {
                        Uri axdP = Uri.parse(xda);
                        await launchUrl(axdP);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'preview',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacing.verticalSpace(10),
          myDivider(AppConstant.deviceWidth(context) / 1.1, 1),
        ],
      ),
    );
  }
}
