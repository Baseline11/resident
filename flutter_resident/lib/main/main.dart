import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './../ui/components/components.dart';
import './../ui/helpers/helpers.dart';
import './../ui/pages/pages.dart';
import './factories/factories.dart';

void main() {
  // To do in the Future: use FlutterNativeSplash.removeAfter(...)
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );

    AppConfig.setOrientation(portraitMode: true);

    return GetMaterialApp(
      title: 'Resident',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: SplashPage.routeName,
      getPages: [
        GetPage(
          name: SplashPage.routeName,
          page: makeSplashPage,
          transition: Transition.fade,
        ),
        GetPage(
          name: SignUpPage.routeName,
          page: makeSignUpPage,
        ),
      ],
    );
  }
}
