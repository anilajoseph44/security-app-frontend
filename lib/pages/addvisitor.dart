import 'package:flutter/material.dart';
import 'package:security_app/services/visitorservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddVisitor extends StatefulWidget {
  const AddVisitor({super.key});

  @override
  State<AddVisitor> createState() => _AddVisitorState();
}

class _AddVisitorState extends State<AddVisitor> {
  TextEditingController name=new TextEditingController();
  TextEditingController purpose=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController phno=new TextEditingController();
  @override
  void SendVisitorToApi()async
  {
    SharedPreferences prefer=await SharedPreferences.getInstance();
    String userId=prefer.getString("userId")??"";

    final response=await VisitorApiService().SendVisitorData(userId, name.text, purpose.text, address.text, phno.text);
    if(response["status"]=="success")
      {
        print("Successfully added.....................");
      }
    else
      {
        print("Error occured while adding");
      }
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
              }, child: Text("Logout"))
        ],),
        body: SingleChildScrollView(
          child: Container(padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Visitor Entry",style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name"
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: purpose,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Purpose"
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
                  controller: phno,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number"
                  ),
                ),
                SizedBox(height: 20,),
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
                      onPressed: SendVisitorToApi,
                      child: Text("Submit")),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
