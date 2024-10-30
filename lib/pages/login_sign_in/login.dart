import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/login_sign_in/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:hackathonx/widgets/bottom_nav_page.dart';
import 'package:hackathonx/widgets/custom_textfield.dart';
import 'package:hackathonx/widgets/long_button.dart';

//Login and Sign Up Page
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthServices auth = FirebaseAuthServices();

  void signUp() async {
    String email = signUpEmailController.text;
    String password = signUpPasswordController.text;
    String confirmPassword = signUpConfirmPasswordController.text;

    User? user = await auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is successfully created');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavPage(myCurrentPage: 0)));
    } else {
      print("Some error happened");
    }
  }

  void signIn() async {
    String email = loginEmailController.text;
    String password = loginPasswordController.text;

    User? user = await auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is successfully login');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavPage(myCurrentPage: 0)));
    } else {
      print("Some error happened");
    }
  }

  @override
  void dispose() {
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpConfirmPasswordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }

  final formKey = GlobalKey<FormState>(); // Key to uniquely identify the form.
  final loginEmailController =
      TextEditingController(); // Controller for the email/username input field.
  final loginPasswordController =
      TextEditingController(); // Controller for the password input field.

  final signUpEmailController =
      TextEditingController(); // Controller for the email/username input field.
  final signUpPasswordController =
      TextEditingController(); // Controller for the password input field.
  final signUpConfirmPasswordController =
      TextEditingController(); // Controller for the confirm password input field.

  bool isLogin =
      true; // State variable to toggle between login and signup forms

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFE7),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey, //Assign form key for validation purposes

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // Display different images based on the login/signup state
                    isLogin
                        ? Image.asset('assets/img2.png')
                        : Image.asset(
                            'assets/img3.png',
                            height: MediaQuery.of(context).size.height * 0.28,
                          ),
                    // Title of the screen based on login/signup state
                    Text(
                      isLogin ? 'Login' : 'Sign Up',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w900)),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: isLogin
                            ? Column(
                                children: [
                                  // Username(Email) input field
                                  CustomTextfield(
                                    textEditingController: loginEmailController,
                                    obscureText: false,
                                    labelText: 'Email',
                                    validator: validateEmail,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  // Password input field
                                  CustomTextfield(
                                    textEditingController:
                                        loginPasswordController,
                                    obscureText: true,
                                    labelText: 'Password',
                                    validator: (password) => password!.length <
                                            6
                                        ? 'Password should be at least 6 characters'
                                        : null,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed:
                                            () {}, // Action when the button is pressed
                                        child: const Text(
                                          'Forget Password?',
                                          style: TextStyle(
                                              color: Color(0xff7F7777),
                                              fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  // Email/Username Input Field
                                  CustomTextfield(
                                    textEditingController:
                                        signUpEmailController, // Assign the email controller.
                                    obscureText: false,
                                    labelText: 'Email',
                                    validator: validateEmail,
                                  ), // Label for the username input.
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  // Password Input Field
                                  CustomTextfield(
                                      textEditingController:
                                          signUpPasswordController,
                                      obscureText:
                                          true, // Assign the password controller.
                                      labelText: 'Password',
                                      validator: (password) => password!
                                                  .length <
                                              6
                                          ? 'Password should be at least 6 characters'
                                          : null), // Label for the password input.
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  // Confirm Password Input Field
                                  CustomTextfield(
                                      textEditingController:
                                          signUpConfirmPasswordController,
                                      obscureText:
                                          true, // Assign the confirm password controller.
                                      labelText: 'Confirm Password',
                                      validator: (password) => password!
                                                  .length <
                                              6
                                          ? 'Password should be at least 6 characters'
                                          : null), // Label for the confirm password input.
                                ],
                              )), // Display the SignUp widget if isLogin is false.
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: Column(
                    children: [
                      // Long button for login or signup action
                      LongButton(
                        onPressed: () {
                          formKey.currentState!.validate();

                          isLogin ? signIn() : signUp();
                        },
                        buttonText: isLogin ? 'LOGIN' : 'SIGN UP',
                        fontColor: 0xffffffff,
                        backgroundColor: 0xff304B34,
                        fontSize: 20,
                      ),
                      // Row for account switching text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              isLogin
                                  ? 'Don\'t have an account?' // Text if currently on login form
                                  : 'Already have an account?', // Text if currently on signup form
                              style: const TextStyle(color: Color(0xff7F7777))),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: Text(
                              isLogin ? 'Sign Up' : 'Login',
                              style: const TextStyle(color: Color(0xff3F6245)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
