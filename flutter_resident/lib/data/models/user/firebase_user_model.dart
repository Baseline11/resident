import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

import '../../http/http.dart';

class FirebaseUserModel extends Equatable {
  final String? uid;
  final String? refreshToken;
  final String? name;
  final String? email;

  FirebaseUserModel({
    this.uid,
    this.refreshToken,
    this.email,
    this.name,
  });

  FirebaseUserModel copyWith({
    String? uid,
    String? refreshToken,
    String? name,
    String? email,
  }) {
    return FirebaseUserModel(
      uid: uid ?? this.uid,
      refreshToken: refreshToken ?? this.refreshToken,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('name') || !json.containsKey('email')) {
      throw HttpError.invalidData;
    }
    return FirebaseUserModel(name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };

  AccountEntity? toEntity() =>
      refreshToken != null ? AccountEntity(token: uid!) : null;

  List<Object?> get props => [uid, refreshToken, name, email];
}
