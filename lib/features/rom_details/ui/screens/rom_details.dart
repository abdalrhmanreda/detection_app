import 'package:detection_app/core/helpers/spacing.dart';
import 'package:detection_app/features/custom_rooms/models/room_model.dart';
import 'package:detection_app/features/custom_rooms/ui/widgets/custom_sliver_app_bar.dart';
import 'package:detection_app/features/rom_details/ui/widgets/you_tube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/app_constant.dart';

class RomDetails extends StatelessWidget {
  const RomDetails(
      {super.key, required this.romModel, required this.deviceName});
  final RomModel romModel;
  final String deviceName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: '',
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            background: const YouTubePlayerWidget(
              videoUrl: 'https://youtu.be/XnmDlb3cBMU',
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deviceName.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Spacing.verticalSpace(15),
                  Text(
                    'Rom Name : ${romModel.romName!}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                  Spacing.verticalSpace(15),
                  Text(
                    'State: ${romModel.state!.toLowerCase()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                  Spacing.verticalSpace(15),
                  Text(
                    'Android Version: ${romModel.version}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                  Spacing.verticalSpace(15),
                  Text(
                    '${romModel.description}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                          height: 2,
                        ),
                  ),
                  Spacing.verticalSpace(50),
                  Buttons(
                    xda: romModel.xda!,
                    link: romModel.downloadLink!,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.xda,
    required this.link,
  });
  final String xda;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Uri axdP = Uri.parse(xda);
              await launchUrl(axdP);
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'XDA',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
