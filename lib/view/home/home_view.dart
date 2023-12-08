import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cp_shopping/view/detail/product_detail_view.dart';
import 'package:cp_shopping/view/fav/saved_item_view.dart';
import 'package:cp_shopping/view/home/product_list_view.dart';
import 'package:cp_shopping/view/account/settings_view.dart';
import 'package:cp_shopping/view/account/social_accounts.dart';
import 'package:cp_shopping/view/on_boarding/on_boarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../../common_widget/home_cell.dart';
import '../../../common_widget/home_save_row.dart';
import '../../../common_widget/home_section_row.dart';
import '../../../common_widget/home_styles_cell.dart';
import '../../../common_widget/recently_cell.dart';
import '../../../common_widget/section_see_all.dart';
import '../../../common_widget/section_title_icon.dart';
import '../account/about_us.dart';
import '../account/gift_card_view.dart';
import '../account/my_order_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    fetchUserName();
    super.initState();
  }

  String name = "";
  String email = "";
  String lastName = "";

  void fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (mounted) {
        setState(() {
          name = userSnapshot['name'] ?? 'First Name';
          email = userSnapshot['email'] ?? 'Email';
          lastName = userSnapshot['last_name'] ?? 'Last Name';
        });
      }
    }
  }

  List listArr = [
    {
      "name": "Graphic shirts",
      "detail": "The fine print",
      "image": "assets/img/graphic_shirts.png",
    },
    {
      "name": "Sandals",
      "detail": "Stay cool",
      "image": "assets/img/sandal.png",
    },
    {
      "name": "Summer co-ords",
      "detail": "Just add kicks",
      "image": "assets/img/summer_co_ords.png"
    },
    {
      "name": "Face coverings",
      "detail": "Washable",
      "image": "assets/img/face_coverings.png"
    }
  ];

  List receArr = [
    {
      "name": "",
      "detail": "Pull&Bear slim fit t-shirt in rib in white",
      "image": "assets/img/rv_1.png",
      "is_fav": true
    },
    {
      "name": "",
      "detail": "Pull&Bear slim fit t-shirt in rib in white",
      "image": "assets/img/rv_2.png",
      "is_fav": false
    },
  ];

  List saveArr = [
    {"name": "Handbag LV", "price": "\$225", "image": "assets/img/handbag.png"},
    {"name": "T-shirt", "price": "\$123", "image": "assets/img/t-shirt.png"},
  ];

  List brandNameArr = [
    "Nike",
    "Adidas",
    "Vans",
    "The North face",
    "Collusion",
    "Calvin Klein",
    "Champion",
    "Fred Perry",
    "Fila",
    "Carhartt Wip",
    "Puma",
    "Levi's",
    "Dr Martens",
    "Tommy Hilfger",
    "Lascolate"
  ];

  List stylesBaseArr = [
    {
      "name": "Just add kicks",
      "price": "\$36",
      "image": "assets/img/1.png",
      "is_fav": true
    },
    {
      "name": "Just add kicks",
      "price": "\$98",
      "image": "assets/img/2.png",
      "is_fav": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: TColor.title,
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Use Scaffold.of(context)
              },
            );
          },
        ),
        elevation: 1,
        backgroundColor: TColor.white,
        centerTitle: true,
        title: Text(
          "🛒CP SHOPPING",
          style: TextStyle(
              letterSpacing: 2,
              color: TColor.title,
              fontSize: 22,
              fontWeight: FontWeight.w900),
        ),
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSectionRow(
              title: "NEW TRENDS",
              img: "assets/img/summer_sea.png",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductListView(),
                  ),
                );
              },
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.95),
                itemCount: listArr.length,
                itemBuilder: (context, index) {
                  var pObj = listArr[index] as Map? ?? {};

                  return HomeCell(
                    pObj: pObj,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductDetailView()));
                    },
                  );
                }),
            HomeSectionRow(
              title: "SRIPPES",
              subtitle: "The line kings",
              img: "assets/img/srippes.png",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductDetailView()));
              },
            ),
            HomeSectionRow(
              title: "SUMMER SEA",
              img: "assets/img/summer_sea.png",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductDetailView()));
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SectionTitleIcon(
                title: "Recently viewed",
                icon: "assets/img/close.png",
                onPressed: () {},
              ),
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.95),
                itemCount: receArr.length,
                itemBuilder: (context, index) {
                  var pObj = receArr[index] as Map? ?? {};

                  return RecentlyCell(
                    pObj: pObj,
                    onPressed: () {},
                    onFavPressed: () {},
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SectionSeeAll(
                title: "Saved items",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SavedItemsView()));
                },
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: saveArr.length,
                itemBuilder: (context, index) {
                  var pObj = saveArr[index] as Map? ?? {};

                  return HomeSaveRow(
                    pObj: pObj,
                    onPressed: () {},
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Brands you  may like",
                style: TextStyle(
                    color: TColor.title,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 15,
                runSpacing: 8,
                children: brandNameArr.map((bObj) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: TColor.secondaryText.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Text(
                          bObj.toString(),
                          style: TextStyle(
                              color: TColor.primaryText, fontSize: 14),
                        )),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Styles based on your shopping habits",
                style: TextStyle(
                    color: TColor.title,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.95),
                itemCount: stylesBaseArr.length,
                itemBuilder: (context, index) {
                  var pObj = stylesBaseArr[index] as Map? ?? {};

                  return HomeStylesCell(
                    pObj: pObj,
                    onPressed: () {},
                    onFavPressed: () {},
                    onLikePressed: () {},
                  );
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      width: 300,
      shadowColor: TColor.title,
      elevation: 16.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 4.0, color: TColor.title.withOpacity(0.8)),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            margin: const EdgeInsets.only(left: 20),
            decoration: const BoxDecoration(color: Colors.white),
            accountName: Text(
              name,
              style: TextStyle(
                  color: TColor.title,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
            accountEmail: Text(
              email,
              style: TextStyle(
                color: TColor.title.withOpacity(0.6),
                fontSize: 15,
                letterSpacing: 1,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/img/pr.png",
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: TColor.title,
            ),
            title: const Text('My Order'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyOrderView(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: TColor.title,
            ),
            title: const Text(
              'Social Accounts',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SocialAccounts(
                    didSelect: (newVal) {},
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.card_giftcard,
              color: TColor.title,
            ),
            title: const Text('Gift Cards & Voucher'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GiftCardView(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: TColor.title,
            ),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: TColor.title,
            ),
            title: const Text('About us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ),
              );
            },
          ),
          const Expanded(
            child: SizedBox(),
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              confirmLogout();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 7,
                child: Icon(
                  Icons.info,
                  size: 12,
                  color: TColor.secondaryText,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                "version ",
                style: TextStyle(
                  color: TColor.secondaryText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "1.0.2",
                  style: TextStyle(color: TColor.secondaryText, fontSize: 11),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Future<void> confirmLogout() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black, // Default color for text
                ),
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Logout from ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'CP Shopping',
                    style: TextStyle(
                      color: TColor.primary, // Change color to yellow
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                // Perform logout logic here
                await FirebaseAuth.instance.signOut();

                if (mounted) {
                  Navigator.of(context).pop();
                }

                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnBoardingView(),
                    ),
                  );
                }
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
