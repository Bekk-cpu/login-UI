import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String? textOne;
  String? textTwo;
  VoidCallback onTap;
  TextWidget(
      {Key? key,
      required this.textOne,
      required this.textTwo,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Alread have an account?"),
      InkWell(
        onTap: onTap,
        child: const Text(
          ' SIGN IN',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}

class TextTwoWidget extends StatelessWidget {
  const TextTwoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'or continue with',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
