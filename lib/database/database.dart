import 'dart:async';
import 'dart:io';
import 'package:cleaningapp/model/cleaning.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class SQLiteDbProvider {

  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await
    getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "HomeCleaningDB.db");
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE Cleaning ("
                  "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                  "cleaning_type TEXT NOT NULL,"
                  "cleaning_frequency TEXT NOT NULL,"
                  "cleaning_extra TEXT NOT NULL,"
                  "date_time TEXT NOT NULL"")"
          );
        }
    );
  }

  Future<List<Cleaning>> getAllCleanings() async {
    final db = await database;
    List<Map> results = await db.query(
        "Cleaning", columns: Cleaning.columns, orderBy: "id ASC"
    );
    List<Cleaning> products = [];
    results.forEach((result) {
      Cleaning product = Cleaning.fromMap(result);
      products.add(product);
    });
    return products;
  }


  Future<Cleaning> getCleaningById(int id) async {
    final db = await database;
    var result = await db.query("Cleaning", where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? Cleaning.fromMap(result.first) : Null;
  }


  insertCleaning(Cleaning cleaning) async {
    final db = await database;
    var maxIdResult = await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Cleaning");
    var id = maxIdResult.first["last_inserted_id"];
    // final i = await db.insert('Cleaning', cleaning.toMap());
    var result = await db.rawInsert(
        "INSERT Into Cleaning (id, cleaning_type, cleaning_frequency, cleaning_extra, date_time)"
            " VALUES (?, ?, ?, ?, ?)",
        [id, cleaning.cleaningType, cleaning.cleaningFrequency, cleaning.cleaningExtra, cleaning.dateTime]
    );
    return result;
  }


  updateCleaning(Cleaning cleaning) async {
    final db = await database;
    var result = await db.update(
        "Cleaning", cleaning.toMap(), where: "id = ?", whereArgs: [cleaning.id]
    );
    return result;
  }


  deleteCleaning(int id) async {
    final db = await database;
    db.delete("Cleaning", where: "id = ?", whereArgs: [id]);
  }
}

