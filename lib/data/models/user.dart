import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:space_cats_app/utils/utils.dart';

@immutable
class User extends Equatable {
  int? id;
  final String name;
  final String phoneNumber;
  final String email;

  final String password;

  User({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      Users.id: id,
      Users.name: name,
      Users.phoneNumber: phoneNumber,
      Users.email: email,
      Users.password: password,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map[Users.id],
      name: map[Users.name],
      phoneNumber: map[Users.phoneNumber],
      email: map[Users.email],
      password: map[Users.password],
    );
  }

  User copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? email,
    String? password,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  List<Object> get props {
    return [
      id ?? 0,
      name,
      phoneNumber,
      email,
      password,
    ];
  }
}
