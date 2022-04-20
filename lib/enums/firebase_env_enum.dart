// Define more environment types here if needed
enum FirebaseEnv {
  dev,
  staging,
}

extension FirebaseEnvExt on FirebaseEnv {
  String get fileName {
    return "environments/.env.${this.toString().split(".").last}";
  }
}
