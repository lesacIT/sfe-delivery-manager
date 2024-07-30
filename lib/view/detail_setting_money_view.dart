import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailSettingMoneyView extends StatefulWidget {
  const DetailSettingMoneyView({super.key});

  @override
  State<DetailSettingMoneyView> createState() => _DetailSettingMoneyViewState();
}

class _DetailSettingMoneyViewState extends State<DetailSettingMoneyView> {
  SettingController settingController = Get.find();
  TextEditingController price_per_5km_4Controller = TextEditingController();
  TextEditingController price_next_km_4Controller = TextEditingController();
  TextEditingController price_per_5km_2Controller = TextEditingController();
  TextEditingController price_next_km_2Controller = TextEditingController();

  postSettingprice() async {
    if (price_per_5km_4Controller.text.isEmpty) {
      global.showError('Vui lòng nhập giá xe 4 bánh 5km đầu');
    } else if (price_next_km_4Controller.text.isEmpty) {
      global.showError('Vui lòng nhập giá xe 4 bánh');
    } else if (price_per_5km_2Controller.text.isEmpty) {
      global.showError('Vui lòng nhập giá xe 2 bánh 5km đầu');
    } else if (price_next_km_2Controller.text.isEmpty) {
      global.showError('Vui lòng nhập giá xe 2 bánh');
    } else {
      dynamic data = await settingController.postSettingprice(
          price_per_5km_4Controller.text,
          price_next_km_4Controller.text,
          price_per_5km_2Controller.text,
          price_next_km_2Controller.text);
      if (data['error'] == true) {
        global.showError(data['message']);
      } else {
        global.showSuccess(data['message']);
        Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Cấu hình chi phí di chuyển',
          style: TextStyle(
              color: global.gold, fontSize: 25, fontWeight: FontWeight.bold),
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
                  child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Giá xe 4 bánh 5km đầu',
                                    style: TextStyle(
                                        color: global.gold,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                              controller: price_per_5km_4Controller,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: global.black1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: global.black1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 2, 2, 2)),
                              cursorColor: Colors.grey,
                              style: TextStyle(color: global.grey),
                              obscureText: false,
                              keyboardType: TextInputType.number,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Giá xe 4 bánh',
                                    style: TextStyle(
                                        color: global.gold,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                              controller: price_next_km_4Controller,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: global.black1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: global.black1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 2, 2, 2)),
                              cursorColor: Colors.grey,
                              style: TextStyle(color: global.grey),
                              obscureText: false,
                              keyboardType: TextInputType.number,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Giá xe 2 bánh 5km đầu',
                                    style: TextStyle(
                                        color: global.gold,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                              controller: price_per_5km_2Controller,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: global.black1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: global.black1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 2, 2, 2)),
                              cursorColor: Colors.grey,
                              style: TextStyle(color: global.grey),
                              obscureText: false,
                              keyboardType: TextInputType.number,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Giá xe 2 bánh',
                                    style: TextStyle(
                                        color: global.gold,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                              controller: price_next_km_2Controller,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: global.black1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: global.black1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 2, 2, 2)),
                              cursorColor: Colors.grey,
                              style: TextStyle(color: global.grey),
                              obscureText: false,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: InkWell(
                          onTap: () {
                            postSettingprice();
                          },
                          child: Container(
                              height: 45,
                              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              decoration: BoxDecoration(
                                  color: global.gold,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'Lưu',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: global.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      )
                    ],
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
          )),
    );
  }
}
