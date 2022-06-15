import 'package:flutter/material.dart';
import 'package:mad_final_exam/crud/crud.dart';
import 'package:mad_final_exam/screens/my_contacts.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  final TextEditingController nameControlller = TextEditingController();
  final TextEditingController phoneControlller = TextEditingController();
  CRUD crudObj = CRUD();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              controller: nameControlller,
              decoration: const InputDecoration(hintText: "Enter name"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneControlller,
              decoration: const InputDecoration(hintText: "Enter phone number"),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyContacts()));
                        },
                        child: const Text("Cancel"))),
                Container(
                  width: 130,
                  child: ElevatedButton(
                      onPressed: () async {
                        await crudObj.addContact(
                            nameControlller.text, phoneControlller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyContacts()));
                      },
                      child: const Text("Save Contact")),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
