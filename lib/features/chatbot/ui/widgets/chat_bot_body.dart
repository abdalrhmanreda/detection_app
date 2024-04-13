import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:detection_app/config/colors/app_colors.dart';
import 'package:detection_app/core/constant/app_constant.dart';
import 'package:detection_app/core/constant/strings.dart';
import 'package:detection_app/features/chatbot/logic/chat_bot_cubit.dart';
import 'package:detection_app/features/chatbot/logic/chat_bot_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotBody extends StatefulWidget {
  const ChatBotBody({super.key});

  @override
  State<ChatBotBody> createState() => _ChatBotBodyState();
}

class _ChatBotBodyState extends State<ChatBotBody> {
  ChatUser currentUser = ChatUser(
    firstName: name,
    id: '0',
    profileImage: AppConstant.userImage,
  );
  ChatUser otherUser = ChatUser(
    firstName: 'ChatBot',
    id: '1',
    profileImage: AppConstant.chatBotImage,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBotCubit, ChatBotState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return DashChat(
          currentUser: currentUser,
          onSend: (message) {
            // _sendMessage(message);
            setState(() {
              context.read<ChatBotCubit>().sendMessage(message);
            });
          },
          messages: context.watch<ChatBotCubit>().messages,
          readOnly: false,
          messageOptions: const MessageOptions(
            currentUserTextColor: Colors.white,
            showCurrentUserAvatar: true,
          ),
          typingUsers: [
            if (state is Loading) otherUser,
          ],
          messageListOptions: MessageListOptions(
            typingBuilder: (user) {
              return const TypingIndicator(
                flashingCircleBrightColor: AppColors.kPrimaryColor,
              );
            },
            onLoadEarlier: () async {
              print('Load earlier......');
            },
          ),
        );
      },
    );
  }
}
