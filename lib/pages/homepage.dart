import 'package:flutter/material.dart';
import 'package:security_app/pages/addsecurity.dart';

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
        appBar: AppBar(backgroundColor: Colors.blueAccent,),
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
