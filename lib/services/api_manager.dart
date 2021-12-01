import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_flutter/Model/newsinfo.dart';
import 'package:news_api_flutter/constants/strings.dart';

class APIManager{

  Future<NewsModelClass> getNews() async{
    var client = http.Client();

    var newsModel;
    
    try{
    //catching the data from the server
    var response = await client.get(Uri.parse(Strings.news_url));

    if(response.statusCode == 200){
       print('inside 200');
      var jsonString = response.body;
       print('jsonString $jsonString');
      var jsonMap = json.decode(jsonString); //decoding the above jsonString
       print('object is $jsonMap');
      newsModel = NewsModelClass.fromJson(jsonMap);
       print('${newsModel}');
    }
    }catch(Exception){
      print(Exception);
      return newsModel;
    }
    print(newsModel);
    return newsModel;
    
  }
}