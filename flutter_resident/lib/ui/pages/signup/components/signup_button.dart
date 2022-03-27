import 'package:flutter/material.dart';
import 'package:flutter_resident/ui/helpers/i18n/resources.dart';
import 'package:provider/provider.dart';

import './../../../components/components.dart';

import '../signup_presenter.dart';

class SignUpButton extends StatelessWidget {
  final double buttonWidth;

  SignUpButton({required this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<bool>(
      stream: presenter.isFormValidStream,
      builder: (context, snapshot) {
        return PrimaryButton(
          onPressed: snapshot.data == true ? presenter.signUp : null,
          buttonText: R.strings.signUp.page1ButtonText,
          overlayColor: colorBrandPrimaryDarkest,
          backgroundColor: colorBrandPrimaryDark,
          backgroundDisabledColor: colorBrandPrimaryLight,
          totalWidth: buttonWidth,
        );
      },
    );
  }
}
