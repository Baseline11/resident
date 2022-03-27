import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_resident/domain/domain.dart';

import 'package:flutter_resident/ui/helpers/errors/errors.dart';
import 'package:flutter_resident/presentation/presenters/presenters.dart';
import 'package:flutter_resident/presentation/protocols/protocols.dart';

import './../../domain/mocks/mocks.dart';
import './../mocks/mocks.dart';

void main() {
  late GetxSignUpPresenter sut;
  late AddAccountSpy addAccount;
  late ValidationSpy validation;
  late SaveCurrentAccountSpy saveCurrentAccount;
  late String username;
  late String firstName;
  late String lastName;
  late String email;

  late AccountEntity account;

  setUp(() {
    username = faker.internet.userName();
    firstName = faker.person.firstName();
    lastName = faker.person.lastName();
    email = faker.internet.email();
    account = EntityFactory.makeAccount();
    validation = ValidationSpy();
    addAccount = AddAccountSpy();
    addAccount.mockAddAccount(account);
    saveCurrentAccount = SaveCurrentAccountSpy();
    sut = GetxSignUpPresenter(
      validation: validation,
      saveCurrentAccount: saveCurrentAccount,
      addAccount: addAccount,
    );
  });

  setUpAll(() {
    registerFallbackValue(ParamsFactory.makeAddAccount());
    registerFallbackValue(EntityFactory.makeAccount());
  });

  group('Username field', () {
    test('Should call Validation with correct username', () {
      final formData = {
        'username': username,
        'first_name': null,
        'last_name': null,
        'email': null,
      };

      sut.validateUsername(username);

      verify(
        () => validation.validate(
          field: 'username',
          input: formData,
        ),
      ).called(1);
    });

    test('Should emit requiredFieldError if username is empty', () {
      validation.mockValidationError(value: ValidationError.requiredField);

      sut.usernameErrorStream.listen(
        expectAsync1(
          (error) => expect(error, UIError.requiredField),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateUsername(username);
      sut.validateUsername(username);
    });

    test('Should emit username error null if validation succeeds', () {
      sut.usernameErrorStream.listen(
        expectAsync1(
          (error) => expect(error, null),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateUsername(username);
      sut.validateUsername(username);
    });
  });

  group('First name field', () {
    test('Should call Validation with correct first name', () {
      final formData = {
        'username': null,
        'first_name': firstName,
        'last_name': null,
        'email': null,
      };

      sut.validateFirstName(firstName);

      verify(
        () => validation.validate(
          field: 'first_name',
          input: formData,
        ),
      ).called(1);
    });

    test('Should emit invalidFieldError if first name is invalid', () {
      validation.mockValidationError(value: ValidationError.invalidField);

      sut.firstNameErrorStream.listen(
        expectAsync1(
          (error) => expect(error, UIError.invalidField),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateFirstName(firstName);
      sut.validateFirstName(firstName);
    });

    test('Should emit requiredFieldError if first name is empty', () {
      validation.mockValidationError(value: ValidationError.requiredField);

      sut.firstNameErrorStream.listen(
        expectAsync1(
          (error) => expect(error, UIError.requiredField),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateFirstName(firstName);
      sut.validateFirstName(firstName);
    });

    test('Should emit null if validation succeeds', () {
      sut.firstNameErrorStream.listen(
        expectAsync1(
          (error) => expect(error, null),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateFirstName(firstName);
      sut.validateFirstName(firstName);
    });
  });

  group('Last name field', () {
    test('Should call Validation with correct last name', () {
      final formData = {
        'username': null,
        'first_name': null,
        'last_name': lastName,
        'email': null,
      };

      sut.validateLastName(lastName);

      verify(
        () => validation.validate(
          field: 'last_name',
          input: formData,
        ),
      ).called(1);
    });

    test('Should emit invalidFieldError if last name is invalid', () {
      validation.mockValidationError(value: ValidationError.invalidField);

      sut.lastNameErrorStream.listen(
        expectAsync1(
          (error) => expect(error, UIError.invalidField),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateLastName(lastName);
      sut.validateLastName(lastName);
    });

    test('Should emit requiredFieldError if last name is empty', () {
      validation.mockValidationError(value: ValidationError.requiredField);

      sut.lastNameErrorStream.listen(
        expectAsync1(
          (error) => expect(error, UIError.requiredField),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateLastName(firstName);
      sut.validateLastName(firstName);
    });

    test('Should emit null if validation succeeds', () {
      sut.lastNameErrorStream.listen(
        expectAsync1(
          (error) => expect(error, null),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateLastName(lastName);
      sut.validateLastName(lastName);
    });
  });

  group('Email field', () {
    test('Should call Validation with correct email', () {
      final formData = {
        'username': null,
        'first_name': null,
        'last_name': null,
        'email': email,
      };

      sut.validateEmail(email);

      verify(
        () => validation.validate(
          field: 'email',
          input: formData,
        ),
      ).called(1);
    });

    test('Should emit invalidFieldError if email is invalid', () {
      validation.mockValidationError(value: ValidationError.invalidField);

      sut.emailErrorStream.listen(
        expectAsync1(
          (error) => expect(error, UIError.invalidField),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateEmail(email);
      sut.validateEmail(email);
    });

    test('Should emit requiredFieldError if email is empty', () {
      validation.mockValidationError(value: ValidationError.requiredField);

      sut.emailErrorStream.listen(
        expectAsync1(
          (error) => expect(error, UIError.requiredField),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateEmail(email);
      sut.validateEmail(email);
    });

    test('Should emit null if validation succeeds', () {
      sut.emailErrorStream.listen(
        expectAsync1(
          (error) => expect(error, null),
        ),
      );
      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateEmail(email);
      sut.validateEmail(email);
    });
  });

  test('Should disable form button if any field is invalid', () {
    validation.mockValidationError(
        field: 'email', value: ValidationError.invalidField);

    sut.isFormValidStream.listen(
      expectAsync1(
        (isValid) => expect(isValid, false),
      ),
    );

    sut.validateEmail(email);
    sut.validateUsername(username);
  });

  test('Should enable form button if all fields are valid', () async {
    expectLater(
      sut.isFormValidStream,
      emitsInOrder([false, true]),
    );

    sut.validateUsername(username);
    await Future.delayed(Duration.zero);
    sut.validateFirstName(firstName);
    await Future.delayed(Duration.zero);
    sut.validateLastName(lastName);
    await Future.delayed(Duration.zero);
    sut.validateEmail(email);
  });

  test('Should call AddAccount with correct values', () async {
    sut.validateUsername(username);
    sut.validateFirstName(firstName);
    sut.validateLastName(lastName);
    sut.validateEmail(email);

    await sut.signUp();

    verify(
      () => addAccount.add(
        AddAccountParams(
          username: username,
          firstName: firstName,
          lastName: lastName,
          email: email,
        ),
      ),
    ).called(1);
  });

  test('Should call SaveCurrentAccount with correct value', () async {
    sut.validateUsername(username);
    sut.validateFirstName(firstName);
    sut.validateLastName(lastName);
    sut.validateEmail(email);

    await sut.signUp();

    verify(
      () => saveCurrentAccount.save(account),
    ).called(1);
  });

  test('Should emit UnexpectedError if SaveCurrentAccount fails', () async {
    saveCurrentAccount.mockSaveCurrentAccountError();
    sut.validateUsername(username);
    sut.validateFirstName(firstName);
    sut.validateLastName(lastName);
    sut.validateEmail(email);

    expectLater(
      sut.mainErrorStream,
      emitsInAnyOrder([null, UIError.unexpected]),
    );
    expectLater(
      sut.isLoadingStream,
      emitsInAnyOrder([true, false]),
    );

    await sut.signUp();
  });

  test('Should emit correct events on AddAccount success', () async {
    sut.validateUsername(username);
    sut.validateFirstName(firstName);
    sut.validateLastName(lastName);
    sut.validateEmail(email);

    expectLater(
      sut.mainErrorStream,
      emits(null),
    );
    expectLater(
      sut.isLoadingStream,
      emits(true),
    );

    await sut.signUp();
  });

  test('Should emit correct events on EmailInUseError', () async {
    addAccount.mockAddAccountError(DomainError.emailInUse);
    sut.validateUsername(username);
    sut.validateFirstName(firstName);
    sut.validateLastName(lastName);
    sut.validateEmail(email);

    expectLater(
      sut.mainErrorStream,
      emitsInAnyOrder([null, UIError.emailInUse]),
    );
    expectLater(
      sut.isLoadingStream,
      emitsInAnyOrder([true, false]),
    );

    await sut.signUp();
  });

  test('Should emit correct events on UnexpectedError', () async {
    addAccount.mockAddAccountError(DomainError.unexpected);
    sut.validateUsername(username);
    sut.validateFirstName(firstName);
    sut.validateLastName(lastName);
    sut.validateEmail(email);

    expectLater(
      sut.mainErrorStream,
      emitsInAnyOrder([null, UIError.unexpected]),
    );
    expectLater(
      sut.isLoadingStream,
      emitsInAnyOrder([true, false]),
    );

    await sut.signUp();
  });

  test('Should change page on success', () async {
    sut.validateUsername(username);
    sut.validateFirstName(firstName);
    sut.validateLastName(lastName);
    sut.validateEmail(email);

    sut.navigateToStream.listen(
      expectAsync1(
        (page) => '/flutter_resident',
      ),
    );

    await sut.signUp();
  });

  test('Should go to Login page on link click', () async {
    sut.navigateToStream.listen(
      expectAsync1(
        (page) => '/login',
      ),
    );

    sut.goToLogin();
  });
}
