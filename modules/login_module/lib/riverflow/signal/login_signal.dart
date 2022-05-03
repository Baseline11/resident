import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';

import '../payload/payload.dart';

var loginUserSignalProvider = Provider((ref) => LoginUserSignal());

class LoginUserSignal extends Signal1<LoginUserPayload> {}

var verifyNumberSignalProvider = Provider((ref) => VerifyNumberSignal());

class VerifyNumberSignal extends Signal0 {}

var verifyCodeSignalProvider = Provider((ref) => VerifyCodeSignal());

class VerifyCodeSignal extends Signal1<VerifyCodePayload> {}
