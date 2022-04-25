import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';

var bootstrapSignalProvider = Provider((ref) => BootstrapSignal());

class BootstrapSignal extends Signal0 {}
