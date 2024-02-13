import 'package:flutter/material.dart';
import 'package:security_app/pages/addvisitor.dart';
import 'package:security_app/services/securityservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecurityLogin extends StatefulWidget {
  const SecurityLogin({super.key});

  @override
  State<SecurityLogin> createState() => _SecurityLoginState();
}

class _SecurityLoginState extends State<SecurityLogin> {

  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  @override

  void securitylogin()async
  {
    final response=await SecurityApiService().SendSecurityLogin(email.text, password.text);
    if(response["status"]=="success")
      {

        String userId=response["userdata"]["_id"].toString();
        print("Successfully Logged In");
        SharedPreferences preferences=await SharedPreferences.getInstance();
        preferences.setString("userId", userId);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddVisitor()));


      }
    else if(response["status"]=="Invalid security")
      {
        print("User do not have an account");
      }
    else
      {
        print("Incorrect credentials");
      }
    print(response);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueAccent,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white
            ),
              onPressed: ()
              {
                Navigator.pop(context);
              }, child: Icon(Icons.backspace_outlined))
        ],),
        body: Container(padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Security Login",style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email id"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password"
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                    )
                  ),
                    onPressed:securitylogin, child: Text("Login")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
