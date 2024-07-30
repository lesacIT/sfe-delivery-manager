import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/driver_controller.dart';
import 'package:deliverymanager/controller/supervisor_controller.dart';
import 'package:deliverymanager/view/detail_driver_view.dart';
import 'package:deliverymanager/view/edit_supervisor_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DriverView extends StatefulWidget {
  dynamic manager;
  DriverView({super.key, required this.manager});

  @override
  State<DriverView> createState() => _DriverViewState(manager);
}

class _DriverViewState extends State<DriverView> {
  dynamic manager;
  _DriverViewState(this.manager);
  //
  DriverController driverController = Get.find();
  SupervisorController supervisorController = Get.find();
  TextEditingController searchController = TextEditingController();
  List listDriver = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  postDeletesupersior() async {
    global.showLoading();
    dynamic data =
        await supervisorController.postDeleteSupervisor(manager['id']);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      global.showSuccess(data['message']);
      Get.back();
      Get.back();
    }
  }

  postResetpassword() async {
    global.showLoading();
    dynamic data =
        await supervisorController.postResetpasswordSupervisor(manager['id']);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      global.showSuccess(data['message']);
      Get.back();
      Get.back();
    }
  }

  showDelete() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Xoá giám sát'),
            content: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bạn có chắc chắn Xoá giám sát này không?',
                      style: TextStyle(
                          color: global.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                height: 50,
                                margin: EdgeInsets.fromLTRB(0, 20, 15, 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Huỷ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: global.gold,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )),
                          )),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              postDeletesupersior();
                            },
                            child: Container(
                                height: 50,
                                margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                decoration: BoxDecoration(
                                    color: global.gold,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Đồng ý',
                                    style: TextStyle(
                                        color: global.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )),
                          )),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  showResetpassword() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Reset mật khẩu'),
            content: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bạn có chắc chắn muốn Reset mật khẩu không?',
                      style: TextStyle(
                          color: global.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                height: 50,
                                margin: EdgeInsets.fromLTRB(0, 20, 15, 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Huỷ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: global.gold,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )),
                          )),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              postResetpassword();
                            },
                            child: Container(
                                height: 50,
                                margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                decoration: BoxDecoration(
                                    color: global.gold,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Đồng ý',
                                    style: TextStyle(
                                        color: global.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )),
                          )),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  getData() async {
    dynamic data = await driverController.getListDriver(
        searchController.text, manager['id']);
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      listDriver = data['data'];
    }
    setState(() {});
  }

  String getTrangThai(status) {
    String result = '';
    if (status == 0) {
      result = 'Ngừng hoạt động';
    } else if (status == 1) {
      result = 'Đang hoạt động';
    } else if (status == 2) {
      result = 'Chờ kích hoạt';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Tài xế',
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    decoration: BoxDecoration(
                        color: global.black1,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                clipBehavior: Clip.antiAlias,
                                child: manager['avatar'] != null
                                    ? Image.network(
                                        (manager['avatar']),
                                        fit: BoxFit.fill,
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 1),
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.user,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        )),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        manager['name'],
                                        style: TextStyle(
                                            color: global.gold,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        manager['phone'],
                                        style: TextStyle(
                                            color: global.gold,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        if (manager['id'] != 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => EditSupervisorView(
                                          supersior: manager));
                                    },
                                    child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: global.gold,
                                              width: 1,
                                            ),
                                            color: global.gold,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FaIcon(FontAwesomeIcons.pencil,
                                                color: global.black, size: 20),
                                            Text(
                                              'Sửa',
                                              style: TextStyle(
                                                  color: global.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      showDelete();
                                    },
                                    child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: global.gold,
                                              width: 1,
                                            ),
                                            color: global.gold,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.trash,
                                              color: global.black,
                                              size: 20,
                                            ),
                                            Text(
                                              'Xoá',
                                              style: TextStyle(
                                                  color: global.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    onTap: () async {
                                      await showResetpassword();
                                    },
                                    child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: global.gold,
                                              width: 1,
                                            ),
                                            color: global.gold,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.paste,
                                              color: global.black,
                                              size: 20,
                                            ),
                                            Text(
                                              'Reset mật khẩu',
                                              style: TextStyle(
                                                  color: global.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                  )),
                            ],
                          ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: global.gold.withOpacity(0.5),
                          ),
                        ),
                        filled: true,
                        hintText: 'Tìm kiếm',
                        hintStyle: TextStyle(color: global.grey),
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
                    readOnly: false,
                    onSubmitted: (value) {
                      getData();
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      children: List.generate(listDriver.length, (index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() =>
                                DetailDriverView(driver: listDriver[index]));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: global.black1,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                      listDriver[index]['anh_chan_dung'],
                                      fit: BoxFit.fill),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listDriver[index]['name'],
                                              style: TextStyle(
                                                  color: global.gold,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              listDriver[index]['phone'],
                                              style: TextStyle(
                                                  color: global.gold,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              getTrangThai(
                                                  listDriver[index]['status']),
                                              style: TextStyle(
                                                  color: global.gold,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              DateFormat('dd/MM/yyyy HH:mm')
                                                  .format(DateTime.parse(
                                                      listDriver[index]
                                                          ['created_at'])),
                                              style: TextStyle(
                                                  color: global.gold,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                )
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
