import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../components/components.dart';
import './../../../../helpers/helpers.dart';

import './../../signup_presenter.dart';

class LastNameInput extends StatefulWidget {
  @override
  State<LastNameInput> createState() => _LastNameInputState();
}

class _LastNameInputState extends State<LastNameInput> {
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
      stream: presenter.lastNameErrorStream,
      builder: (context, snapshot) {
        return Input(
          focusNode: focusNode,
          textFormFieldKey: key,
          onChangedFunction: presenter.validateLastName,
          hintText: 'Jean-Luc',
          labelText: R.strings.lastName,
          errorText: snapshot.data?.description,
          keyboardType: TextInputType.name,
          isInputValid: presenter.lastName != null && snapshot.data == null,
        );
      },
    );
  }
}
