import 'dart:io';

import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/setting_controller.dart';
import 'package:deliverymanager/controller/shared_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NotifyDriverView extends StatefulWidget {
  const NotifyDriverView({super.key});

  @override
  State<NotifyDriverView> createState() => _NotifyDriverViewState();
}

class _NotifyDriverViewState extends State<NotifyDriverView> {
  SharedController sharedController = Get.find();
  SettingController settingController = Get.find();

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

  uploadImage() async {
    dynamic data =
        await sharedController.postUploadImage(avatar!.path.toString());
    if (data['error'] == false) {
      String imageUrl = data['data'];
      dynamic data2 = await settingController.postBanner(imageUrl);
      if (data2['error'] == true) {
        global.showError(data2['message']);
      } else {
        global.showSuccess(data2['message']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Cấu hình thông báo tài xế',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                  child: Text(
                    'Tài xế',
                    style: TextStyle(
                        color: global.gold,
                        fontSize: 20,
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
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: global.grey,
                          ),
                          borderRadius: BorderRadius.circular(5),
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
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      uploadImage();
                    },
                    child: Container(
                      height: 50,
                      width: 350,
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      decoration: BoxDecoration(
                          color: global.gold,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Lưu',
                          style: TextStyle(
                              fontSize: 18,
                              color: global.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
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
