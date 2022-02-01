import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_project/model/cart_model.dart';
import 'package:test_project/model/product_model.dart';

class CartDatabaseHelper {
  static final _databaseName = "My_Database.db";
  static final _databaseVersion = 1;

  static final table = 'myCart';

  static final columnId = 'productId';
  static final columnName = 'name';
  static final columnImage = 'image';
  static final columnPrice = 'price';
  static final columnQuantity = 'quantity';

  // make this a singleton class
  CartDatabaseHelper._privateConstructor();
  static final CartDatabaseHelper instance =
      CartDatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnName TEXT NOT NULL,
            $columnImage TEXT NOT NULL,
            $columnPrice TEXT NOT NULL,
            $columnQuantity INTEGER NOT NULL,
            $columnId TEXT NOT NULL )
          ''');
  }

  // inserted row.
  Future<int> insert(CartModel model) async {
    Database db = await instance.database;
    return await db.insert(table, model.toJson());
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<CartModel>> queryAllRows() async {
    Database db = await instance.database;
    List<Map> maps = await db.query(table);
    List<CartModel> list = maps.isNotEmpty
        ? maps.map((product) => CartModel.fromJson(product)).toList()
        : [];

    return list;
  }

  updateProduct(CartModel model) async {
    Database db = await instance.database;
    return await db.update(
      table,
      model.toJson(),
      where: '$columnId = ?',
      whereArgs: [model.productId]
    );
  }

   Future<int> delete(String id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }


}
