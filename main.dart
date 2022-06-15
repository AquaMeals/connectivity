import 'package:flutter/material.dart';
import 'package:mad_final_exam/screens/my_contacts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final Future<FirebaseApp> _firebaseInstance = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return FutureBuilder(
      future: _firebaseInstance,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Has Error Found"));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyContacts(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
