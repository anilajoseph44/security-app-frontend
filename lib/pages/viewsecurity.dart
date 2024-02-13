import 'package:flutter/material.dart';
import 'package:security_app/models/securitymodel.dart';
import 'package:security_app/services/securityservices.dart';

class ViewSecurity extends StatefulWidget {
  const ViewSecurity({super.key});

  @override
  State<ViewSecurity> createState() => _ViewSecurityState();
}

class _ViewSecurityState extends State<ViewSecurity> {

Future<List<Security>>?data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=SecurityApiService().getSecurity();
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
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot)
        {
          if(snapshot.hasData)
            {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (value,index)
              {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("Name : "+snapshot.data![index].name.toString()),
                        subtitle: Text("Employee ID : "+snapshot.data![index].empid.toString()+
                        "\n"+"Address : "+snapshot.data![index].address.toString()+
                        "\n"+"Phone Number : "+snapshot.data![index].phno.toString()+
                        "\n"+"Email : "+snapshot.data![index].email),
                        leading: CircleAvatar(
                          child: Text(snapshot.data![index].name[0].toString()),
                        )
                      )
                    ],
                  ),
                );
              });

            }
          else
            {
              return Text("Loading..................");

            }
        }),
      ),
    );
  }
}
