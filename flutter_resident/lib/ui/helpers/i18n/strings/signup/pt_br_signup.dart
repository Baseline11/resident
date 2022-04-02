import 'package:flutter/material.dart';

import './signup_translation.dart';

class PtBrSignUp implements SignUpTranslation {
  String get page1Title => 'Nos diga um pouco sobre você';
  String get page1ButtonText => 'Prosseguir';
  List<TextSpan> sliderCard1Body(BuildContext context) => <TextSpan>[
        TextSpan(
          text:
              '“As a member of a democratic community, its often important to let others know who you are.\n\n',
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
        ),
        TextSpan(
          text:
              'Any personal information you provide within this app will not be shared with anyone unless you choose to.\n\n',
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
        ),
      ];
  String get sliderCard1Bottom => '- Resident';
}
