import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../pages/list_page.dart';

class ApiService {
  Future<dynamic> loginload(
      BuildContext context,
      email,
      password
      ) async {
    try {
      var url = Uri.parse(
          'http://3.223.85.137/disaster_reconstruction/api/auth/login');
      print(url);
      var request = http.MultipartRequest("POST", url)
        ..fields['email'] = email
        ..fields['password'] = password;

      var response = await request.send();
      print('object===============================');
      if(response.statusCode == 200){
        print(response.statusCode);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ListViewData()));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Enter valid username or password'),
          backgroundColor: Colors.red,
        ));
        print('res failllllllll=======================');
      }
      print(response.statusCode.toString());
      return http.Response.fromStream(response);
    } catch (e) {
      print("errroor draft found ${e.toString()}");
    }
  }



  Future<dynamic> listload(
      ) async {
    try {
      var url = Uri.parse(
          'https://jsonplaceholder.typicode.com/todos');
      var request = http.MultipartRequest("GET", url);
      var response = await request.send();
      print(response.statusCode.toString());
      return http.Response.fromStream(response);
    } catch (e) {
      print("errroor draft found ${e.toString()}");
    }
  }
}