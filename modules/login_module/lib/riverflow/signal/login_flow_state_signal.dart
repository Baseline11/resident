import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/payload/login_flow_state_payload.dart';
import 'package:riverflow/utils/signal.dart';

var updateCountrySignalProvider = Provider((ref) => UpdateCountrySignal());

class UpdateCountrySignal extends Signal1<UpdateCountryPayload> {}

var updateNumberSignalProvider = Provider((ref) => UpdateNumberSignal());

class UpdateNumberSignal extends Signal1<UpdateNumberPayload> {}

var updateCurrentPageSignalProvider =
    Provider((ref) => UpdateCurrentPageSignal());

class UpdateCurrentPageSignal extends Signal1<UpdateCurrentPagePayload> {}
