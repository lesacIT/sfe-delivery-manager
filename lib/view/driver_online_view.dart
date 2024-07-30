import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/summary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverOnlineView extends StatefulWidget {
  const DriverOnlineView({super.key});

  @override
  State<DriverOnlineView> createState() => _DriverOnlineViewState();
}

class _DriverOnlineViewState extends State<DriverOnlineView> {
  SummaryController driverOnlineController = Get.find();

  List listDriverOnline = [];

  getDriverOnline() async {
    global.showLoading();
    dynamic data = await driverOnlineController.getDriverOnline();
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      listDriverOnline = data['data'];
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDriverOnline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Tài xế đang hoạt động',
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
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    children: List.generate(listDriverOnline.length, (index) {
                      return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: global.black1,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(70)),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.network(
                                          listDriverOnline[index]
                                              ['anh_chan_dung'],
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listDriverOnline[index]['name'],
                                          style: TextStyle(
                                              color: global.gold,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          listDriverOnline[index]['phone'],
                                          style: TextStyle(
                                              color: global.gold,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ));
                    })),
              ),
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
