import 'package:http/http.dart' as http;
import 'package:flutterapiunsplash/models/UnsplashPhoto.dart';
import 'package:flutter/foundation.dart';

final yourAPIKey = "";
final api = "https://api.unsplash.com/search/photos?query=angkor+wat&client_id=$yourAPIKey";

Future<UnsplashPhoto> getData() async{
  http.Response response = await http.Client().get(api);

  if(response.statusCode == 200){
    return compute(unsplashPhotoFromJson, response.body);
  }
  else{
    throw Exception("Error while reading API, status code: ${response.statusCode}");
  }
}