import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:security_app/models/securitymodel.dart';
import 'package:security_app/pages/viewsecurity.dart';

class SecurityApiService
{

  Future<dynamic>SendSecurityLogin(String email,String password)async
  {
    var client=http.Client();
    var apiurl=Uri.parse("http://192.168.83.62:3005/api/security/signin");
    var response=await client.post(apiurl,
    headers: <String,String>{
      "Content-Type":"application/json; charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
      "email":email,
      "password":password
    })
    );
    if(response.statusCode==200)
      {
        return json.decode(response.body);
      }
    else
      {
        throw Exception("Failed to Login");
      }
  }




  Future<dynamic>SendSecurityData(String name,String empid,String address,String phno,String email,String password)async
  {
    var client=http.Client();
    var apiurl=Uri.parse("http://192.168.83.62:3005/api/security/securityadd");
    var response=await client.post(apiurl,
    headers: <String,String>{
      "Content-Type":"application/json; charset=UTF-8"
    },
      body: jsonEncode(<String,String>{
       "name":name,
       "empid":empid,
       "address":address,
       "phno":phno,
       "email":email,
       "password":password

      })

    );

    if(response.statusCode==200)
      {
        return json.decode(response.body);
      }
    else
      {
        throw Exception("Failed to send data");
      }
  }

  Future<List<Security>>getSecurity()async
  {
    var client=http.Client();
    var apiurl=Uri.parse("http://192.168.83.62:3005/api/security/viewsecurities");
    var response=await client.get(apiurl);
    if(response.statusCode==200)
      {
        return securityFromJson(response.body);

      }
    else
      {
        return [];
      }
  }

}