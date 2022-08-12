// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/screens/authentication_login.dart';
import 'package:login_ui/widgets/social_widget.dart';
import 'package:login_ui/widgets/text.dart';
import 'package:login_ui/widgets/textfield.dart';
import 'package:login_ui/widgets/circular_progress.dart';
import '../widgets/button.dart';

class AuthenticationSignUp extends StatefulWidget {
  const AuthenticationSignUp({Key? key}) : super(key: key);

  @override
  State<AuthenticationSignUp> createState() => _AuthenticationSignUpState();
}

class _AuthenticationSignUpState extends State<AuthenticationSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  String email = '';
  String password = '';
  String cpassword = '';
  bool isPasswordVisible = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  void formValidate() {
    final isValid = _formKey.currentState!.validate();
    const CircularProgress();
    if (!isValid) {
      return;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Join Us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 20),
              EmailTextField(
                controller: emailController,
                email: email,
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextField(
                controller: passwordController,
                visible: isPasswordVisible,
                text: 'password',
                password: password,
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextField(
                controller: cpasswordController,
                visible: isPasswordVisible,
                text: 'confirm password',
                password: cpassword,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onTap: () {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) return;
                  const CircularProgress();
                },
                text: 'Sign Up',
              ),
              const SizedBox(
                height: 30,
              ),
              TextWidget(
                  textOne: "Already have an account",
                  textTwo: 'Sign In',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const AuthenticationLogin())));
                  }),
              const SizedBox(
                height: 25,
              ),
              const TextTwoWidget(),
              const SizedBox(
                height: 20,
              ),
              SocialWidget(onTapone: () {}, onTapTwo: () {})
            ]),
          ),
        ),
      )),
    );
  }
}
