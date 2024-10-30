import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathonx/pages/login_sign_in/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:hackathonx/widgets/bottom_nav_page.dart';
import 'package:hackathonx/widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final FirebaseAuthServices auth = FirebaseAuthServices();
  final emailController =
      TextEditingController(); // Controller for the email/username input field
  final passwordController =
      TextEditingController(); // Controller for the password input field
  final confirmPasswordController =
      TextEditingController(); // Controller for the confirm password input field

  void signUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    User? user = await auth.signUpWithEmailAndPassword(email, password);

    if (user != null  && password ==confirmPassword) {
      print('User is successfully created');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavPage(myCurrentPage: 0)));
    } else {
      print("Some error happened");
    }
  }

  

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Input Field
        CustomTextfield(
            textEditingController: emailController, // Assign the email controller.
            labelText: 'Username'), // Label for the username input.
        const SizedBox(
          height: 30,
        ),
        // Password Input Field
        CustomTextfield(
            textEditingController: passwordController, // Assign the password controller.
            labelText: 'Password'), // Label for the password input.
        const SizedBox(
          height: 30,
        ),
        // Confirm Password Input Field
        CustomTextfield(
            textEditingController: editPasswordController, // Assign the confirm password controller.
            labelText: 'Confirm Password'), // Label for the confirm password input.
      ],
    );
  }
}
