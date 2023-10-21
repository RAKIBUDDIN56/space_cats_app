import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_cats_app/data/data.dart';
import 'package:space_cats_app/providers/providers.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final Repository _repository;

  HomeNotifier(this._repository)
      : super(const HomeState.initial(status: HomeStateStatus.loading)) {
    getUser();
  }

  void getUser() async {
    try {
      final uerModel = await _repository.getUser();
      // state.taskModel = taskModel;

      state = state.copyWith(status: HomeStateStatus.success, user: uerModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void signout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
