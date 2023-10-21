import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/data/data.dart';
import 'package:space_cats_app/providers/user/user_notifier.dart';
import 'package:space_cats_app/providers/user/user_state.dart';

final usersProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final repository = ref.watch(repositoryProvider);
  return UserNotifier(repository);
});
final appThemeProvider = StateProvider<bool>((ref) => false);
final appLanguageProvider = StateProvider<String>((ref) => "en");
final appLanguageListProvider = StateProvider<String>((ref) => "English");
