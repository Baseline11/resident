import 'package:get/route_manager.dart';

mixin SessionManager {
  void handleSessionExpired({required Stream<bool> stream}) {
    stream.listen(
      (isExpired) {
        if (isExpired == true) {
          Get.offAllNamed('/login');
        }
      },
    );
  }
}
