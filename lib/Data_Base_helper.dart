import 'package:path/path.dart';
import 'package:shpopping_cart_provider_state_management/Cart_Model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DBHepler{
  static Database? _db;

Future<Database?> get db async{
  if(_db != null){
    return _db!;
  }
_db = await initdatabase();
// return _db;
}

initdatabase() async {
  io.Directory Documentdidirectory = await getApplicationDocumentsDirectory();
  String path = join(Documentdidirectory.path,'cart.db');
  var db = await openDatabase(path,version: 1,onCreate: _onCreate);
  return db;
}

  _onCreate (Database db , int version )async{
    await db
        .execute('CREATE TABLE cart (id INTEGER PRIMARY KEY , productId VARCHAR UNIQUE,productName TEXT,initialPrice INTEGER, productPrice INTEGER , quantity INTEGER, unitTag TEXT , image TEXT )');
  }
  
  Future<Cart> insert(Cart cart) async {
    var dbClient =  await db;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

}