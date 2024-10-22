import 'package:flutter/material.dart';
import 'package:hackathonx/widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final editPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextfield(
            textEditingController: emailController, labelText: 'Username'),
        const SizedBox(
          height: 30,
        ),
        CustomTextfield(
            textEditingController: emailController, labelText: 'Password'),
        const SizedBox(
          height: 30,
        ),
        CustomTextfield(
            textEditingController: emailController,
            labelText: 'Confirm Password'),
      ],
    );
  }
}
