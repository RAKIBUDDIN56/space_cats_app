import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/data/data.dart';

final repositoryProvider = Provider<Repository>((ref) {
  final datasource = ref.read(datasourceProvider);
  return RepositoryImpl(datasource);
});
