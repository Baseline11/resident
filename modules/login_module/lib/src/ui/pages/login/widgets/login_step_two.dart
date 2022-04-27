import 'package:flutter/material.dart';

class LoginStepTwo extends StatelessWidget {
  final Function onBackPressed;

  const LoginStepTwo({Key? key, required this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
            onPressed: () => onBackPressed(),
            child: Text(
              'Go back',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
