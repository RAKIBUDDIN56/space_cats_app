import 'package:space_cats_app/data/data.dart';
import 'package:space_cats_app/data/models/user.dart';

class RepositoryImpl implements Repository {
  final Datasource _datasource;
  RepositoryImpl(this._datasource);

  @override
  Future<int> addUser(User user) async {
    try {
      return await _datasource.addUser(user);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<dynamic>> signIn(User user) async {
    try {
      return await _datasource.signIn(user);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<User> getUser() async {
    try {
      return await _datasource.getUser();
    } catch (e) {
      throw '$e';
    }
  }
}
