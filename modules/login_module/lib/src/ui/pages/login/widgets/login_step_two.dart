import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../login_steps.dart';

class LoginStepTwo extends StatelessWidget {
  final Function onBackPressed;

  const LoginStepTwo({Key? key, required this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final step = loginSteps[1];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            step.desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Pinput(
            length: 6,
            showCursor: false,
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
            defaultPinTheme: PinTheme(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
