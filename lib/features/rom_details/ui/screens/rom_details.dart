import 'package:detection_app/features/custom_rooms/ui/widgets/custom_sliver_app_bar.dart';
import 'package:detection_app/features/rom_details/ui/widgets/you_tube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/app_constant.dart';

class RomDetails extends StatelessWidget {
  const RomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: '',
            background: YouTubePlayerWidget(
                videoUrl: 'https://www.youtube.com/watch?v=jpFuGpLw86s'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Buttons(),
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          onPressed: () async {
            Uri download = Uri.parse('https://www.google.com');
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
              Uri axdP = Uri.parse('https://www.google.com');
              await launchUrl(axdP);
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
    );
  }
}
