//creating a class for network access
import 'dart:convert';

import 'package:http/http.dart';
import 'comments.dart';

class Network
{
  final String url;
  //Default constructor of network class
  Network(this.url);

  Future<CommentList> fetchData() async
  {
    Response response = await get(Uri.encodeFull(url));
    if(response.statusCode == 200)
      {
        return CommentList.fromJson(json.decode(response.body));
      }
    else{
      throw Exception(response.statusCode);
    }

  }
}