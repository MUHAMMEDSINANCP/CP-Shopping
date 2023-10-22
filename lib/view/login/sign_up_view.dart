import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/dropdown.dart';
import '../../common_widget/round_buttom.dart';
import '../../common_widget/round_textfield.dart';
import '../main_tab/main_tabview.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  List dayArr = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];

  List mothArr = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];

  List yearArr = [
    "2023",
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012",
    "2011",
    "2010",
    "2009",
    "2008",
    "2007",
    "2006",
    "2005",
    "2004",
    "2003",
    "2002",
    "2001",
    "2000",
    "1999",
    "1998",
    "1997",
    "1996",
    "1995",
    "1994",
    "1993",
    "1992",
    "1991",
    "1990",
    "1989",
    "1988",
    "1987",
    "1986",
    "1985",
    "1984",
    "1983",
    "1982",
    "1981",
    "1980",
  ];

  String? selectDD;
  String? selectMM;
  String? selectYYYY;

  bool isMenswear = false;

  bool isDiscount = false;
  bool isNewStuff = false;
  bool isExclusives = false;
  bool isAppPartners = false;

  // Function to reset the state variables for checkboxes
  void clearCheckboxes() {
    setState(() {
      isMenswear = false;
      isDiscount = false;
      isNewStuff = false;
      isExclusives = false;
      isAppPartners = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        backgroundColor: TColor.white,
        elevation: 0.7,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 25,
              height: 25,
              color: TColor.title,
            )),
        centerTitle: true,
        title: Text(
          "Sign up",
          style: TextStyle(
              letterSpacing: 1.6,
              color: TColor.title,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              RoundTextField(
                controller: txtEmail,
                title: "Email address",
                hitText: "Enter email address",
                keyboardType: TextInputType.emailAddress,
                subtext: "We'll send your order confirmation here",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtFirstName,
                title: "First name",
                hitText: "Enter first name",
                subtext: "",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtLastName,
                title: "Last name",
                hitText: "Enter last name",
                subtext: "",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextFieldWithEyeIcon(
                controller: txtPassword,
                title: "Password",
                hitText: "Enter password",
                subtext: "Must be 10 or more characters",
                showEyeIcon: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Date of birth",
                    style: TextStyle(color: TColor.secondaryText, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Dropdown(
                          placeholder: "DD",
                          valueList: dayArr,
                          selectValue: selectDD,
                          didChange: (sObj) {
                            setState(() {
                              selectDD = sObj;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Dropdown(
                          placeholder: "MM",
                          valueList: mothArr,
                          selectValue: selectMM,
                          didChange: (sObj) {
                            setState(() {
                              selectMM = sObj;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Dropdown(
                          placeholder: "YYYY",
                          valueList: yearArr,
                          selectValue: selectYYYY,
                          didChange: (sObj) {
                            setState(() {
                              selectYYYY = sObj;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "You need to be 16 or over to use Ebuy",
                    style: TextStyle(color: TColor.secondaryText, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Mostly interested in (Optional)",
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2))
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isMenswear = false;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    !isMenswear
                                        ? "assets/img/radio_button_on.png"
                                        : "assets/img/radio_button_off.png",
                                    width: 18,
                                    height: 18,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Womenswear",
                                    style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              setState(() {
                                isMenswear = true;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  isMenswear
                                      ? "assets/img/radio_button_on.png"
                                      : "assets/img/radio_button_off.png",
                                  width: 18,
                                  height: 18,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Menswear",
                                  style: TextStyle(
                                      color: TColor.primaryText, fontSize: 16),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    )
                  ]),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contact prefested in",
                          style: TextStyle(
                              color: TColor.primaryText, fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            clearCheckboxes(); // Reset checkboxes
                          },
                          child: Image.asset(
                            "assets/img/close.png",
                            width: 18,
                            height: 18,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Tell us which email you'd like:",
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isDiscount = !isDiscount;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discounts and sales",
                            style: TextStyle(
                                color: TColor.primaryText, fontSize: 16),
                          ),
                          Image.asset(
                            isDiscount
                                ? "assets/img/check.png"
                                : "assets/img/uncheck.png",
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isNewStuff = !isNewStuff;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New stuff",
                            style: TextStyle(
                                color: TColor.primaryText, fontSize: 16),
                          ),
                          Image.asset(
                            isNewStuff
                                ? "assets/img/check.png"
                                : "assets/img/uncheck.png",
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExclusives = !isExclusives;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your exclusives",
                            style: TextStyle(
                                color: TColor.primaryText, fontSize: 16),
                          ),
                          Image.asset(
                            isExclusives
                                ? "assets/img/check.png"
                                : "assets/img/uncheck.png",
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isAppPartners = !isAppPartners;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "App partners",
                            style: TextStyle(
                                color: TColor.primaryText, fontSize: 16),
                          ),
                          Image.asset(
                            isAppPartners
                                ? "assets/img/check.png"
                                : "assets/img/uncheck.png",
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tell me more  about these",
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        children: [
                          const TextSpan(
                              text:
                                  "By creating your account, you agree to our "),
                          TextSpan(
                              text: "Terms and Conditions ",
                              style: TextStyle(
                                  color: TColor.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Terms of Service Click");
                                }),
                          const TextSpan(text: " & "),
                          TextSpan(
                              text: "Privacy Policy.",
                              style: TextStyle(
                                  color: TColor.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Privacy Policy Click");
                                })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Sign up",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainTabView()),
                        (route) => false);
                  })
            ],
          ),
        )),
      ),
    );
  }
}
