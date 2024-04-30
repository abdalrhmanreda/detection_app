import 'package:cached_network_image/cached_network_image.dart';
import 'package:detection_app/core/components/custom_app_bar.dart';
import 'package:detection_app/core/constant/app_constant.dart';
import 'package:detection_app/core/helpers/spacing.dart';
import 'package:detection_app/features/chatbot/ui/widgets/chat_bot_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeminiChatScreen extends StatelessWidget {
  const GeminiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: AppConstant.chatBotImage,
              width: 35.w,
              height: 35.h,
              fit: BoxFit.cover,
            ),
            Spacing.horizontalSpace(10),
            Text(AppLocalizations.of(context)!.chatBot),
          ],
        ),
        isCenter: true,
      ),
      body: const ChatBotBody(),
    );
  }
}
