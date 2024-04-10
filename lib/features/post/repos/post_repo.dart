
import 'dart:convert';

import 'package:api_request_bloc/features/post/bloc/post_bloc.dart';
import 'package:api_request_bloc/features/post/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepo
{
  static Future<List<PostModel>> fetchPostData() async{
    List<PostModel> post = [];
    try
    {
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      List result = jsonDecode(response.body);

      for(int i=0; i< result.length; i++)
      {
        PostModel postModel = PostModel.fromJson(result[i]);
        post.add(postModel);
      }
      return post;
    }
    catch(e)
    {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> addPostData(PostAddEvent event) async{
    try
    {
      var response = await http.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: {
            'userId' : event.userId,
            'title': event.title,
            'body': event.body
          },
          // headers: {
          //   'Content-type': 'application/json; charset=UTF-8',
          // }
      );
      if(response.statusCode>=200 && response.statusCode<300)
        {
          return true;
        }
      else
        {
          return false;
        }
    }
    catch(e)
    {
      print(e.toString());
      return false;
    }
  }
}