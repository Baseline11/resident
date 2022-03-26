import 'package:test/test.dart';

import 'package:flutter_resident/presentation/protocols/protocols.dart';
import 'package:flutter_resident/validation/validators/validators.dart';

void main() {
  late EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Should return null on invalid case', () {
    expect(sut.validate({}), null);
  });

  test('Should return null if email is empty', () {
    expect(sut.validate({'any_field': ''}), null);
  });

  test('Should return null if email is null', () {
    expect(sut.validate({'any_field': null}), null);
  });

  test('Should return null if email is valid', () {
    expect(sut.validate({'any_field': 'matheus@gmail.com'}), null);
  });

  test('Should return error if email is invalid', () {
    expect(
        sut.validate({'any_field': 'matheus'}), ValidationError.invalidField);
  });
}
