import 'package:flutter/material.dart';
import 'package:login_module/src/login_steps.dart';
import 'package:shared_widgets/shared_widgets.dart';

class LoginStepOne extends StatelessWidget {
  final Function onNextPressed;

  const LoginStepOne({Key? key, required this.onNextPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final step = loginSteps[0];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 24,
          ),
          const InputWidget(
            hintText: "Country picker goes here",
          ),
          const SizedBox(
            height: 10,
          ),
          const InputWidget(
            hintText: "Phone",
            textInputType: TextInputType.phone,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'We will send you an SMS to verify your phone number.(Carrier charges may apply.)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          PrimaryActionButton(
              onPressed: () {
                // Todo:- Call signal here for firebase

                //Todo: Refactor this out to be used with riverflow instead
                onNextPressed();
              },
              text: "Proceed"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'We will send you an SMS to verify your phone number.(Carrier charges may apply.)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
