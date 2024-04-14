import 'package:freezed_annotation/freezed_annotation.dart';

part 'rooms_state.freezed.dart';

@Freezed()
class RoomsState<T> with _$RoomsState<T> {
  const factory RoomsState.initial() = _Initial<T>;
  const factory RoomsState.loading() = _Loading<T>;
  const factory RoomsState.loaded(T data) = _Loaded<T>;
  const factory RoomsState.error(String message) = _Error<T>;
}
