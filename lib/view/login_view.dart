import 'package:deliverymanager/class/global.dart' as global;
import 'package:deliverymanager/controller/auth_controller.dart';
import 'package:deliverymanager/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //var
  AuthController authController = Get.find();
  TextEditingController usernameController =
      TextEditingController(text: 'admin');
  TextEditingController passwordController =
      TextEditingController(text: '123456');

  //method

  login() async {
    if (usernameController.text.isEmpty) {
      global.showError('Vui lòng nhập tên đăng nhập');
    } else if (passwordController.text.isEmpty) {
      global.showError('Vui lòng nhập mật khẩu');
    } else {
      global.showLoading();
      dynamic data = await authController.postLogin(
          usernameController.text, passwordController.text);
      global.hideLoading();
      if (data['error'] == true) {
        global.showError(data['message']);
      } else {
        global.showSuccess(data['message']);
        global.token = data['data']['token'];
        global.user = data['data']['data'];
        Get.to(() => MainView());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(global.backgroundImage),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(0)),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 167,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  width: double.infinity,
                  height: 169,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  width: double.infinity,
                  height: 169,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  width: double.infinity,
                  height: 165,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  width: double.infinity,
                  height: 169,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(0)),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 200,
                              height: 200,
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Image.asset('assets/logo1.png')),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Text(
                              'ĐĂNG NHẬP',
                              style: TextStyle(
                                  fontSize: 23,
                                  color: global.gold,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tên đăng nhập',
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
                                      controller: usernameController,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: global.black1,
                                          hintText: 'VD: Nguyễn Văn A',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: global.black1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: global.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(10, 2, 2, 2)),
                                      cursorColor: Colors.grey,
                                      style: TextStyle(color: global.grey),
                                      obscureText: false,
                                      //keyboardType: TextInputType.number,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Mật Khẩu',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: global.gold),
                                              ),
                                              Text(
                                                '*',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Quên mật khẩu?',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: global.black1,
                                          hintText: 'Nhập mật khẩu',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: global.black1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(10, 2, 2, 2)),
                                      cursorColor: Colors.grey,
                                      style: TextStyle(color: global.grey),
                                      obscureText: true,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        login();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: global.gold,
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 40, 0, 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Đăng nhập',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: global.black,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
