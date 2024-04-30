import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bot_state.freezed.dart';

@freezed
class ChatBotState<T> with _$ChatBotState<T> {
  factory ChatBotState.initial() = Initial<T>;
  factory ChatBotState.loading() = Loading<T>;
  factory ChatBotState.success(T data) = Success<T>;
  factory ChatBotState.failure({required String error}) = Failure<T>;
}
