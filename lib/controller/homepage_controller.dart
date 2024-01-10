import 'dart:io';
import 'package:database_local/models/user_model.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class HomePageController extends GetxController {
  late Database? database;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<List<UserModel>> index() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    final data = await database!.query('user');
    List<UserModel> user = data.map((e) => UserModel.fromJson(e)).toList();
    return user;
  }

  Future<void> delete(int id) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    await database!.delete('user', where: 'id = ?', whereArgs: [id]);
  }
}