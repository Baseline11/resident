import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_resident/ui/helpers/helpers.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';

import '../../factories.dart';

SplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(
      loadCurrentAccount: makeLocalLoadCurrentAccount(),
      initFirebase: () async {
        await Firebase.initializeApp();
        final pushNotificationService =
            PushNotificationService(FirebaseMessaging.instance);
        await pushNotificationService.initialise();
      });
}
