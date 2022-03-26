import './../../../presentation/mixins/mixins.dart';

abstract class SplashPresenter {
  Stream<NavigationState?> get navigateToStream;

  Future<void> checkAccount({int durationInSeconds});
}
