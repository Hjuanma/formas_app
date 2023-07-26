import 'package:flutter/material.dart';
import 'package:formas_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo usuaario"),
      ),
      body: const _RegisterView(),
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
    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: "Nombre de usuario",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: "Correo electrónico",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: "Contraseña",
          isPassword: true,
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text("Crear usuario"),
        ),
      ],
    ));
  }
}