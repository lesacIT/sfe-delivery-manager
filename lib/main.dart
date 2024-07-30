import 'package:bot_toast/bot_toast.dart';
import 'package:deliverymanager/controller/auth_controller.dart';
import 'package:deliverymanager/controller/driver_controller.dart';
import 'package:deliverymanager/controller/notification_controller.dart';
import 'package:deliverymanager/controller/setting_controller.dart';
import 'package:deliverymanager/controller/shared_controller.dart';
import 'package:deliverymanager/controller/summary_controller.dart';
import 'package:deliverymanager/controller/supervisor_controller.dart';
import 'package:deliverymanager/controller/withdraw_controller.dart';
import 'package:deliverymanager/view/login_view.dart';
import 'package:deliverymanager/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SFE Delivery Customer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const AppView(),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  //var
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentView=const LoginView();
  final authController=Get.put(AuthController());
  final driverController=Get.put(DriverController());
  final summaryController=Get.put(SummaryController());
  final withdrawController=Get.put(WithdrawController());
  final notificationController=Get.put(NotificationController());
  final supervisorController=Get.put(SupervisorController());
  final sharedController=Get.put(SharedController());
  final settingController=Get.put(SettingController());



  //method
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentView,
      ),
    );
  }
}

