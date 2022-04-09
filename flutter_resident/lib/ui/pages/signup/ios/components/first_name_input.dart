import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../components/components.dart';
import './../../../../helpers/helpers.dart';

import './../../signup_presenter.dart';

class FirstNameInput extends StatefulWidget {
  @override
  State<FirstNameInput> createState() => _FirstNameInputState();
}

class _FirstNameInputState extends State<FirstNameInput> {
  final FocusNode focusNode = FocusNode();
  final GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (focusNode.hasFocus == false) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError?>(
      stream: presenter.firstNameErrorStream,
      builder: (context, snapshot) {
        return Input(
          focusNode: focusNode,
          textFormFieldKey: key,
          onChangedFunction: presenter.validateFirstName,
          hintText: 'Paul',
          labelText: R.strings.firstName,
          errorText: snapshot.data?.description,
          keyboardType: TextInputType.name,
          isInputValid: presenter.firstName != null && snapshot.data == null,
        );
      },
    );
  }
}
