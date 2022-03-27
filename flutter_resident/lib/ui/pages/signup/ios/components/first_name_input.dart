import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../components/components.dart';
import './../../../../helpers/helpers.dart';

import './../../signup_presenter.dart';

class FirstNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError?>(
      stream: presenter.firstNameErrorStream,
      builder: (context, snapshot) {
        return Input(
          onChangedFunction: presenter.validateFirstName,
          hintText: 'Paul',
          labelText: R.strings.firstName,
          errorText: snapshot.data?.description,
          keyboardType: TextInputType.name,
        );
      },
    );
  }
}