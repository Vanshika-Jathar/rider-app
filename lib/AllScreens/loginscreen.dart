import 'package:flutter/material.dart';

class loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height:  200.0,
              alignment: Alignment.center,
            ),
            SizedBox(height: 1.0),
            Text(
              "login as a Rider",
              style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
              textAlign: TextAlign.center ,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 1.0,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      hintStyle: TextStyle(
                        color:  Colors.grey,
                        fontSize:  10.0,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 1.0,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      hintStyle: TextStyle(
                        color:  Colors.grey,
                        fontSize:  10.0,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 1.0,),
                  RaisedButton(
                    color:  Colors.yellow,
                    textColor: Colors.white,
                    child: Container(
                      height: 50.0,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18.0, fontFamily: "Brand Bold"),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0),
                    ),
                    onPressed: ()
                      {
                        print("loggedin button clicked");
                      }
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: ()
              {
                print("clicked");
              },
              child: Text(
                "Do not have an Account? Register Here.",
              ),
            )
          ],
         ),
       ),
     )
    );
  }
}