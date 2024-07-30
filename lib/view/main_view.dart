import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/view/account_view.dart';
import 'package:deliverymanager/view/home_view.dart';
import 'package:deliverymanager/view/manager_view.dart';
import 'package:deliverymanager/view/notification_view.dart';
import 'package:deliverymanager/view/withdraw_request_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  //var
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentView = const HomeView();
  int currentTab = 0;

  //method
  Widget itemBottomBar(VoidCallback onTap, icon, text, active) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: active ? global.gold : global.grey,
          ),
          Text(
            text,
            style: TextStyle(
                color: active ? global.gold : global.grey,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageStorage(
              bucket: bucket,
              child: currentView,
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(color: global.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: itemBottomBar(() {
                    currentView = HomeView();
                    currentTab = 0;
                    setState(() {});
                  }, FontAwesomeIcons.home, 'Tổng quan', currentTab == 0),
                ),
                Expanded(
                  flex: 1,
                  child: itemBottomBar(() {
                    currentView = ManagerView();
                    currentTab = 1;
                    setState(() {});
                  }, FontAwesomeIcons.user, 'Quản lý', currentTab == 1),
                ),
                Expanded(
                  flex: 1,
                  child: itemBottomBar(() {
                    currentView = WithdrawRequestView();
                    currentTab = 2;
                    setState(() {});
                  }, FontAwesomeIcons.moneyBillTransfer, 'Lệnh rút tiền',
                      currentTab == 2),
                ),
                Expanded(
                  flex: 1,
                  child: itemBottomBar(() {
                    currentView = NotificationView();
                    currentTab = 3;
                    setState(() {});
                  }, FontAwesomeIcons.bell, 'Thông báo', currentTab == 3),
                ),
                Expanded(
                  flex: 1,
                  child: itemBottomBar(() {
                    currentView = AccountView();
                    currentTab = 4;
                    setState(() {});
                  }, FontAwesomeIcons.circleUser, 'Tài khoản', currentTab == 4),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
