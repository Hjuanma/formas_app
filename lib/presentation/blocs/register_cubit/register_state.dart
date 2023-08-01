part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username userName;
  final Email email;
  final Password password;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.userName = const Username.pure(),
      this.email = const Email.pure(),
      this.isValid = false, 
      this.password = const Password.pure()});

  RegisterFormState copyWith(
          {FormStatus? formStatus,
          bool? isValid,
          Username? userName,
          Email? email,
          Password? password}) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          password: password ?? this.password,
          userName: userName ?? this.userName,
          email: email ?? this.email);

  @override
  List<Object> get props => [formStatus, isValid, userName, email, password];
}
