import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/withdraw_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WithdrawRequestView extends StatefulWidget {
  const WithdrawRequestView({super.key});

  @override
  State<WithdrawRequestView> createState() => _WithdrawRequestViewState();
}

class _WithdrawRequestViewState extends State<WithdrawRequestView> {
  WithdrawController withdrawController = Get.find();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime fromDateTime = DateTime.now();
  DateTime toDateTime = DateTime.now();
  var numberFormat = NumberFormat('#,###', 'en_US');

  String requestSelected = 'pending';
  List listRequest = [
    {'slug': 'pending', 'title': 'Chờ xử lý'},
    {'slug': 'processed', 'title': 'Đã xử lý'},
  ];

  List listWithdraw = [];

  String getTrangThai(status) {
    String result = '';
    if (status == 'pending') {
      result = 'Chờ xử lý';
    } else if (status == 'processed') {
      result = 'Đã xử lý';
    }

    return result;
  }

  @override
  void initState() {
    super.initState();
    fromController.text = DateFormat('dd/MM/yyyy').format(fromDateTime);
    toController.text = DateFormat('dd/MM/yyyy').format(toDateTime);
    getData();
  }

  Future<DateTime> selectDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        locale: Get.locale);
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
    }
    return selectedDate;
  }

  Future selectFromDate(BuildContext context) async {
    final date = await selectDate(context);
    fromDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      0,
      0,
    );
    fromController.text = DateFormat('dd/MM/yyyy').format(fromDateTime);
    getData();
  }

  Future selectoDate(BuildContext context) async {
    final date = await selectDate(context);
    toDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      0,
      0,
    );
    toController.text = DateFormat('dd/MM/yyyy').format(toDateTime);
    getData();
  }

  getData() async {
    dynamic data = await withdrawController.getWithdraw(
        DateFormat('yyyy-MM-dd').format(fromDateTime),
        DateFormat('yyyy-MM-dd').format(toDateTime),
        requestSelected);

    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      listWithdraw = data['data'];
    }
    setState(() {});
  }

  postApprove(id) async {
    global.showLoading();
    dynamic data = await withdrawController.postApprove(id);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      global.showSuccess(data['message']);
      Get.back();
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Lệnh rút tiền',
          style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: InkWell(
                            onTap: () {},
                            child: TextField(
                              controller: fromController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: global.black1,
                                  hintText: 'Từ ngày',
                                  hintStyle: TextStyle(color: global.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: global.gold),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: global.gold),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 2, 2, 2),
                                  suffixIcon: Icon(
                                      Icons.calendar_today_outlined,
                                      size: 20,
                                      color: global.gold)),
                              cursorColor: global.grey,
                              style: TextStyle(color: global.grey),
                              obscureText: false,
                              readOnly: true,
                              onTap: () {
                                // selectFromDate(context);
                              },
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: InkWell(
                            onTap: () {},
                            child: TextField(
                              controller: toController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: global.black1,
                                  hintText: 'Đến ngày',
                                  hintStyle: TextStyle(color: global.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: global.gold),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: global.gold),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 2, 2, 2),
                                  suffixIcon: Icon(
                                    Icons.calendar_today_outlined,
                                    size: 20,
                                    color: global.gold,
                                  )),
                              cursorColor: global.grey,
                              style: TextStyle(color: global.grey),
                              obscureText: false,
                              readOnly: true,
                              onTap: () {
                                //selectoDate(context);
                              },
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1, color: global.gold)),
                          child: DropdownButton<String>(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            isExpanded: true,
                            underline: Container(),
                            value: requestSelected,
                            onChanged: (value) async {
                              requestSelected = value.toString();
                              getData();
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: global.gold,
                            ),
                            items: List.generate(listRequest.length, (index) {
                              return DropdownMenuItem(
                                value: listRequest[index]['slug'].toString(),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    listRequest[index]['title'],
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              );
                            }),
                            selectedItemBuilder: (BuildContext context) =>
                                listRequest
                                    .map((item) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          item['title'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )))
                                    .toList(),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    children: List.generate(listWithdraw.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: global.black1,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  listWithdraw[index]['driver']['name'],
                                  style: TextStyle(
                                      color: global.gold,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                if (listWithdraw[index]['status'] == 'pending')
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              //backgroundColor: global.black1,
                                              title: Text(
                                                'Duyệt lệnh rút tiền',
                                                style: TextStyle(
                                                    color: global.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              content: Container(
                                                height: 150,
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Bạn có chắc chắc muốn DUYỆT lệnh rút tiền không?',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: global.black),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                            flex: 1,
                                                            child: InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                  height: 50,
                                                                  margin: EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          20,
                                                                          15,
                                                                          0),
                                                                  decoration: BoxDecoration(
                                                                      color: global
                                                                          .gold,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Huỷ',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: global
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                  )),
                                                            )),
                                                        Expanded(
                                                            flex: 1,
                                                            child: InkWell(
                                                              onTap: () {
                                                                postApprove(
                                                                    listWithdraw[
                                                                            index]
                                                                        ['id']);
                                                              },
                                                              child: Container(
                                                                  height: 50,
                                                                  margin: EdgeInsets
                                                                      .fromLTRB(
                                                                          15,
                                                                          20,
                                                                          0,
                                                                          0),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Đồng ý',
                                                                      style: TextStyle(
                                                                          color: global
                                                                              .gold,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              20),
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
                                      //postApprove(listWithdraw[index]['id']);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: global.gold,
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Text(
                                        'Duyệt',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: global.black,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              listWithdraw[index]['driver']['phone'],
                              style: TextStyle(
                                  color: global.gold,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              getTrangThai(listWithdraw[index]['status']),
                              style: TextStyle(
                                  color: global.gold,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tên ngân hàng: ',
                                  style: TextStyle(
                                      color: global.gold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  listWithdraw[index]['driver']
                                      ['ten_ngan_hang'],
                                  style: TextStyle(
                                      color: global.gold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tên chủ tài khoản: ',
                                  style: TextStyle(
                                      color: global.gold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  listWithdraw[index]['driver']
                                      ['chu_tai_khoan'],
                                  style: TextStyle(
                                      color: global.gold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Số tài khoản: ',
                                  style: TextStyle(
                                      color: global.gold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  listWithdraw[index]['driver']['so_tai_khoan']
                                      .toString(),
                                  style: TextStyle(
                                      color: global.gold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tổng tiền: ',
                                      style: TextStyle(
                                          color: global.gold,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      numberFormat.format(
                                          listWithdraw[index]['amount']),
                                      style: TextStyle(
                                          color: global.gold,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Text(
                                  DateFormat('dd/MM/yyyy HH:mm').format(
                                      DateTime.parse(
                                          listWithdraw[index]['created_at'])),
                                  style: TextStyle(
                                      color: global.gold, fontSize: 18),
                                )
                              ],
                            )
                          ],
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
                    image: AssetImage(global.borderImgPath), fit: BoxFit.fill)),
          ),
        ]),
      ),
    );
  }
}
