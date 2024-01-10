import 'package:database_local/controller/editdata_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditData extends StatelessWidget {
  EditData({Key? key}) : super(key: key);
  final controller = Get.put(EditDataController());

  @override
  Widget build(BuildContext context) {
    controller.data.value = Get.arguments;

    Widget textInput(String label, String hint,
        TextEditingController textEditingController) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Data"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            textInput("Nama", "Masukkan Nama", controller.nameTextController),
            textInput(
                "Email", "Masukkan Email", controller.emailTextController),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.insert();
                },
                child: Text("Simpan data"))
          ],
        ));
  }
}
