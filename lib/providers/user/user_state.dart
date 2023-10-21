import 'package:equatable/equatable.dart';
import 'package:space_cats_app/data/models/user.dart';

class UserState extends Equatable {
  final List<User> users;

  const UserState({
    required this.users,
  });
  const UserState.initial({
    this.users = const [],
  });

  UserState copyWith({
    List<User>? users,
  }) {
    return UserState(
      users: users ?? this.users,
    );
  }

  @override
  List<Object> get props => [users];
}
