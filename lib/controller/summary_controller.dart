import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deliverymanager/class/global.dart' as global;

class SummaryController extends GetxController{
  //var


  //method
  getSummary(from, to) async{
    final res=await http.get(
      Uri.parse(global.link+'/api/manager/summary/data?from='+from.toString()+'&to='+to.toString()),
      headers: {
        'Authorization':'Bearer '+global.token
      },

    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  getDriverOnline() async{
    final res=await http.get(
      Uri.parse(global.link+'/api/manager/summary/driver-online'),
      headers: {
        'Authorization':'Bearer '+global.token
      },

    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
}