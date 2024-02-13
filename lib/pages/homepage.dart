import 'package:flutter/material.dart';
import 'package:security_app/pages/addsecurity.dart';
import 'package:security_app/pages/viewsecurity.dart';
import 'package:security_app/pages/viewvisitors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

              }, child: Text("Logout"))
        ],),
        body: Container(padding: EdgeInsets.all(90),
          child: Column(
            children: [
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSecurity()));

                    },
                    child: Text("ADD Security")),
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
                    onPressed: ()
                    {
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewSecurity()));

                    },
                    child: Text("View all securities")),
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
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewVisitors()));

                    },
                    child: Text("View all visitors")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
