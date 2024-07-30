import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deliverymanager/class/global.dart' as global;
class SupervisorController extends GetxController{

  getSupervisor(search) async{
    final res=await http.get(
      Uri.parse(global.link+'/api/manager/supervisor/list?search='+search),
      headers: {
        'Authorization':'Bearer '+global.token
      },

    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postCreateSupervisor(name,username,phone,email, password,code) async{
    final res=await http.post(
      Uri.parse(global.link+'/api/manager/supervisor/create'),
      headers: {
        'Authorization':'Bearer '+global.token
      },
        body: {
          "name": name,
          "username": username,
          "phone": phone,
          "email": email,
          "password": password,
          "code": code,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postUpdateSupervisor(name,phone,email,id) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/supervisor/update/'+id.toString()),
        headers: {
          'Authorization':'Bearer '+global.token
        },
        body: {
          "name": name,
          "phone": phone,
          "email": email,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postDeleteSupervisor(id) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/supervisor/delete/'+id.toString()),
        headers: {
          'Authorization':'Bearer '+global.token
        },
        body: {

        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postResetpasswordSupervisor(id) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/supervisor/reset-password/'+id.toString()),
        headers: {
          'Authorization':'Bearer '+global.token
        },
        body: {

        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }

}