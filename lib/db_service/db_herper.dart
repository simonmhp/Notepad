import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DbHelper{
  Database? _database;

  Future<Database?> get database async{
    if(_database != null){
      return _database;
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "mydatabase.db");
    _database =
    await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, description TEXT, date TEXT)');
    });
    return _database;
  }

  // insertData() async {
  //   Database? db = await database;
  //   db?.insert("MyProfile", {
  //     "name": "Flutter demo",
  //     "age": 22,
  //     "address": "dhaka 1207",
  //     "num": 12.5,
  //   });
  // }


  Future<void> addnote(context, String? title, String? description) async {

    //item insert/add
    Database? db = await database;
    final now = DateTime.now();
    // final now = DateTime.now();
    db?.insert("Notes", {
      "title": title,
      "description": description,
      "date": '$now',
    });
    var snackBar = const SnackBar(content: Text('Title Added successfully '));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //database all data read
  Future<dynamic> readItems()async{
    Database? db = await database;
    final list = db?.query('Notes');
    return list;
  }

  //database all data update
  Future<dynamic> updateItems()async{
    Database? db = await database;
    final list = db?.update('Notes', {"title": "New Title", "description": "New Description"});
    return list;
  }

  //database data delete index by index in id
  Future<dynamic> deleteItems(int? id, context)async{
    Database? db = await database;
    await db?.delete('Notes',where: 'id = ?',whereArgs: [id]);
    var snackBar = const SnackBar(content: Text('Data deleted successfully'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // data/text/note user update
  Future<dynamic> noteupdate(int? id, Map<String, dynamic> data, context)async{
    Database? db = await database;
    await db?.update('Notes', data, where: 'id = ?', whereArgs: [id]);
  }

}