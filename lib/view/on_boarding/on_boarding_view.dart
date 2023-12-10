import 'package:cp_shopping/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController? controller = PageController();

  List pageArr = [
    {
      "image": "assets/img/on_boarding_1.png",
      "title": "View product 360 degrees",
      "subtitle": "You can see the product with all angles, true and convenient"
    },
    {
      "image": "assets/img/on_boarding_2.png",
      "title": "Find products easily",
      "subtitle":
          "You just need to take a photo or upload and we will find similar products for you."
    },
    {
      "image": "assets/img/on_boarding_3.png",
      "title": "Payment is easy",
      "subtitle":
          "You just need to take a photo or upload and we will find similar products for you."
    }
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    controller?.addListener(() {
      selectPage = controller?.page?.round() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};

                return Column(
                  children: [
                    SizedBox(
                      height: media.width * 0.3,
                    ),
                    Image.asset(
                      pObj["image"].toString(),
                      width: media.width * 0.8,
                      height: media.width * 0.8,
                    ),
                    const Spacer(),
                    Text(
                      pObj["title"].toString(),
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      pObj["subtitle"].toString(),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 15),
                    ),
                    SizedBox(
                      height: media.width * 0.65,
                    ),
                  ],
                );
              }),
          Column(
            children: [
              SizedBox(
                height: media.width * 1.55,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: pageArr.map((pObj) {
                  var index = pageArr.indexOf(pObj);

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                        color: index == selectPage
                            ? TColor.primary
                            : TColor.secondaryText,
                        borderRadius: BorderRadius.circular(2)),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: RoundButton(
                  title: "Get Started!",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
