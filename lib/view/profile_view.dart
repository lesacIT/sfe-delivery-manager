import 'dart:io';

import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AuthController authController = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  XFile? avatar;

  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickAvatar(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    final XFile? pickedFile = await imagePicker.pickImage(
      source: source,
    );
    avatar = pickedFile;
    setState(() {});
  }

  getAvatar() {
    File image = File(avatar!.path.toString());
    return image;
  }

  @override
  void initState() {
    super.initState();
    nameController.text = global.user['name'];
    usernameController.text = global.user['username'];
    emailController.text = global.user['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Thông tin tài khoản',
          style: TextStyle(
              color: global.gold, fontSize: 16, fontWeight: FontWeight.bold),
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
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(global.borderImgPath), fit: BoxFit.fill)),
          ),
          Expanded(
              child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'THÔNG TIN CƠ BẢN',
                      style: TextStyle(
                          fontSize: 16,
                          color: global.gold,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: Text(
                      'Ảnh đại diện',
                      style: TextStyle(
                          color: global.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          pickAvatar(ImageSource.gallery);
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: global.grey,
                            ),
                            borderRadius: BorderRadius.circular(100),
                            color: global.black1,
                          ),
                          clipBehavior: Clip.antiAlias,
                          // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: avatar != null
                              ? Image.file(
                                  getAvatar(),
                                  fit: BoxFit.fill,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.add,
                                        size: 20, color: global.grey),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text(
                                        'Upload',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: global.grey,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
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
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: global.black1,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: global.black1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)),
                      cursorColor: Colors.grey,
                      style: TextStyle(color: global.grey),
                      obscureText: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: Text(
                      'Tên đăng nhập',
                      style: TextStyle(
                          color: global.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: global.black1,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: global.black1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)),
                      cursorColor: Colors.grey,
                      style: TextStyle(color: global.grey),
                      obscureText: false,
                      readOnly: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          color: global.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: global.black1,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: global.black1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)),
                      cursorColor: Colors.grey,
                      style: TextStyle(color: global.grey),
                      obscureText: false,
                      readOnly: true,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
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
                      ),
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
                    image: AssetImage(global.borderImgPath), fit: BoxFit.fill)),
          ),
        ]),
      ),
    );
  }
}
