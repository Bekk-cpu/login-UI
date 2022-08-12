// ignore_for_file: must_be_immutable

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
  TextEditingController controller;
  String email;
  EmailTextField({Key? key, required this.email, required this.controller})
      : super(key: key);

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                widget.email = value!;
              },
              onChanged: (item) {
                widget.email = item;
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return ('enter your email');
                } else {
                  EmailValidator.validate(value) ? null : 'enter a valid email';
                }
              },
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.mail),
                  suffixIcon: widget.controller.text.isEmpty
                      ? Container(
                          height: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            widget.controller.clear();
                          },
                          icon: const Icon(Icons.close)),
                  border: InputBorder.none,
                  hintText: 'name@example.com'),
            )),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  TextEditingController controller;
  String password;
  bool visible;
  String text;
  PasswordTextField(
      {Key? key,
      required this.password,
      required this.controller,
      required this.visible,
      required this.text})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextFormField(
              controller: widget.controller,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return ('please enter password');
                }
                if (!RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value)) {
                  return ('enter valid password');
                }
                return null;
              },
              onSaved: (String? value) {
                setState(() {
                  widget.password = value!;
                });
              },
              onChanged: (item) {
                setState(() {
                  widget.password = item;
                });
              },
              obscureText: widget.visible,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.visible = !widget.visible;
                        });
                      },
                      icon: widget.visible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                  border: InputBorder.none,
                  hintText: widget.text),
            )),
      ),
    );
  }
}
