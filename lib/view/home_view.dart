import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/summary_controller.dart';
import 'package:deliverymanager/view/driver_online_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  SummaryController summaryController = Get.find();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime fromDateTime = DateTime.now();
  DateTime toDateTime = DateTime.now();
  var numberFormat = NumberFormat('#,###', 'en_US');
  dynamic summary;

  // @override
  // void initState() {
  //   super.initState();
  //   fromController.text=DateFormat('dd/MM/yyyy') .format(fromDateTime);
  //   toController.text=DateFormat('dd/MM/yyyy').format(toDateTime);
  //   getData();
  // }

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

  getSummary() async {
    global.showLoading();
    dynamic data = await summaryController.getSummary(
        DateFormat('yyyy-MM-dd').format(fromDateTime),
        DateFormat('yyyy-MM-dd').format(toDateTime));
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      summary = data['data'];
      setState(() {});
    }
  }

  getData() async {
    dynamic data = await summaryController.getSummary(
        DateFormat('yyyy-MM-dd').format(fromDateTime),
        DateFormat('yyyy-MM-dd').format(toDateTime));

    if (data['error'] == true) {
      global.showError(data['message']);
    } else {}
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fromController.text = DateFormat('dd/MM/yyyy').format(fromDateTime);
    toController.text = DateFormat('dd/MM/yyyy').format(toDateTime);
    getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Tổng quan',
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
                child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
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
                                      borderSide:
                                          BorderSide(color: global.gold),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: global.gold),
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
                                  selectFromDate(context);
                                },
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                      borderSide:
                                          BorderSide(color: global.gold),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: global.gold),
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
                                  selectoDate(context);
                                },
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: global.black1,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tổng đơn',
                        style: TextStyle(
                            color: global.gold,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                (summary != null
                                    ? summary['orders'].toString()
                                    : '0'),
                                style: TextStyle(
                                    color: global.gold,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              Text(
                                'đơn',
                                style: TextStyle(
                                    color: global.gold.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          //       child: FaIcon(FontAwesomeIcons.userLarge,color: global.gold,size: 18,),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          //       child: Text('0',style: TextStyle(color: global.gold,fontSize: 18),),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          //       child: FaIcon(FontAwesomeIcons.motorcycle,color: global.gold,size: 18,),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          //       child: Text('0',style: TextStyle(color: global.gold,fontSize: 18),),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          //       child: FaIcon(FontAwesomeIcons.car,color: global.gold,size: 18,),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          //       child: Text('0',style: TextStyle(color: global.gold,fontSize: 18),),
                          //     ),
                          //     FaIcon(FontAwesomeIcons.chevronRight,color: global.gold,size: 18,)
                          //   ],
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: global.black1,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doanh thu',
                        style: TextStyle(
                            color: global.gold,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                (summary != null
                                    ? numberFormat.format(summary['revenue'])
                                    : '0'),
                                style: TextStyle(
                                    color: global.gold,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          //       child: FaIcon(FontAwesomeIcons.userLarge,color: global.gold,size: 18,),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          //       child: Text('0',style: TextStyle(color: global.gold,fontSize: 18),),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          //       child: FaIcon(FontAwesomeIcons.motorcycle,color: global.gold,size: 18,),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          //       child: Text('0',style: TextStyle(color: global.gold,fontSize: 18),),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          //       child: FaIcon(FontAwesomeIcons.car,color: global.gold,size: 18,),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          //       child: Text('0',style: TextStyle(color: global.gold,fontSize: 18),),
                          //     ),
                          //     FaIcon(FontAwesomeIcons.chevronRight,color: global.gold,size: 18,)
                          //   ],
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => DriverOnlineView());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: global.black1,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tài xế đang chạy',
                          style: TextStyle(
                              color: global.gold,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  (summary != null
                                      ? summary['drivers'].toString()
                                      : '0'),
                                  style: TextStyle(
                                      color: global.gold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
