import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_resident/presentation/mixins/navigation_manager.dart';
import 'package:flutter_resident/ui/components/components.dart';

import 'package:flutter_resident/ui/helpers/helpers.dart';
import 'package:flutter_resident/ui/pages/pages.dart';
import 'package:mocktail/mocktail.dart';

import './../helpers/helpers.dart';
import './../mocks/mocks.dart';

void main() {
  late SignUpPresenterSpy presenter;

  Future<void> loadPage(WidgetTester tester) async {
    presenter = SignUpPresenterSpy();
    await tester.pumpWidget(
      makePage(
        path: SignUpPage.routeName,
        page: () => IosSignUpPage(presenter),
      ),
    );
  }

  tearDown(() {
    presenter.dispose();
  });

  testWidgets(
    'Should call validate with correct values',
    (WidgetTester tester) async {
      await loadPage(tester);

      final result = find.bySemanticsLabel(R.strings.username);

      final username = faker.internet.userName();
      await tester.enterText(
          find.bySemanticsLabel(R.strings.username), username);
      verify(() => presenter.validateUsername(username));

      final firstName = faker.person.firstName();
      await tester.enterText(
          find.bySemanticsLabel(R.strings.firstName), firstName);
      verify(() => presenter.validateFirstName(firstName));

      final lastName = faker.person.lastName();
      await tester.enterText(
          find.bySemanticsLabel(R.strings.lastName), lastName);
      verify(() => presenter.validateLastName(lastName));

      final email = faker.internet.email();
      await tester.enterText(find.bySemanticsLabel(R.strings.email), email);
      verify(() => presenter.validateEmail(email));
    },
  );

  testWidgets(
    'Should present username error',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitUsernameError(UIError.invalidField);
      await tester.pump();
      expect(find.text(UIError.invalidField.description), findsOneWidget);

      presenter.emitUsernameError(UIError.requiredField);
      await tester.pump();
      expect(find.text(UIError.requiredField.description), findsOneWidget);

      presenter.emitUsernameValid();
      await tester.pump();
      expect(
        find.descendant(
          of: find.bySemanticsLabel(R.strings.username),
          matching: find.byType(Text),
        ),
        findsNWidgets(2),
      );
    },
  );

  testWidgets(
    'Should present first name error',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitFirstNameError(UIError.invalidField);
      await tester.pump();
      expect(find.text(UIError.invalidField.description), findsOneWidget);

      presenter.emitFirstNameError(UIError.requiredField);
      await tester.pump();
      expect(find.text(UIError.requiredField.description), findsOneWidget);

      presenter.emitFirstNameValid();
      await tester.pump();
      expect(
        find.descendant(
          of: find.bySemanticsLabel(R.strings.firstName),
          matching: find.byType(Text),
        ),
        findsNWidgets(2),
      );
    },
  );

  testWidgets(
    'Should present last name error',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitLastNameError(UIError.invalidField);
      await tester.pump();
      expect(find.text(UIError.invalidField.description), findsOneWidget);

      presenter.emitLastNameError(UIError.requiredField);
      await tester.pump();
      expect(find.text(UIError.requiredField.description), findsOneWidget);

      presenter.emitLastNameValid();
      await tester.pump();
      expect(
        find.descendant(
          of: find.bySemanticsLabel(R.strings.lastName),
          matching: find.byType(Text),
        ),
        findsNWidgets(2),
      );
    },
  );

  testWidgets(
    'Should present email error',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitEmailError(UIError.invalidField);
      await tester.pump();
      expect(find.text(UIError.invalidField.description), findsOneWidget);

      presenter.emitEmailError(UIError.requiredField);
      await tester.pump();
      expect(find.text(UIError.requiredField.description), findsOneWidget);

      presenter.emitEmailValid();
      await tester.pump();
      expect(
        find.descendant(
          of: find.bySemanticsLabel(R.strings.email),
          matching: find.byType(Text),
        ),
        findsNWidgets(2),
      );
    },
  );

  testWidgets(
    'Should enable button if form is valid',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitFormValid();
      await tester.pump();

      final button = tester.widget<PrimaryButton>(find.byType(PrimaryButton));

      expect(
        button.onPressed,
        isNotNull,
      );
    },
  );

  testWidgets(
    'Should disable button if form is invalid',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitFormError();
      await tester.pump();

      final button = tester.widget<PrimaryButton>(find.byType(PrimaryButton));

      expect(
        button.onPressed,
        null,
      );
    },
  );

  testWidgets(
    'Should call signUp on form submit',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitFormValid();
      await tester.pump();
      final button = find.byType(PrimaryButton);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pump();

      verify(() => presenter.signUp()).called(1);
    },
  );

  testWidgets(
    'Should handle loading correctly',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitLoading();
      await tester.pump(Duration(
        milliseconds: 100,
      ));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      presenter.emitLoading(false);
      await tester.pump(Duration(
        milliseconds: 100,
      ));
      expect(find.byType(CircularProgressIndicator), findsNothing);

      presenter.emitLoading();
      await tester.pump(Duration(
        milliseconds: 100,
      ));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'Should present error message if authentication fails',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitMainError(UIError.emailInUse);
      await tester.pump();

      expect(find.text(UIError.emailInUse.description), findsOneWidget);
    },
  );

  testWidgets(
    'Should present error message if authentication throws',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitMainError(UIError.unexpected);
      await tester.pump();

      expect(find.text(UIError.unexpected.description), findsOneWidget);
    },
  );

  testWidgets(
    'Should change page',
    (WidgetTester tester) async {
      await loadPage(tester);

      presenter.emitNavigateTo(NavigationState(route: '/any_route'));
      await tester.pumpAndSettle();

      expect(currentRoute, '/any_route');
      expect(find.text('fake page'), findsOneWidget);
    },
  );

  testWidgets('Should not change page', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitNavigateTo(NavigationState(route: ''));
    await tester.pump();
    expect(currentRoute, SignUpPage.routeName);
  });
}
