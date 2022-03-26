import './../../domain/domain.dart';
import './../../data/usecases/usecases.dart';

class GlobalLogOut implements LogOut {
  final FirebaseLogOut remote;
  final LocalLogOut local;

  GlobalLogOut({
    required this.remote,
    required this.local,
  });

  Future<void> logOut() async {
    try {
      await local.logOut();
      await remote.logOut();
    } catch (error) {
      rethrow;
    }
  }
}
