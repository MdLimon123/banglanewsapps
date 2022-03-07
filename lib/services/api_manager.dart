import 'dart:convert';

import 'package:banglanews/constan/strings.dart';
import 'package:banglanews/models/newsinfo.dart';
import 'package:http/http.dart' as http;

class API_Manager{

 Future <NewsModel> getNews() async{

   var newsModel = null;
    var client = http.Client();

    try{
      var response = await client.get(Uri.parse(Strings.news_url));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }

    }catch (Exception){

      return newsModel;
    }


   return newsModel;

  }
}