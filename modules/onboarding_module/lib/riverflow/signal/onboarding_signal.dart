import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';

var updateCurrentPageSignalProvider =
    Provider((ref) => UpdateCurrentPageSignal());

var completeOnboardingSignalProvider =
    Provider((ref) => CompleteOnboardingSignal());

class UpdateCurrentPageSignal extends Signal1<int> {}

class CompleteOnboardingSignal extends Signal0 {}
