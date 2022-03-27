import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../helpers/helpers.dart';
import './../../../../components/components.dart';

import './../../signup_presenter.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError?>(
      stream: presenter.emailErrorStream,
      builder: (context, snapshot) {
        return Input(
          onChangedFunction: presenter.validateEmail,
          hintText: 'passaviore@resident.com',
          labelText: R.strings.email,
          errorText: snapshot.data?.description,
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}
