/*
 * author: Created by 李卓原 on 2019/3/12.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'dart:async';

import 'package:flutter_app/model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableNote = 'note11Table';
  final String pointID = 'pointid';
  final String image = 'image';
  final String contractId = 'contractId';
  final String publicationId = 'publicationId';
  final String pointLat = 'pointLat';
  final String pointLng = 'pointLng';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes11.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableNote($pointID TEXT PRIMARY KEY, $image TEXT, $contractId TEXT, $publicationId TEXT, $pointLng TEXT, $pointLat TEXT)');
  }

  Future<int> saveNote(Note note) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableNote, note.toMap());

    return result;
  }

  Future<List> getAllNotes({int limit, int offset}) async {
    var dbClient = await db;
    var result = await dbClient.query(
      tableNote,
      columns: [pointID, image, contractId, publicationId, pointLng, pointLat],
      limit: limit,
      offset: offset,
    );

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableNote'));
  }

  Future<Note> getNote(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableNote,
        columns: [
          pointID,
          image,
          contractId,
          publicationId,
          pointLng,
          pointLat
        ],
        where: '$pointID = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return new Note.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteNote(String images) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableNote, where: '$image = ?', whereArgs: [images]);
  }

  Future<int> updateNote(Note note) async {
    var dbClient = await db;
    return await dbClient.update(tableNote, note.toMap(),
        where: "$pointID = ?", whereArgs: [note.pointID]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
