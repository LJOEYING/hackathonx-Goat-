import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/login_sign_in/sign_up.dart';
import 'package:hackathonx/widgets/custom_textfield.dart';
import 'package:hackathonx/widgets/long_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFE7),
      body: SafeArea(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  isLogin
                      ? Image.asset('assets/img2.png')
                      : Image.asset(
                          'assets/img3.png',
                          height: MediaQuery.of(context).size.height * 0.28,
                        ),
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
                                CustomTextfield(
                                    textEditingController: emailController,
                                    labelText: 'Username'),
                                const SizedBox(
                                  height: 30,
                                ),
                                CustomTextfield(
                                    textEditingController: emailController,
                                    labelText: 'Password'),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Forget Password?',
                                        style: TextStyle(
                                            color: Color(0xff7F7777),
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ],
                            )
                          : const SignUp()),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: Column(
                  children: [
                    LongButton(
                      onPressed: () {},
                      buttonText: isLogin ? 'LOGIN' : 'SIGN UP',
                      fontColor: 0xffffffff,
                      backgroundColor: 0xff304B34,
                      fontSize: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            isLogin
                                ? 'Don\'t have an account?'
                                : 'Already have an account?',
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
    );
  }
}
