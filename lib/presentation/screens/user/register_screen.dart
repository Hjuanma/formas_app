import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formas_app/presentation/widgets/widgets.dart';

import '../../blocs/register_cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo usuaario"),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.userName;
    final password = registerCubit.state.password;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: "Nombre de usuario",
          onChanged: (value) {
            registerCubit.userNameChanged(value);
          },
          errorMessage:
              username.errorMessage,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: "Correo electrónico",
          onChanged: (value) {
            registerCubit.emailChanged(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty || value.trim().isEmpty) {
              return "Campo requerido";
            }
            final emailRegExp = RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            );
            if (!emailRegExp.hasMatch(value)) {
              return "No tiene el formato requerido";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: "Contraseña",
          isPassword: true,
          onChanged: (value) {
            registerCubit.passwordChanged(value);
          },
          errorMessage: password.errorMessage,
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text("Crear usuario"),
        ),
      ],
    ));
  }
}
