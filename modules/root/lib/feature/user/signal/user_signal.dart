import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';

var loginUserSignalProvider = Provider((ref) => LoginUserSignal());

class LoginUserSignal extends Signal1<LoginUserPayload> {}

// Todo: Try without payload. Store to hold these values instead
class LoginUserPayload {
  final String email;
  final String password;

  LoginUserPayload({required this.email, required this.password});
}
