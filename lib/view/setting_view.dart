import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/view/banner_setting_view.dart';
import 'package:deliverymanager/view/detail_setting_money_view.dart';
import 'package:deliverymanager/view/notify_driver_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Cài đặt',
          style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: global.gold,
          ),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(global.backgroundImage1),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(global.borderImgPath),
                        fit: BoxFit.fill)),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => BannerSettingView());
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //FaIcon(FontAwesomeIcons.solidIdCard, color: global.gold,),
                                  Text(
                                    'Cấu hình Banner',
                                    style: TextStyle(
                                        color: global.gold,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: global.gold,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => NotifyDriverView());
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //FaIcon(FontAwesomeIcons.key, color: global.gold,),
                                  Text(
                                    'Cấu hình thông báo tài xế',
                                    style: TextStyle(
                                        color: global.gold,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: global.gold,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => DetailSettingMoneyView());
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //FaIcon(FontAwesomeIcons.gear, color: global.gold,),
                                  Text(
                                    'Cấu hình chi phí di chuyển',
                                    style: TextStyle(
                                        color: global.gold,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: global.gold,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(global.borderImgPath),
                        fit: BoxFit.fill)),
              ),
            ],
          )),
    );
  }
}
