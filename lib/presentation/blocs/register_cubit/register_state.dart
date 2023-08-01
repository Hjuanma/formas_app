part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username userName;
  final String email;
  final Password password;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.userName = const Username.pure(),
      this.email = "",
      this.isValid = false, 
      this.password = const Password.pure()});

  RegisterFormState copyWith(
          {FormStatus? formStatus,
          bool? isValid,
          Username? userName,
          String? email,
          Password? password}) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          userName: userName ?? this.userName,
          email: email ?? this.email);

  @override
  List<Object> get props => [formStatus, isValid, userName, email, password];
}
