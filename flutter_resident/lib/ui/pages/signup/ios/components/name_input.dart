import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../components/components.dart';
import './../../../../helpers/helpers.dart';

import './../../signup_presenter.dart';

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError?>(
      stream: presenter.nameErrorStream,
      builder: (context, snapshot) {
        return Input(
          onChangedFunction: presenter.validateName,
          hintText: 'Matheus',
          labelText: R.strings.name,
          errorText: snapshot.data?.description,
          prefix: Padding(
            padding: EdgeInsets.only(left: 20, right: 10),
            child: Icon(
              Icons.person,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          keyboardType: TextInputType.name,
        );
      },
    );
  }
}
