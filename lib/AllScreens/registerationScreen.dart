import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ridder_app/AllScreens/Mainscreen.dart';
import 'package:ridder_app/AllScreens/loginscreen.dart';
import 'package:ridder_app/main.dart';

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 35.0),
                Image(
                  image: AssetImage("images/logo.png"),
                  width: 390.0,
                  height: 200.0,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 1.0),
                Text(
                  "Register as a Rider",
                  style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 1.0,),
                      TextField(
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "NAME",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 1.0,),
                      TextField(
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "EMAIL",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 1.0,),
                      TextField(
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "PHONE",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 1.0,),
                      TextField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 1.0,),
                      RaisedButton(
                          color: Colors.yellow,
                          textColor: Colors.white,
                          child: Container(
                            height: 50.0,
                            child: Center(
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                    fontSize: 18.0, fontFamily: "Brand Bold"),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(24.0),
                          ),
                          onPressed: () {
                            if (nameTextEditingController.text.length < 3)
                            {
                              displayToastMessage("name must be atleast 3 characters.", context);
                            }
                            else if (!emailTextEditingController.text.contains("@"))
                            {
                              displayToastMessage("Email address is not valid", context);
                            }
                            else if (phoneTextEditingController.text.isEmpty)
                            {
                              displayToastMessage("phone number is mandatory", context);
                            }
                            else if (passwordTextEditingController.text.length < 6)
                            {
                              displayToastMessage("password must be atleast 6 charaters.", context);
                            }
                            else
                              {
                              regiterNewUser(context);
                            }
                          },
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Loginscreen.idScreen, (route) => false);
                  },
                  child: Text(
                    "Already have an Account? Login here",
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  regiterNewUser(BuildContext context) async
  {
    final User firebaseUser = (await _firebaseAuth
        .createUserWithEmailAndPassword(email: emailTextEditingController.text,
        password: passwordTextEditingController.text).catchError((errMsg){
          displayToastMessage("Error:"+errMsg.toString(), context);
    })).user;
    if (firebaseUser != null) //user created
       {
      //save user info to databse
      userRef.child(firebaseUser.uid);
      Map userDataMap ={
        "Name":nameTextEditingController.text.trim(),
        "Email":emailTextEditingController.text.trim(),
        "Phone":phoneTextEditingController.text.trim(),
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Congratulation!! your Account Hase been created.", context);
      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
      }
    else {
      //error occured -display error msg
      displayToastMessage("New User Account has not been created.", context);
    }
  }
}
   displayToastMessage(String message, BuildContext context)
   {
     Fluttertoast.showToast(msg:message );
   }
