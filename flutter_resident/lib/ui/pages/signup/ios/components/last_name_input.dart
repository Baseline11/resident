import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../components/components.dart';
import './../../../../helpers/helpers.dart';

import './../../signup_presenter.dart';

class LastNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError?>(
      stream: presenter.lastNameErrorStream,
      builder: (context, snapshot) {
        return Input(
          onChangedFunction: presenter.validateLastName,
          hintText: 'Jean-Luc',
          labelText: R.strings.lastName,
          errorText: snapshot.data?.description,
          keyboardType: TextInputType.name,
        );
      },
    );
  }
}
