import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deliverymanager/class/global.dart' as global;

class WithdrawController extends GetxController{
  //var


  //method
  getWithdraw(from, to, status) async{
    final res=await http.get(
      Uri.parse(global.link+'/api/manager/withdraw/list?from='+from.toString()+'&to='+to.toString()+'&status='+status),
      headers: {
        'Authorization':'Bearer '+global.token
      },

    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postApprove(id) async{
    final res=await http.post(
      Uri.parse(global.link+'/api/manager/withdraw/approve/'+id.toString()),
      headers: {
        'Authorization':'Bearer '+global.token
      },

    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
}