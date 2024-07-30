import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

//var
String link='http://sfedelivery.superweb.xyz';
String img='http://sfedelivery.superweb.xyz/';
String borderImgPath='assets/border.png';
String token='';
String googleMapAPIKey='AIzaSyBE-h2LGdsoEEtovbVZQySIH93O0djYxDY';
Color gold= const Color.fromRGBO(254, 212, 12, 1);
Color black= const Color.fromRGBO(34, 34, 34, 1);
Color black1= const Color.fromRGBO(40, 40, 40, 1);
Color grey= const Color.fromRGBO(184, 184, 181, 1);
Color yellow= const Color.fromRGBO(237, 242, 1, 1);
String backgroundImage='assets/bg.png';
String backgroundImage1='assets/bg1.png';
dynamic user;

//method
showSuccess(message){
  BotToast.showText(
      text: message.toString(),
      contentColor: Colors.green,
      align: const Alignment(0, -0),
      contentPadding: const EdgeInsets.all(10),
      textStyle: const TextStyle(fontSize: 20, color: Colors.white),
      clickClose: true
  );
}

showError(message){
  BotToast.showText(
      text: message.toString(),
      contentColor: Colors.red,
      align: const Alignment(0, -0),
      contentPadding: const EdgeInsets.all(10),
      textStyle: const TextStyle(fontSize: 20, color: Colors.white),
      clickClose: true
  );
}

showLoading(){
  BotToast.showLoading();
}

hideLoading(){
  BotToast.closeAllLoading();
}