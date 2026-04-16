import 'package:aula_sql_lite/model/cliente.dart';
import 'package:sqflite/sqflite.dart';

class ControlCliente{
static final _databaseName = "test.db";
static Database? database;

ControlCliente();

Future startDatabase() async {
  if(database != null) {
    return database;
  }
  database = await _openCreateDatabase();
  return database;
}


Future _openCreateDatabase() async{
  var databasePath = await getDatabasesPath();
  String path = databasePath + _databaseName;
  return await openDatabase(path, version: 1, onCreate: _onCreate);
}

Future _onCreate(Database db, int version) async {
  await db.execute(
    'CREATE TABLE IF NOT EXISTS CLIENTE (nome TEXT, endereco TEXT, cidade TEXT, nasc TEXT',
  );
}
Future insetDatabase(Cliente cli) async {
    Database db = await startDatabase();
    String sql = "";
    sql = 'INSET INTO Cliente (nome, cidade, endereco, nasc) VALUES (${cli.nome}, ${cli.cidade}, ${cli.endereco}, ${cli.nascimento})';
    try {
      await db.rawInsert(sql);
      print('Cliente inserido');
    }
    finally {
      //await db.close();
    }
}
Future<List<Map<String,dynamic>>> queryFind(String parametro) async{
  Database db = await startDatabase();
  return await (db.rawQuery('SELECT * FROM Cliente where nome like "%$parametro%'));
}
}