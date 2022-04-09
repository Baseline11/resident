import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../components/components.dart';
import './../../../../helpers/helpers.dart';

import './../../signup_presenter.dart';

class UsernameInput extends StatefulWidget {
  @override
  State<UsernameInput> createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {
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
      stream: presenter.usernameErrorStream,
      builder: (context, snapshot) {
        return Input(
          focusNode: focusNode,
          textFormFieldKey: key,
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
          isInputValid: presenter.username != null && snapshot.data == null,
        );
      },
    );
  }
}
