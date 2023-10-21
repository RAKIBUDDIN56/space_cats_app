import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/data/data.dart';
import 'package:space_cats_app/providers/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  final Repository _repository;

  UserNotifier(this._repository) : super(const UserState.initial());

  Future<int> createUser(User user) async {
    try {
      return await _repository.addUser(user);
    } catch (e) {
      debugPrint(e.toString());
      throw '$e';
    }
  }

  Future<List<dynamic>> signin(User user) async {
    try {
      return await _repository.signIn(user);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
