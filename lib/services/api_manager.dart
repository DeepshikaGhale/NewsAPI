import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_flutter/Model/newsinfo.dart';
import 'package:news_api_flutter/constants/strings.dart';

class APIManager{
  Future<NewsModelClass> getNews()async{
    var client = http.Client();

    var newsModel;

    try{
      var response = await client.get(Uri.parse(Strings.news_url));
    
    if(response.statusCode == 200){
      var jsonString = response.body;

      var jsonMap = json.decode(jsonString);

      newsModel = NewsModelClass.fromJson(jsonMap);
    }
    }catch(Exception){
        return newsModel;
    }
    
    
    return newsModel;
  }
}