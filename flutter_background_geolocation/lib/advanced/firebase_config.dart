import 'package:meta/meta.dart';
import 'package:background_geolocation_firebase/background_geolocation_firebase.dart';

class FirebaseConfig {
  static setUp({
    @required String username,
  }) {
    // Configure the Firebase Adapter.
    BackgroundGeolocationFirebase.configure(
      BackgroundGeolocationFirebaseConfig(
        locationsCollection: "locations/$username",
        geofencesCollection: "geofences/$username",
        updateSingleDocument: false,
      ),
    );
  }
}
