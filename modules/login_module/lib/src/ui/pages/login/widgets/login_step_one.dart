import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/payload/login_flow_state_payload.dart';
import 'package:login_module/riverflow/signal/login_flow_state_signal.dart';
import 'package:login_module/src/login_steps.dart';
import 'package:shared_widgets/shared_widgets.dart';

class LoginStepOne extends HookConsumerWidget {
  final Function onNextPressed;

  LoginStepOne({Key? key, required this.onNextPressed}) : super(key: key);

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
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
          InputWidget(
            hintText: "Phone",
            textInputType: TextInputType.phone,
            controller: phoneController,
            onChanged: (value) {
              ref
                  .watch(updateNumberSignalProvider)
                  .dispatch(UpdateNumberPayload(number: value ?? ""));
            },
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
              onNextPressed();
            },
            text: "Proceed",
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
        ],
      ),
    );
  }
}
