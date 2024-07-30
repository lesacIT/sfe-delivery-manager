import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/components/list_driver_view.dart';
import 'package:deliverymanager/controller/supervisor_controller.dart';
import 'package:deliverymanager/view/add_supervisor_view.dart';
import 'package:deliverymanager/view/driver_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ManagerView extends StatefulWidget {
  ManagerView({super.key});

  @override
  State<ManagerView> createState() => _ManagerViewState();
}

class _ManagerViewState extends State<ManagerView> {
  SupervisorController supervisorController = Get.find();
  TextEditingController searchController = TextEditingController();
  List listManager = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    dynamic data =
        await supervisorController.getSupervisor(searchController.text);
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
      listManager = data['data'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text(
          'Quản lý',
          style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
              onTap: () async {
                await Get.to(() => AddSupervisorView());
                getData();
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: FaIcon(
                  FontAwesomeIcons.add,
                  color: global.gold,
                ),
              ))
        ],
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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                      children: List.generate(listManager.length, (index) {
                        return InkWell(
                            onTap: () async {
                              await Get.to(() => DriverView(
                                    manager: listManager[index],
                                  ));
                              getData();
                            },
                            child: ListDriverView(
                              userInfo: listManager[index],
                              backgroundColor: global.black1,
                              textColor: global.gold,
                            )

                            // Container(
                            //   decoration: BoxDecoration(
                            //       color: global.black1,
                            //       borderRadius: BorderRadius.circular(10)),
                            //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            //   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         width: 70,
                            //         height: 70,
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(10)),
                            //         clipBehavior: Clip.antiAlias,
                            //         child: listManager[index]['avatar'] != null
                            //             ? Image.network(
                            //                 listManager[index]['avatar'],
                            //                 fit: BoxFit.fill)
                            //             : Container(
                            //                 decoration: BoxDecoration(
                            //                     border: Border.all(
                            //                         color: Colors.white,
                            //                         width: 1),
                            //                     color: Colors.transparent,
                            //                     borderRadius:
                            //                         BorderRadius.circular(100)),
                            //                 child: Center(
                            //                   child: FaIcon(
                            //                     FontAwesomeIcons.user,
                            //                     color: Colors.white,
                            //                     size: 40,
                            //                   ),
                            //                 )),
                            //       ),
                            //       Expanded(
                            //         child: Padding(
                            //           padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.center,
                            //             children: [
                            //               Column(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.start,
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text(
                            //                     listManager[index]['name']
                            //                         .toString(),
                            //                     style: TextStyle(
                            //                         color: global.gold,
                            //                         fontSize: 16,
                            //                         fontWeight: FontWeight.bold),
                            //                   ),
                            //                   Text(
                            //                     listManager[index]['phone'],
                            //                     style: TextStyle(
                            //                         color: global.gold,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: 16),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            );
                      })),
                )
              ],
            )),
            // Expanded(
            //   child: ListView(
            //     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //     children: List.generate(listManager.length, (index) {
            //       return DriverListItem(listManager: listManager[index]);
            //     }),
            //   ),
            // ),
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
