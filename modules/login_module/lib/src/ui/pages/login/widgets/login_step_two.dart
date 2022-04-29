import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/components/assets/assets.gen.dart';
import 'package:login_module/riverflow/observable/login_flow_state_observable.dart';
import 'package:login_module/riverflow/payload/login_flow_state_payload.dart';
import 'package:login_module/riverflow/signal/login_signal.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../login_steps.dart';

class LoginStepTwo extends ConsumerWidget {
  final Function onBackPressed;

  const LoginStepTwo({Key? key, required this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final step = loginSteps[1];
    final loginState = ref.watch(loginFlowStateObservableProvider);
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
            height: 10,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onBackPressed(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  loginState.phoneNumber,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 4,
                ),
                Assets.iconEdit.image(width: 22, height: 22, fit: BoxFit.cover),
              ],
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
            onCompleted: (value) {
              ref.watch(verifyCodeSignalProvider).dispatch(
                    AddCodePayload(
                      code: value,
                    ),
                  );
            },
          ),
          const Spacer(),
          CountdownTimerButton(
            text: "Resend PIN",
            seconds: 30,
            onPressed: () {
              ref.watch(verifyNumberSignalProvider).dispatch();
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
