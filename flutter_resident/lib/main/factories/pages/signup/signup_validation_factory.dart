import '../../../../presentation/protocols/protocols.dart';

import '../../../../validation/protocols/protocols.dart';
import './../../../composites/composites.dart';
import '../../../builders/builders.dart';

Validation makeSignUpValidation() {
  return ValidationComposite(
    makeSignUpValidations(),
  );
}

List<FieldValidation> makeSignUpValidations() {
  return [
    ...ValidationBuilder.field('username').required().min(3).build(),
    ...ValidationBuilder.field('first_name').required().min(3).build(),
    ...ValidationBuilder.field('last_name').required().min(3).build(),
    ...ValidationBuilder.field('email').required().email().build(),
  ];
}
