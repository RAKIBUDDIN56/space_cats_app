import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/data/datasource/datasource_dependecy.dart';

final datasourceProvider = Provider<Datasource>((ref) {
  return Datasource();
});
