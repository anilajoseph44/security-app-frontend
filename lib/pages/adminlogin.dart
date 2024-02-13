import 'package:flutter/material.dart';
import 'package:security_app/pages/addsecurity.dart';
import 'package:security_app/pages/homepage.dart';
import 'package:security_app/pages/security_login.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController username=new TextEditingController();
  TextEditingController password=new TextEditingController();
  String error="";

  void adminlogin()
  {
    if(username.text=="admin" && password.text=="12345")
      {

        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

      }
    else
      {
        setState(() {
          error="Invalid credentials..!!";
        });

      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent,),
      body: SingleChildScrollView(
        child: Container(padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Admin Login",style: TextStyle(fontSize: 20),),
              SizedBox(height: 30,),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username"
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password"
                ),
              ),
              SizedBox(height: 15,),
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
                    onPressed: adminlogin, child: Text("LogIn")),
              ),
              SizedBox(height: 3,),
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
                    onPressed: ()
                    {
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SecurityLogin()));
        
                    }
                    ,
                    child: Text("Security click here")),
              ),
              SizedBox(height: 50,),
              Text(error,style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
