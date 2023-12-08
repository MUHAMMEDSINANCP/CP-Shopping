import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/dropdown.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';
import '../main_tab/main_tabview.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String email = "";
  String name = "";
  String lastName = "";
  String password = "";

  bool isLoading = false;
  bool isPasswordVisible = false;

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  final GlobalKey<FormState> _formkeysignup = GlobalKey<FormState>();

  Future<void> register() async {
    if (txtFirstName.text.isEmpty ||
        txtLastName.text.isEmpty ||
        txtEmail.text.isEmpty ||
        txtPassword.text.isEmpty) {
      showSnackBar(
        context,
        "Please fill in all fields...!",
      );
      return;
    }
    if (selectDD == null || selectMM == null || selectYYYY == null) {
      showSnackBar(
        context,
        "Please enter your date of birth.",
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(password: password, email: email);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': email,
        'name': name,
        'last_name': lastName,
        // Add other user details if needed
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            backgroundColor: TColor.primary,
            content: const Text(
              "Registered Successfully",
              style: TextStyle(
                fontSize: 20,
              ),
            ))));
      }
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainTabView()));
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'weak-password':
          if (context.mounted) {
            showSnackBar(context, "Password provided is too weak");
          }
          break;
        case 'email-already-in-use':
          if (context.mounted) {
            showSnackBar(context, "Account already exists!");
          }
          break;
        case 'invalid-email':
          if (context.mounted) {
            showSnackBar(context, " email address is not valid.");
          }
          break;
        case 'operation-not-allowed':
          if (context.mounted) {
            showSnackBar(context,
                "Enable email/password accounts in the Firebase Console, under the Auth tab.");
          }

        default:
          // Handle other FirebaseException codes here
          break;
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
          child: Form(
            key: _formkeysignup,
            child: Column(
              children: [
                RoundTextField(
                  controller: txtEmail,
                  title: "Email address",
                  hitText: "Enter email address",
                  keyboardType: TextInputType.emailAddress,
                  subtext: "We'll send your order confirmation here",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email address.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                  controller: txtFirstName,
                  title: "First name",
                  hitText: "Enter first name",
                  subtext: "",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your first name.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                  controller: txtLastName,
                  title: "Last name",
                  hitText: "Enter last name",
                  subtext: "",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your last name.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextFieldWithEyeIcon(
                  controller: txtPassword,
                  title: "Password",
                  hitText: "Enter password",
                  subtext: "Must be 10 or more characters",
                  showEyeIcon: !isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Create a Password.";
                    }
                    return null;
                  },
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
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 14),
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
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 12),
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
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 14),
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
                                        color: TColor.primaryText,
                                        fontSize: 16),
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
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 14),
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
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 12),
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
                                    // ignore: avoid_print
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
                                    // ignore: avoid_print
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
                  isLoading: isLoading,
                  title: "Sign up",
                  onPressed: () async {
                    if (_formkeysignup.currentState!.validate()) {
                      setState(() {
                        email = txtEmail.text.trim();
                        name = txtFirstName.text.trim();
                        lastName = txtLastName.text.trim();
                        password = txtPassword.text.trim();
                      });
                      register();
                    }
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.width * 0.2, left: 20, right: 20),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.redAccent,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  );
}
