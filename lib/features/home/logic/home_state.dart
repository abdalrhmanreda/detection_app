import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@Freezed()
class HomeState<T> with _$HomeState {
  const factory HomeState.initial() = Initial<T>;
  const factory HomeState.loading() = Loading<T>;
  const factory HomeState.loaded(T data) = Loaded<T>;
  const factory HomeState.error(String message) = Error<T>;
}
