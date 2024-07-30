import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deliverymanager/class/global.dart' as global;

class AuthController extends GetxController{
  //var


  //method
  postLogin(username, password) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/auth/login'),
        headers: {

        },
        body: {
          "username":username,
          "password":password
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }

  postChangePassword(old_password, new_password) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/auth/change-password'),
        headers: {
          'Authorization': 'Bearer '+global.token
        },
        body: {
          "old_password": old_password,
          "new_password": new_password,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }

}