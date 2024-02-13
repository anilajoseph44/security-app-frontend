import 'package:flutter/material.dart';
import 'package:security_app/models/viewvisitors.dart';
import 'package:security_app/services/viewvisitor.dart';

class ViewVisitors extends StatefulWidget {
  const ViewVisitors({super.key});

  @override
  State<ViewVisitors> createState() => _ViewVisitorsState();
}

class _ViewVisitorsState extends State<ViewVisitors> {
  Future<List<VisitorList>>?data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=ViewVisitorServiceApi().getVisitors();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(backgroundColor: Colors.blueAccent,
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
      body: FutureBuilder(
          future: data,
          builder: (context,snapshot)
      {
        if(snapshot.connectionState == ConnectionState.waiting)
          {
            return CircularProgressIndicator();
          }
        else if(snapshot.hasError)
          {
            return Text('Error: ${snapshot.error}');
          }
        else {
          if (snapshot.hasData) {
            return ListView.builder(padding: EdgeInsets.all(20),
                itemCount: snapshot.data!.length,
                itemBuilder: (value, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Name : "+snapshot.data![index].name.toString()),
                          subtitle: Text("Purpose : "+snapshot.data![index].purpose.toString()+
                          "\n"+"Date : "+snapshot.data![index].visitingtime.toString()+
                          "\n"+"Address : "+snapshot.data![index].address.toString()+
                          "\n"+"Phone number : "+snapshot.data![index].phno.toString()+
                          "\n"+"Added by : "+snapshot.data![index].userid.name.toString()),
                        )
                      ],
                    ),
                  );
                });
          }
          else {
            return Text("Loading...................");
          }
        }

      }),
      ),
    );
  }
}
