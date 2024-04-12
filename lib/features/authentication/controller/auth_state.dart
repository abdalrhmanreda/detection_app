import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@Freezed()
class AuthState<T> with _$AuthState<T> {
  AuthState._();
  factory AuthState.initial() = InitialState<T>;
  factory AuthState.loading() = LoadingState<T>;
  factory AuthState.failure({required String error}) = FailureState<T>;
  factory AuthState.success() = SuccessState<T>;
  factory AuthState.loginSuccessState() = LoginSuccessState<T>;
  factory AuthState.registerSuccessState() = RegisterSuccessState<T>;
  factory AuthState.createUserSuccessState() = CreateUserSuccessState<T>;
  factory AuthState.getUserDataSuccessState() = GetUserDataSuccessState<T>;
  factory AuthState.updateUserDataSuccessState() =
      UpdateUserDataSuccessState<T>;
  factory AuthState.logoutSuccessState() = LogoutSuccessState<T>;
}
