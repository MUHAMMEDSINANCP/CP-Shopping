import 'package:cp_shopping/common_widget/social_account_row.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class SocialAccounts extends StatefulWidget {
  final Function(Map) didSelect;

  const SocialAccounts({super.key, required this.didSelect});

  @override
  State<SocialAccounts> createState() => _SocialAccountsState();
}

class _SocialAccountsState extends State<SocialAccounts> {
  int selectIndex = 0;

  List connectedArr = [
    {
      "name": "Connect to FaceBook",
      "icon": "assets/img/facebook.png",
      "color": const Color(0xff6F82FE)
    },
    {
      "name": "Connect to Instagram",
      "icon": "assets/img/instagram.png",
      "color": const Color.fromARGB(255, 217, 77, 53)
    },
    {
      "name": "Connect to LinkedIn",
      "icon": "assets/img/linkedin.png",
      "color": const Color(0xff68CCFF)
    },
    {
      "name": "Connect to Pinterest",
      "icon": "assets/img/pinterest.png",
      "color": const Color(0xffFF6475)
    },
    {
      "name": "Connect to Tumblr",
      "icon": "assets/img/tumblr.png",
      "color": const Color(0xff64B5FF)
    },
    {
      "name": "Connect to X",
      "icon": "assets/img/x.png",
      "color": const Color.fromARGB(255, 30, 34, 57)
    },
    {
      "name": "Connect to Reddit",
      "icon": "assets/img/reddit.png",
      "color": const Color(0xffFFBD5D)
    },
  ];
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            color: TColor.title,
            height: 25,
          ),
        ),
        title: Text(
          "Connected",
          style: TextStyle(
              color: TColor.title, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "Choose to Connect Social Network",
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                itemBuilder: (context, index) {
                  var tObj = connectedArr[index] as Map? ?? {};
                  return SocialAccountsRow(
                      tlbj: tObj,
                      onPressed: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      isActive: selectIndex == index);
                },
                itemCount: connectedArr.length),
          ),
        ],
      ),
    );
  }
}
