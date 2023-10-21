import 'package:get_it/get_it.dart';
import 'package:space_cats_app/utils/services/services.dart';

final locator = GetIt.I;
void setupLocator() {
  locator.registerLazySingleton<Services>(() => Services());
}
