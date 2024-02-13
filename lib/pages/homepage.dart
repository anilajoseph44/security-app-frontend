import 'package:flutter/material.dart';

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
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: ()
                  {

                  },
                  child: Text("ADD Security")),
              ElevatedButton(
                  onPressed: ()
                  {

                  },
                  child: Text("View all securities")),
              ElevatedButton(
                  onPressed: ()
                  {

                  },
                  child: Text("View all visitors"))
            ],
          ),
        ),
      ),
    );
  }
}
