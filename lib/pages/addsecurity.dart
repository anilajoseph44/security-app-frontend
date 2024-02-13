import 'package:flutter/material.dart';
import 'package:security_app/services/securityservices.dart';

class AddSecurity extends StatefulWidget {
  const AddSecurity({super.key});

  @override
  State<AddSecurity> createState() => _AddSecurityState();
}

class _AddSecurityState extends State<AddSecurity> {
  TextEditingController name=new TextEditingController();
  TextEditingController empid=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController phno=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();

  void SendSecurity()async
  {
    final response=await SecurityApiService().SendSecurityData(
        name.text,
        empid.text,
        address.text,
        phno.text,
        email.text,
        password.text);
    if(response["status"]=="success")
      {
        print("successfully added");
      }
    else
      {
        print("Error occured while adding....");
      }
  }
  @override
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

              },
              child: Icon(Icons.backspace_outlined,size: 30,))
        ],),
        body: SingleChildScrollView(
          child: Container(padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name"
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: empid,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Employee ID"
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Address"
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: phno,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number"
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email ID"
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "password"
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password"
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
                      onPressed: SendSecurity,
                      child: Text("Register")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
