import 'package:get/route_manager.dart';

import './../../presentation/mixins/mixins.dart';

mixin NavigationManager {
  void handleNavigation({
    required Stream<NavigationState?> stream,
  }) {
    stream.listen(
      (navigationState) {
        if (navigationState != null &&
            navigationState.route.isNotEmpty == true) {
          if (navigationState.clear == true) {
            Get.offAllNamed(navigationState.route);
          } else {
            Get.toNamed(navigationState.route)?.then(
              navigationState.onPop != null ? navigationState.onPop! : (_) {},
            );
          }
        }
      },
    );
  }
}
