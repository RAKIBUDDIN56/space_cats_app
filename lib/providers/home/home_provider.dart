import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/data/data.dart';
import 'package:space_cats_app/providers/providers.dart';

final userProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repository = ref.watch(repositoryProvider);
  return HomeNotifier(repository);
});
