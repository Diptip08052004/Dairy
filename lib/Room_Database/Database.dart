import 'package:dairy/Room_Database/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@immutable
class RoomDatabase{
  static const String _databaseName='dairy.db';
  static const int _databaseVersion=1;

  const RoomDatabase._privateContructor();
  static const RoomDatabase instance=RoomDatabase._privateContructor();

  static Database? _database;

  Future<Database> get database async{
    if(_database!=null)return _database!;

    _database =await _initDatabase();
    return _database!;
  }
  Future<Database>_initDatabase()async{
    String dpPath=await getDatabasesPath();
    final String path=join(dpPath,_databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _CreateDB,
    );
  }

  Future _CreateDB(
          Database db,
          int version,
      )async{
    const idType='INTEGER PRIMARY KEY AUTOINCRIMENT';
    const textType='TEXT NOT NULL';
    const boolText='BOOLEAN NOT NULL';
    await db.execute('''
    CREATE TABLE IF NOT EXIST $productTable(
          ${ProductFields.id}$idType,
          ${ProductFields.name}$textType,
          ${ProductFields.mbno}$textType,
          ${ProductFields.MerchantID}$textType,
          ${ProductFields.BTname}$textType,
          ${ProductFields.BTadd}$textType,
          ${ProductFields.mode}$boolText,
    )
    ''');
  }
  Future<Product>createProduct(Product product)async{
    final db=await instance.database;
    final id= await db.insert(
        productTable,
        product.toMap(),
    );
    return product.copy(id: id);
  }

  Future<Product>readProduct(int id) async{
    final db=await instance.database;
    final productData=await db.query(
        productTable,
        columns: ProductFields.values,
      where: '${ProductFields.id}=?',
      whereArgs: [id],
    );
    if(productData.isNotEmpty){
      return Product.fromMap(productData.first);
    }else{
      throw Exception('Could not find a product with the given ID');
    }
  }

  Future<List<Product>>readAllProduct() async{
    final db=await instance.database;
    final result=
    await db.query(productTable, orderBy: '${ProductFields.id} ASC');
    return result.map((productData) => Product.fromMap(productData)).toList();
  }

  Future<int>updateProduct(Product product) async{
    final db=await instance.database;
    return await db.update(
        productTable,
        product.toMap(),
        where: '${ProductFields.id}=?',
        whereArgs: [product.id],
    );
  }

  Future<int>markPaymentSuccessful({
    required int id,
    required bool mode,
})async{
    final db= await instance.database;
    return await db.update(
        productTable,
        {
          ProductFields.mode:mode? 1:0,
        },
      where:'${ProductFields.id}=?',
      whereArgs: [id],
    );
  }

  Future close() async{
    final db=await instance.database;
    db.close();
  }
}