import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:database_local/models/user_model.dart';
import 'package:database_local/pages/homepage.dart';

class FormDataController extends GetxController {
  final TextEditingController namaTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  late Database? database;

  void insert() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);

    UserModel user = UserModel(
      nama: namaTextController.text,
      email: emailTextController.text,
    );
    final data = await database!.insert('user', user.toJson());
    Get.offAll(HomePage());
  }
}