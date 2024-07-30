import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deliverymanager/class/global.dart' as global;
class SettingController extends GetxController{

  postBanner(avatar) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/setting/save-banner-driver'),
        headers: {
          'Authorization': 'Bearer '+global.token
        },
        body: {
          'data': avatar,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postBannerdriver(avatar) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/setting/save-banner-notify'),
        headers: {
          'Authorization': 'Bearer '+global.token
        },
        body: {
          'data': avatar,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }

  postSettingprice(price_per_5km_4,price_next_km_4,price_per_5km_2,price_next_km_2) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/manager/setting/save-setting-price'),
        headers: {
          'Authorization': 'Bearer '+global.token
        },
        body: {
          "price_per_5km_4":price_per_5km_4,
          "price_next_km_4":price_next_km_4,
          "price_per_5km_2":price_per_5km_2,
          "price_next_km_2":price_next_km_2
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }

}