import 'package:database_local/controller/homepage_controller.dart';
import 'package:database_local/models/user_model.dart';
import 'package:database_local/pages/edit_data.dart';
import 'package:database_local/pages/form_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FLutter SQFlite CRUD"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<UserModel>>(
            future: controller.index(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      UserModel user = snapshot.data![index];
                      print(user.nama);
                      return ListTile(
                        leading: CircleAvatar(child: Icon(Icons.person)),
                        title: Text(user.nama! ?? ""),
                        subtitle: Text(user.email! ?? ""),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.delete(user.id!);
                                  Get.offAll(HomePage());
                                },
                                icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {
                                  print(user.nama!);
                                  Get.to(EditData(), arguments: [
                                    user.id,
                                    user.nama,
                                    user.email!
                                  ]);
                                },
                                icon: Icon(Icons.edit)),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
              onPressed: () {
                Get.to(FormDataView());
              },
              child: Icon(Icons.add)),
        ));
  }
}
