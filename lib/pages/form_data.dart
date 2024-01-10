import 'package:database_local/controller/formdata_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDataView extends StatelessWidget {
  FormDataView({Key? key}) : super(key: key);
  final controller = Get.put(FormDataController());

  @override
  Widget build(BuildContext context) {
    Widget textInput(String label, String hint, TextEditingController textEditingController) {
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
          title: Text("Create Data"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            textInput("Nama", "Masukkan Nama", controller.namaTextController),
            textInput("Email", "Masukkan Email", controller.emailTextController),
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
