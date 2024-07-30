import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListDriverView extends StatelessWidget {
  final Map<String, dynamic> userInfo;
  final Color backgroundColor;
  final Color textColor;

  ListDriverView({
    required this.userInfo,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAlias,
            child: userInfo['avatar'] != null
                ? Image.network(
                    userInfo['avatar'],
                    fit: BoxFit.fill,
                  )
                : Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.user,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userInfo['name'].toString(),
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userInfo['phone'],
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
