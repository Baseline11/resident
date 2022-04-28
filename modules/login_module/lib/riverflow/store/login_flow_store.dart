import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/observable/login_flow_state_observable.dart';
import 'package:login_module/riverflow/payload/login_flow_state_payload.dart';
import 'package:riverflow/utils/store.dart';
import 'package:riverpod/src/framework.dart';

var loginFlowStoreProvider = Provider((ref) => LoginFlowStore(ref.container));

class LoginFlowStore extends BaseStore {
  LoginFlowStore(ProviderContainer providerContainer)
      : super(providerContainer);

  LoginFlowStateObservable get observable =>
      readObservable(loginFlowStateObservableProvider);

  void codeSent() {
    writeObservable(
        loginFlowStateObservableProvider, observable.copyWith(currentPage: 1));
  }

  void updateCountry(UpdateCountryPayload payload) {
    writeObservable(loginFlowStateObservableProvider,
        observable.copyWith(countryCode: payload.country));
  }

  void updatePhoneNumber(UpdateNumberPayload payload) {
    writeObservable(loginFlowStateObservableProvider,
        observable.copyWith(phoneNumber: payload.number));
  }

  void updatePageNumber(UpdateCurrentPagePayload payload) {
    writeObservable(loginFlowStateObservableProvider,
        observable.copyWith(currentPage: payload.index));
  }
}
