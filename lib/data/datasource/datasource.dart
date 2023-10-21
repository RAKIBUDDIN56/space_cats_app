import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_cats_app/data/models/user.dart';
import 'package:space_cats_app/utils/services/services.dart';
import 'package:space_cats_app/utils/utils.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Datasource {
  static final Datasource _instance = Datasource._();
  factory Datasource() => _instance;
  Datasource._() {
    _initDb();
  }
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'test.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppKeys.dbTableUsers} (
        ${Users.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Users.name} TEXT,
        ${Users.phoneNumber} TEXT,
        ${Users.email} TEXT,
        ${Users.password} TEXT
       
      )
    ''');
  }

  Future<int> addUser(User user) async {
    final db = await database;
    return db.transaction((txn) async {
      int userId = await txn.insert(
        AppKeys.dbTableUsers,
        user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      user.id = userId;
      Services.user = user;
      setUserData(user);
      return userId;
    });
  }

  Future<List<dynamic>> signIn(User user) async {
    final db = await database;
    List res = await db.rawQuery(
      'SELECT * from ${AppKeys.dbTableUsers} WHERE phoneNumber="${user.phoneNumber}" AND password ="${user.password}"',
    );
    if (res.isNotEmpty) {
      user.copyWith(id: res[0]["id"]!);
      Services.user = user;
      setUserData(user);
    }

    return res;
  }

  Future<User> getUser() async {
    final db = await database;
    var response = await db.query(
      AppKeys.dbTableUsers,
      where: 'phoneNumber = "${Services.user!.phoneNumber}"',
    );

    return User.fromJson(response[0]);
  }

  Future<void> setUserData(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'user',
      jsonEncode(user),
    );
  }
}
