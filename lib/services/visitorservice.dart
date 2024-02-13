import 'dart:convert';

import 'package:http/http.dart' as http;

class VisitorApiService
{
  Future<dynamic>SendVisitorData(String userId,String name,String purpose,String address,String phno)async
  {
    var client=http.Client();
    var apiurl=Uri.parse("http://192.168.83.62:3005/api/visitor/addvisitor");
    var response=await client.post(apiurl,
    headers: <String,String>{
      "Content-Type":"application/json; charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
      "userid":userId,
      "name":name,
      "purpose":purpose,
      "address":address,
      "phno":phno
    })
    );
    if(response.statusCode==200)
      {
        return json.decode(response.body);

      }
    else
      {
        throw Exception("Error while adding visitor.....");
      }
  }

}