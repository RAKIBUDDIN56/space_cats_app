import 'package:space_cats_app/data/data.dart';
import 'package:space_cats_app/data/models/user.dart';

abstract class Repository {
  Future<int> addUser(User user);
  Future<List<dynamic>> signIn(User user);
  Future<User> getUser();
}
