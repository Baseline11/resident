import 'dart:async';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_resident/presentation/mixins/mixins.dart';

import 'package:flutter_resident/ui/helpers/helpers.dart';
import 'package:flutter_resident/ui/pages/pages.dart';

class SignUpPresenterSpy extends Mock implements SignUpPresenter {
  final usernameErrorController = StreamController<UIError?>();
  final firstNameErrorController = StreamController<UIError?>();
  final lastNameErrorController = StreamController<UIError?>();
  final emailErrorController = StreamController<UIError?>();
  final mainErrorController = StreamController<UIError?>();
  final navigateToController = StreamController<NavigationState?>();
  final isFormValidController = StreamController<bool>();
  final isLoadingController = StreamController<bool>();

  SignUpPresenterSpy() {
    when(() => this.usernameErrorStream)
        .thenAnswer((_) => usernameErrorController.stream);
    when(() => this.firstNameErrorStream)
        .thenAnswer((_) => firstNameErrorController.stream);
    when(() => this.lastNameErrorStream)
        .thenAnswer((_) => lastNameErrorController.stream);
    when(() => this.emailErrorStream)
        .thenAnswer((_) => emailErrorController.stream);
    when(() => this.mainErrorStream)
        .thenAnswer((_) => mainErrorController.stream);
    when(() => this.navigateToStream)
        .thenAnswer((_) => navigateToController.stream);
    when(() => this.isFormValidStream)
        .thenAnswer((_) => isFormValidController.stream);
    when(() => this.isLoadingStream)
        .thenAnswer((_) => isLoadingController.stream);

    when(() => this.signUp()).thenAnswer((_) async => _);
  }

  void emitUsernameError(UIError error) => usernameErrorController.add(error);
  void emitUsernameValid() => usernameErrorController.add(null);

  void emitFirstNameError(UIError error) => firstNameErrorController.add(error);
  void emitFirstNameValid() => firstNameErrorController.add(null);

  void emitLastNameError(UIError error) => lastNameErrorController.add(error);
  void emitLastNameValid() => lastNameErrorController.add(null);

  void emitEmailError(UIError error) => emailErrorController.add(error);
  void emitEmailValid() => emailErrorController.add(null);

  void emitFormError() => isFormValidController.add(false);
  void emitFormValid() => isFormValidController.add(true);

  void emitLoading([bool show = true]) => isLoadingController.add(show);

  void emitMainError(UIError error) => mainErrorController.add(error);

  void emitNavigateTo(NavigationState navigationState) =>
      navigateToController.add(navigationState);

  void dispose() {
    usernameErrorController.close();
    lastNameErrorController.close();
    firstNameErrorController.close();
    emailErrorController.close();
    isFormValidController.close();
    isLoadingController.close();
    mainErrorController.close();
    navigateToController.close();
  }
}
