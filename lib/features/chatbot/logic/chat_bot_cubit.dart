import 'package:bloc/bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:detection_app/core/api/api_constant.dart';
import 'package:detection_app/core/constant/app_constant.dart';
import 'package:detection_app/features/chatbot/logic/chat_bot_state.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit() : super(ChatBotState.initial());
  List<ChatMessage> messages = [];
  void sendMessage(ChatMessage message) async {
    messages.insert(0, message);
    emit(ChatBotState.loading());
    final model =
        GenerativeModel(model: 'gemini-pro', apiKey: ApiConstant.geminiApiKey);
    final prompt = message.text;
    final content = [Content.text(prompt)];
    model.generateContent(content).then((response) {
      print(response.text!);
      messages.insert(
        0,
        ChatMessage(
          text: response.text!,
          user: ChatUser(
            firstName: 'ChatBot',
            id: '1',
            profileImage: AppConstant.chatBotImage,
          ),
          createdAt: DateTime.now(),
        ),
      );
      emit(ChatBotState.success(messages));
    }).catchError((error) {
      print(error);
      emit(ChatBotState.failure(error: error.toString()));
    });
  }
}
