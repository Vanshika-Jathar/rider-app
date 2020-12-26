import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ridder_app/AllScreens/Mainscreen.dart';
import 'AllScreens/registerationScreen.dart';
import 'AllScreens/loginscreen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

  DatabaseReference  userRef = FirebaseDatabase.instance.reference().child("users");


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    fontFamily: "Signatra",
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      initialRoute:Loginscreen.idScreen,
      routes:
      {
        RegistrationScreen.idScreen: (context) => RegistrationScreen(),
        Loginscreen.idScreen: (context) => Loginscreen(),
        MainScreen.idScreen: (context) => MainScreen(),
      },

      debugShowCheckedModeBanner:false,
      );
  }
}
