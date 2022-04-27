import 'package:flutter/material.dart';

class LoginStepOne extends StatelessWidget {
  final Function onNextPressed;

  const LoginStepOne({Key? key, required this.onNextPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
            onPressed: () => onNextPressed(),
            child: Text(
              'Next Step',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
