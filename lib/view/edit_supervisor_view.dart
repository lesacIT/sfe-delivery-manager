import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditSupervisorView extends StatefulWidget {
  dynamic supersior;
  EditSupervisorView({super.key, required this.supersior});

  @override
  State<EditSupervisorView> createState() =>
      _EditSupervisorViewState(supersior);
}

class _EditSupervisorViewState extends State<EditSupervisorView> {
  dynamic supersior;
  _EditSupervisorViewState(this.supersior);

  SupervisorController supervisorController = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = supersior['name'];
    phoneController.text = supersior['phone'];
    emailController.text = supersior['email'];
  }

  postEditSupervisor() async {
    if (nameController.text.isEmpty) {
      global.showError('Vui lòng nhập họ và tên');
    } else if (phoneController.text.isEmpty) {
      global.showError('Vui lòng nhập số điện thoại');
    } else if (phoneController.text[0] != '0' ||
        phoneController.text.length != 10) {
      global.showError('Số điện thoại không đúng định dạng');
    } else if (emailController.text.isEmpty) {
      global.showError('Vui lòng nhập email');
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      global.showError('Email của bạn không đúng định dạng');
    } else {
      dynamic data = await supervisorController.postUpdateSupervisor(
          nameController.text,
          phoneController.text,
          emailController.text,
          supersior['id']);
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
          'Cập nhật giám sát',
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
                image: AssetImage(global.backgroundImage1), fit: BoxFit.fill)),
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
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //color: global.black,
                      borderRadius: BorderRadius.circular(0)),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  //margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Họ & tên',
                              style: TextStyle(
                                  color: global.gold,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: global.black1,
                            hintText: 'Nguyễn Văn A',
                            hintStyle: TextStyle(color: global.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: global.black1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: global.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 2, 2, 2)),
                        cursorColor: global.grey,
                        style: TextStyle(color: global.grey),
                        obscureText: false,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Số điện thoại',
                              style: TextStyle(
                                  color: global.gold,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: global.black1,
                            hintText: 'VD: 0776301209',
                            hintStyle: TextStyle(color: global.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: global.black1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: global.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 2, 2, 2)),
                        cursorColor: global.grey,
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
                              'Email',
                              style: TextStyle(
                                  color: global.gold,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: global.black1,
                            hintText: 'abc@gmail.com',
                            hintStyle: TextStyle(color: global.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: global.black1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: global.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 2, 2, 2)),
                        cursorColor: global.grey,
                        style: TextStyle(color: global.grey),
                        obscureText: false,
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: InkWell(
                            onTap: () {
                              postEditSupervisor();
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: global.gold,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: Text('Lưu',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: global.black,
                                      fontSize: 16)),
                            ),
                          ))
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
