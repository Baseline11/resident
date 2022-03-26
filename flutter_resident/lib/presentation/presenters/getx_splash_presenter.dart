import 'package:get/state_manager.dart';

import './../../domain/domain.dart';
import './../../ui/pages/splash/splash.dart';

import './../mixins/mixins.dart';

class GetxSplashPresenter extends GetxController
    with NavigationManager
    implements SplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;
  final Future<void> Function() initFirebase;

  GetxSplashPresenter(
      {required this.loadCurrentAccount, required this.initFirebase});

  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(
      Duration(
        seconds: durationInSeconds,
      ),
    );
    try {
      await initFirebase();
      await loadCurrentAccount.load();
      navigateTo = NavigationState(route: '/signup', clear: true);
    } catch (error) {
      navigateTo = NavigationState(route: '/signup', clear: true);
    }
  }
}
