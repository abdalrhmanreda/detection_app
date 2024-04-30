import 'package:detection_app/core/components/custom_button.dart';
import 'package:detection_app/core/components/custom_divider.dart';
import 'package:detection_app/core/constant/app_constant.dart';
import 'package:detection_app/core/helpers/extensions.dart';
import 'package:detection_app/core/helpers/spacing.dart';
import 'package:detection_app/features/custom_rooms/logic/rooms_cubit.dart';
import 'package:detection_app/features/custom_rooms/models/room_model.dart';
import 'package:detection_app/features/rom_details/ui/screens/rom_details.dart';
import 'package:detection_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    required this.romModel,
  });
  final String roomName;
  final String version;
  final String device;
  final String link;
  final String xda;
  final RomModel romModel;

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
              Text('Android Version: $version'),
              Spacing.verticalSpace(10),
              Text('Device: $device'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    onPressed: () async {
                      Uri download = Uri.parse(link);
                      await launchUrl(download);
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
                        // Uri axdP = Uri.parse(xda);
                        // await launchUrl(axdP);
                        context.navigateToWidget(
                            context,
                            RomDetails(
                              romModel: romModel,
                              deviceName: context.read<RoomsCubit>().deviceName,
                            ));
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'details',
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
