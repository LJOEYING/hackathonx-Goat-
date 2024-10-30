import 'package:flutter/material.dart';
import 'package:hackathonx/widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final emailController = TextEditingController(); // Controller for the email/username input field
  final passwordController = TextEditingController(); // Controller for the password input field
  final editPasswordController = TextEditingController(); // Controller for the confirm password input field

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Input Field
        CustomTextfield(
            textEditingController: emailController, // Assign the email controller
            labelText: 'Username'), // Label for the username input
        const SizedBox(
          height: 30,
        ),
        // Password Input Field
        CustomTextfield(
            textEditingController: passwordController, // Assign the password controller
            labelText: 'Password'), // Label for the password input
        const SizedBox(
          height: 30,
        ),
        // Confirm Password Input Field
        CustomTextfield(
            textEditingController: editPasswordController, // Assign the confirm password controller
            labelText: 'Confirm Password'), // Label for the confirm password input
      ],
    );
  }
}
