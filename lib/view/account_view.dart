import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/view/change_password_view.dart';
import 'package:deliverymanager/view/profile_view.dart';
import 'package:deliverymanager/view/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(global.backgroundImage1), fit: BoxFit.fill)),
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).viewPadding.top, 0, 0),
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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.user,
                        size: 100,
                        color: Colors.white,
                      ),
                      Container(
                        child: Text(
                          global.user['name'],
                          style: TextStyle(
                              color: global.gold,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //     color: global.black1,
                      //     width: 1
                      // ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => ProfileView());
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
                                  FaIcon(
                                    FontAwesomeIcons.solidIdCard,
                                    color: global.gold,
                                  ),
                                  Text(
                                    '  Thông tin tài khoản',
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
                          Get.to(() => ChangPassWordView());
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
                                  FaIcon(
                                    FontAwesomeIcons.key,
                                    color: global.gold,
                                  ),
                                  Text(
                                    '  Đổi mật khẩu',
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
                          Get.to(() => SettingView());
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
                                  FaIcon(
                                    FontAwesomeIcons.gear,
                                    color: global.gold,
                                  ),
                                  Text(
                                    '  Cài đặt',
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
                          Get.back();
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
                                  FaIcon(
                                    FontAwesomeIcons.rightFromBracket,
                                    color: global.gold,
                                  ),
                                  Text(
                                    '  Đăng xuất',
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
              ],
            )),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(global.borderImgPath),
                      fit: BoxFit.fill)),
            ),
          ],
        ),
      ),
    );
  }
}
