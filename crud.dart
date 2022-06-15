import 'package:cloud_firestore/cloud_firestore.dart';

class CRUD {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  fetchContact() async {
    List<Map<String, dynamic>> list = [];
    QuerySnapshot<Map<String, dynamic>> query =
        await firestore.collection("contacts").get();

    query.docs.forEach((doc) {
      Map<String, dynamic> data = {
        "name": doc.data()["name"],
        "phone": doc.data()["phone"],
        "id": doc.id,
      };
      list.add(data);
    });
    return list;
  }

  deleteContact(String id) async {
    await firestore.collection("contacts").doc(id).delete();
  }

  addContact(String name, String phone) async {
    await firestore.collection("contacts").add({
      "name": name,
      "phone": phone,
    });
  }

  editContact(String name, String phone, String id) async {
    await firestore.collection("contacts").doc(id).set({
      "name": name,
      "phone": phone,
    });
  }
}
