import 'package:base_bloc/base_bloc.dart';
import 'package:shared/shared.dart';

part 'login_event.freezed.dart';

abstract class LoginEvent extends BaseBlocEvent {
  const LoginEvent();
}

@freezed
class EmailTextFieldChanged extends LoginEvent with _$EmailTextFieldChanged {
  const factory EmailTextFieldChanged({
    required String email,
  }) = _EmailTextFieldChanged;
}

@freezed
class PasswordTextFieldChanged extends LoginEvent
    with _$PasswordTextFieldChanged {
  const factory PasswordTextFieldChanged({
    required String password,
  }) = _PasswordTextFieldChanged;
}

@freezed
class EyeIconPressed extends LoginEvent with _$EyeIconPressed {
  const factory EyeIconPressed() = _EyeIconPressed;
}

@freezed
class LoginButtonPressed extends LoginEvent with _$LoginButtonPressed {
  const factory LoginButtonPressed() = _LoginButtonPressed;
}
