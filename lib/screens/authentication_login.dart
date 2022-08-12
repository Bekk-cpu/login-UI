// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/screens/authentication_signup.dart';
import 'package:login_ui/widgets/button.dart';
import 'package:login_ui/widgets/social_widget.dart';
import 'package:login_ui/widgets/text.dart';
import 'package:login_ui/widgets/textfield.dart';

class AuthenticationLogin extends StatefulWidget {
  const AuthenticationLogin({Key? key}) : super(key: key);

  @override
  State<AuthenticationLogin> createState() => _AuthenticationLoginState();
}

class _AuthenticationLoginState extends State<AuthenticationLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;
  String password = '';
  String email = '';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello Again!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Welcome back, you've been missed",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 50,
                ),
                EmailTextField(
                  email: email,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordTextField(
                    password: password,
                    controller: passwordController,
                    visible: isPasswordVisible,
                    text: "Sign In"),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: const Text('forgot your password?'),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(onTap: () {}, text: 'Sign In'),
                const SizedBox(
                  height: 30,
                ),
                TextWidget(
                    textOne: "Don't have an account? ",
                    textTwo: "Sign Up",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AuthenticationSignUp()));
                    }),
                const SizedBox(
                  height: 25,
                ),
                const TextTwoWidget(),
                const SizedBox(
                  height: 25,
                ),
                SocialWidget(onTapone: () {}, onTapTwo: () {})
              ],
            )),
          ),
        ));
  }
}
