import 'package:auth_service/auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var authServiceProvider = Provider(
    (ref) => FirebaseUserAuthenticationService(container: ref.container));
