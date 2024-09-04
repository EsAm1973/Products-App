import 'package:path/path.dart';
import 'package:practice/models/product.dart';
import 'package:sqflite/sqflite.dart';

final String ColumnId = "id";
final String Columntitle = "title";
final String Columnimage = "image";
final String productstable = "products_table";

class ProductProvider {
  static final ProductProvider instance = ProductProvider._internal();
  factory ProductProvider() {
    return instance;
  }
  ProductProvider._internal();
  Database? db;
  Map<int, bool> isfavourite = {};
  Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), "products.db"),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE $productstable($ColumnId INTEGER,$Columntitle TEXT NOT NULL,$Columnimage TEXT NOT NULL)");
      },
    );
  }

  Future<Product> insert(Product product) async {
    await db!.insert(productstable, product.toMap());
    return product;
  }

  Future getproduct() async {
    final result = await db!.query(productstable);
    for (var item in result) {
      isfavourite.addAll({item["id"] as int: true});
    }
    return result;
  }

  Future<int> deleteproduct(int id) async {
    return await db!
        .delete(productstable, where: "$ColumnId = ?", whereArgs: [id]);
  }
}
