import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../components/components.dart';
import './../../../../helpers/helpers.dart';

import './../../signup_presenter.dart';

class UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError?>(
      stream: presenter.usernameErrorStream,
      builder: (context, snapshot) {
        return Input(
          onChangedFunction: presenter.validateUsername,
          hintText: 'pasavoie01',
          labelText: R.strings.username,
          errorText: snapshot.data?.description,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12, right: 1),
            child: Text(
              '&',
              style: TextStyle(
                fontSize: 15,
                color: ThemeColors.colorLightTintsBlue,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          keyboardType: TextInputType.name,
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        );
      },
    );
  }
}
