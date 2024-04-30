import 'package:bloc/bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:detection_app/core/api/api_constant.dart';
import 'package:detection_app/core/constant/app_constant.dart';
import 'package:detection_app/features/chatbot/logic/chat_bot_state.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// `ChatBotCubit` is a BLoC (Business Logic Component) that manages the state of the chatbot feature.
/// It extends the `Cubit` class with a state of `ChatBotState`.
class ChatBotCubit extends Cubit<ChatBotState> {
  /// The constructor initializes the state to `ChatBotState.initial()`.
  ChatBotCubit() : super(ChatBotState.initial());

  /// `messages` is a list of `ChatMessage` objects that represents the chat history.
  List<ChatMessage> messages = [];

  /// `sendMessage` is an asynchronous function that takes a `ChatMessage` object as input.
  /// It inserts the message at the beginning of the `messages` list and emits a loading state.
  /// It then uses the `GenerativeModel` to generate a response to the message.
  /// If the response is successful, it inserts the response at the beginning of the `messages` list and emits a success state.
  /// If there is an error, it emits a failure state.
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
