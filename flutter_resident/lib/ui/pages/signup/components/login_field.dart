import 'package:flutter/material.dart';

import './../../../components/components.dart';
import './../../../helpers/helpers.dart';

class LoginField extends StatelessWidget {
  final void Function()? onTap;

  LoginField({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            R.strings.alreadyHaveAnAccount,
            style: TextStyle(
              fontFamily: fontFamilyBrand,
              fontWeight: fontWeightMedium,
              fontSize: fontSizeXXS,
              color: colorBrandPrimaryDarkest,
            ),
          ),
          TextButton(
            child: Text(
              ' ${R.strings.login}',
              style: TextStyle(
                fontFamily: fontFamilyBrand,
                fontWeight: fontWeightBold,
                fontSize: fontSizeXXS,
                color: colorBrandPrimaryDark,
              ),
            ),
            onPressed: onTap,
          )
        ],
      ),
    );
  }
}
