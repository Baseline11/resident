import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../helpers/helpers.dart';
import './../../../../components/components.dart';

import './../../signup_presenter.dart';

class EmailInput extends StatefulWidget {
  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
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
      stream: presenter.emailErrorStream,
      builder: (context, snapshot) {
        return Input(
          focusNode: focusNode,
          textFormFieldKey: key,
          onChangedFunction: presenter.validateEmail,
          hintText: 'passaviore@resident.com',
          labelText: R.strings.email,
          errorText: snapshot.data?.description,
          keyboardType: TextInputType.emailAddress,
          isInputValid: presenter.email != null && snapshot.data == null,
        );
      },
    );
  }
}
