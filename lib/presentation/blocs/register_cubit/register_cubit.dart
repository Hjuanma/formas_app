import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formas_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        userName: Username.dirty(state.userName.value),
        password: Password.dirty(state.userName.value),
        isValid: Formz.validate([state.userName, state.password])));

    print("Submit: $state");
  }

  void userNameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
        userName: username,
        isValid: Formz.validate([username, state.password])));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.userName])));
  }
}
