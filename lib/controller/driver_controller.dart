import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deliverymanager/class/global.dart' as global;

class DriverController extends GetxController{
  //var


  //method
  getListDriver(search,id) async{
    final res=await http.get(
       // Uri.parse(global.link+'/api/manager/driver/list?search=${search}&manager_id=${id}'),
      Uri.parse(global.link+'/api/manager/driver/list?search='+search+'&manager_id='+id.toString()),

        headers: {
          'Authorization':'Bearer '+global.token
        },

    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  getDetail(id) async{
    final res=await http.get(
      Uri.parse(global.link+'/api/manager/driver/detail/'+id.toString()),
      headers: {
        'Authorization':'Bearer '+global.token
      },
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postTopup(id,amount,note) async{
    final res=await http.post(
      Uri.parse(global.link+'/api/manager/driver/topup/'+id.toString()),
      headers: {
        'Authorization':'Bearer '+global.token
      },
      body: {
        "amount": amount,
        "note": note,
      }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postWithdraw(id,amount,note) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/driver/withdraw/'+id.toString()),
        headers: {
          'Authorization':'Bearer '+global.token
        },
        body: {
          "amount": amount,
          "note": note,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postUpdatestatus(id,status) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/driver/update-status/'+id.toString()),
        headers: {
          'Authorization':'Bearer '+global.token
        },
        body: {
           "status": status.toString(),
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postUpdatemagager(id,code) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/driver/update-manager/'+id.toString()),
        headers: {
          'Authorization':'Bearer '+global.token
        },
        body: {
          "code": code,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }

}