import 'package:http/http.dart' as http;
import 'package:security_app/models/viewvisitors.dart';

class ViewVisitorServiceApi
{
Future<List<VisitorList>>getVisitors()async
{
  var client=http.Client();
  var apiurl=Uri.parse("http://192.168.83.62:3005/api/visitor/viewvisitor");
  var response=await client.get(apiurl);
  if(response.statusCode==200)

    {
      return visitorListFromJson(response.body);
    }
  else
    {
      return [];
    }
}
}