import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mad_final_exam/crud/crud.dart';
import 'package:mad_final_exam/screens/add_contact.dart';

class MyContacts extends StatefulWidget {
  const MyContacts({Key? key}) : super(key: key);

  @override
  State<MyContacts> createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  CRUD crudObj = CRUD();
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Contacts"),
      ),
      body: isLoad
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder(
              future: crudObj.fetchContact(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]["name"]),
                      subtitle: Text(snapshot.data[index]["phone"]),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isLoad = true;
                                });
                                await crudObj
                                    .deleteContact(snapshot.data[index]["id"]);
                                setState(() {
                                  isLoad = false;
                                });
                              },
                              child: const Icon(Icons.delete),
                            ),
                            const SizedBox(width: 30),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AddContacts())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
