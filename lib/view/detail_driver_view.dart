import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailDriverView extends StatefulWidget {
  dynamic driver;

  DetailDriverView({super.key, required this.driver});

  @override
  State<DetailDriverView> createState() => _DetailDriverViewState(driver);
}

class _DetailDriverViewState extends State<DetailDriverView> {
  dynamic driver;

  _DetailDriverViewState(this.driver);

  DriverController driverController = Get.find();
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController showController = TextEditingController();
  var numberFormat = NumberFormat('#,###', 'en_US');
  dynamic detail;
  List listDriver = [];

  @override
  void initState() {
    super.initState();
    getDetail(driver['id']);
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

  getDetail(id) async {
    global.showLoading();
    dynamic data = await driverController.getDetail(id);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      detail = data['data'];
      listDriver = detail['history_orders'];
      setState(() {});
    }
  }

  postTopup() async {
    global.showLoading();
    dynamic data = await driverController.postTopup(
        driver['id'], amountController.text, noteController.text);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      global.showSuccess(data['message']);
      Get.back();
      getDetail(driver['id']);
    }
  }

  postWithdraw() async {
    global.showLoading();
    dynamic data = await driverController.postWithdraw(
        driver['id'], amountController.text, noteController.text);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      global.showSuccess(data['message']);
      Get.back();
      getDetail(driver['id']);
    }
  }

  postUpdatestatus(status) async {
    global.showLoading();
    dynamic data =
        await driverController.postUpdatestatus(driver['id'], status);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      global.showSuccess(data['message']);
      Get.back();
      getDetail(driver['id']);
    }
  }

  postUpdatemagager(code) async {
    global.showLoading();
    dynamic data = await driverController.postUpdatemagager(driver['id'], code);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      global.showSuccess(data['message']);
      Get.back();
      getDetail(driver['id']);
    }
  }

  showTopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Nạp xu'),
            content: Container(
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Số xu cần nạp',
                      style: TextStyle(
                          color: global.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: global.grey,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: global.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)),
                    cursorColor: Colors.grey,
                    style: TextStyle(color: global.gold),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  Text('Ghi chú',
                      style: TextStyle(
                          color: global.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  TextField(
                    controller: noteController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: global.grey,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: global.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)),
                    cursorColor: Colors.grey,
                    style: TextStyle(color: global.gold),
                    obscureText: false,
                  ),
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
                              postTopup();
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

  showWithdraw() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Rút xu'),
            content: Container(
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Số xu cần rút',
                      style: TextStyle(
                          color: global.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: global.grey,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: global.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)),
                    cursorColor: Colors.grey,
                    style: TextStyle(color: global.gold),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  Text('Ghi chú',
                      style: TextStyle(
                          color: global.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  TextField(
                    controller: noteController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: global.grey,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: global.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)),
                    cursorColor: Colors.grey,
                    style: TextStyle(color: global.gold),
                    obscureText: false,
                  ),
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
                                // margin: EdgeInsets.fromLTRB(0, 20, 15, 0),
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
                              postWithdraw();
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

  showConfirm(title, content, status) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(content,
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
                              postUpdatestatus(status);
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

  showCode() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cập nhật mã giám sát'),
            content: Container(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mã giám sát',
                      style: TextStyle(
                          color: global.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  TextField(
                    controller: showController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: global.grey,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: global.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)),
                    cursorColor: Colors.grey,
                    style: TextStyle(color: global.gold),
                    obscureText: false,
                  ),
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
                              postUpdatemagager(showController.text);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Chi tiết tài xế',
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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //color: global.black1,
                      borderRadius: BorderRadius.circular(0)),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  //margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border(),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: detail != null
                              ? Image.network(
                                  // 'https://sfedelivery.superweb.xyz/images/66246fd811b8a.jpg'
                                  global.img + detail['anh_chan_dung'],
                                  fit: BoxFit.fill,
                                )
                              : Container(),

                          // detail != null
                          //     ? Image.network(
                          //         (detail[ 'anh_chan_dung']),
                          //         fit: BoxFit.fill,
                          //       )
                          //     : Container(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Họ & tên: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null ? detail['name'] : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Số điện thoại: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null ? detail['phone'] : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Số xu hiện tại: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: global.gold,
                                        fontSize: 16)),
                                TextSpan(
                                    text: (detail != null
                                        ? numberFormat.format(detail['wallet'])
                                        : '0'),
                                    style: TextStyle(
                                        color: global.gold, fontSize: 16))
                              ]),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showTopup();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: global.gold,
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      'Nạp xu',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: global.black,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showWithdraw();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: global.gold,
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    //margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                                    child: Text(
                                      'Rút xu',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: global.black,
                                          fontSize: 16),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Tổng đơn: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null
                                    ? detail['total_order'].toString()
                                    : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Mã giám sát: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: global.gold,
                                          fontSize: 16)),
                                  TextSpan(
                                      text: detail != null
                                          ? detail['ma_giam_sat']
                                          : '',
                                      style: TextStyle(
                                          color: global.gold, fontSize: 16))
                                ]),
                              ),
                              InkWell(
                                onTap: () {
                                  showController.text = detail['ma_giam_sat'];
                                  showCode();
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.pencil,
                                  color: global.grey,
                                ),
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Trạng thái: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: getTrangThai(
                                    detail != null ? detail['status'] : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(5),
                      //   child: RichText(
                      //     text: TextSpan(children: [
                      //       TextSpan(
                      //           text: 'Số điện thoại Zalo: ',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold,
                      //               color: global.gold,
                      //               fontSize: 16)),
                      //       TextSpan(
                      //           text:
                      //               detail != null ? detail['phone_zalo'] : '',
                      //           style:
                      //               TextStyle(color: global.gold, fontSize: 16))
                      //     ]),
                      //   ),
                      // ),
                      // SizedBox(height: 15),

                      if (detail != null && detail['status'] == 1)
                        InkWell(
                          onTap: () {
                            showConfirm(
                                'Ngừng hoạt động',
                                'Bạn có chắc muốn ngừng hoạt động tài khoản này không?',
                                0);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: global.gold,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Text('Ngừng hoạt động',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.black,
                                    fontSize: 16)),
                          ),
                        ),
                      if (detail != null && detail['status'] == 0)
                        InkWell(
                          onTap: () {
                            showConfirm(
                                'Cho phép hoạt động',
                                'Bạn có chắc muốn cho phép tài khoản này hoạt động không?',
                                1);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: global.gold,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Text('Cho phép hoạt động',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.black,
                                    fontSize: 16)),
                          ),
                        ),
                      if (detail != null && detail['status'] == 2)
                        InkWell(
                          onTap: () {
                            showConfirm(
                                'Kích hoạt',
                                'Bạn có chắc muốn kích hoạt tài khoản này không?',
                                1);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: global.gold,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Text('Kích hoạt',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.black,
                                    fontSize: 16)),
                          ),
                        )
                    ],
                  ),
                ),
                // đang bị cách nhau một khoảng trống
                Expanded(
                    child: ListView(
                        shrinkWrap: true, //bỏ khoảng trống
                        padding: EdgeInsets.zero, // bỏ padding khoảng trống
                        children: List.generate(listDriver.length, (index) {
                          return Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: global.gold, width: 1),
                                color: global.black1,
                                borderRadius: BorderRadius.circular(0)),
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listDriver[index]['distance']
                                                  .toString() +
                                              ' km',
                                          style: TextStyle(
                                              color: global.gold, fontSize: 16),
                                        ),
                                        Text(
                                            DateFormat('dd/MM/yyy HH:mm')
                                                .format(DateTime.parse(
                                                    listDriver[index]
                                                        ['created_at'])),
                                            style: TextStyle(
                                                color: global.gold,
                                                fontSize: 16))
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: 'Mã đơn: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: global.gold,
                                              fontSize: 16)),
                                      TextSpan(
                                          text: listDriver[index]['id']
                                              .toString(),
                                          style: TextStyle(
                                              color: global.gold, fontSize: 16))
                                    ]),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: 'Tổng tiền: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: global.gold,
                                              fontSize: 16)),
                                      TextSpan(
                                          text: numberFormat.format(
                                              listDriver[index]['total']),
                                          style: TextStyle(
                                              color: global.gold, fontSize: 16))
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }))),
                MyHorizontalList(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Email: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null ? detail['email'] : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Số Zalo: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null
                                    ? detail['phone_zalo']
                                    : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'CCCD: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null ? detail['cccd'] : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Biển Số Xe: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null
                                    ? detail['bien_so_xe']
                                    : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Hãng Xe: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null ? detail['hang_xe'] : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Tên Ngân Hàng: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null
                                    ? detail['ten_ngan_hang']
                                    : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Chủ Tài Khoản: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null
                                    ? detail['chu_tai_khoan']
                                    : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Số Tài Khoản: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: global.gold,
                                    fontSize: 16)),
                            TextSpan(
                                text: (detail != null
                                    ? detail['so_tai_khoan']
                                    : ''),
                                style:
                                    TextStyle(color: global.gold, fontSize: 16))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Ảnh bằng lái xe',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              detail != null && detail['mat_truoc_gplx'] != null
                                  ? Image.network(
                                      global.img + detail['mat_truoc_gplx'],
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      height: 220,
                                    )
                                  : Image.asset(
                                      'assets/giay.png',
                                      fit: BoxFit.cover,
                                      height: 220,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Mặt Trước CCCD',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              detail != null &&
                                      detail['anh_mat_truoc_cccd'] != null
                                  ? Image.network(
                                      global.img + detail['anh_mat_truoc_cccd'],
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      height: 220,
                                      alignment: Alignment.center,
                                    )
                                  : Image.asset(
                                      'assets/giay.png',
                                      fit: BoxFit.cover,
                                      height: 110,
                                      alignment: Alignment.center,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Mặt Sau CCCD',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              detail != null &&
                                      detail['anh_mat_sau_cccd'] != null
                                  ? Image.network(
                                      global.img + detail['anh_mat_sau_cccd'],
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      height: 220,
                                    )
                                  : Image.asset(
                                      'assets/giay.png',
                                      fit: BoxFit.cover,
                                      height: 220,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(5),
                      //   child: Card(
                      //     color: Colors.yellow,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     elevation: 5,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: <Widget>[
                      //         Padding(
                      //           padding: const EdgeInsets.all(10.0),
                      //           child: Text(
                      //             'Ảnh Chân Dung',
                      //             style: TextStyle(
                      //               fontWeight: FontWeight.bold,
                      //               color: Colors.black,
                      //               fontSize: 16,
                      //             ),
                      //           ),
                      //         ),
                      //         detail != null && detail['anh_chan_dung'] != null
                      //             ? Image.network(
                      //                 global.img + detail['anh_chan_dung'],
                      //                 fit: BoxFit.fill,
                      //                 width: MediaQuery.of(context).size.width,
                      //                 height: 220,
                      //               )
                      //             : Image.asset(
                      //                 'assets/giay.png',
                      //                 fit: BoxFit.cover,
                      //               ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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

class MyHorizontalList extends StatelessWidget {
  final List<String> productTitles = [
    "CCCD",
    "Hãng Xe",
    "Biển Số",
    // "Thông Tin",
    // "Thông Tin"
  ];
  final List<IconData> iconDataList = [
    Icons.badge,
    Icons.directions_car,
    Icons.confirmation_number,
    // Icons.assignment,
    // Icons.account_balance,
  ];
  final List<String> info = [
    "123456789",
    "Yamaha",
    "11111M",
    // "Giấy tờ",
    // "Ngân hàng"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(
        itemCount: iconDataList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            width: 186.9,
            margin: EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Icon(
                            iconDataList[index],
                            size: 50,
                            color: global.gold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productTitles[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: global.gold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        info[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: global.gold, // Đổi màu văn bản tại đây nếu cần
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
