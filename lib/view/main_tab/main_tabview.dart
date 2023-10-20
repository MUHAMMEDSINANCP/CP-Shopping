import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extension.dart';
import '../account/account_view.dart';
import '../fav/saved_item_view.dart';
import '../home/home_view.dart';
import '../search/search_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: TabBarView(
        controller: controller,
        children: [
          const HomeView(),
          const SearchView(),
          Container(),
          const SavedItemsView(),
          const AccountView(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: TColor.white, boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, -2))
        ]),
        child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: TabBar(
              controller: controller,
              indicator: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: TColor.primary,
                    width: 3.0
                  )
                )
              ),

              indicatorPadding: const EdgeInsets.symmetric(horizontal: 15) ,
              tabs: [
                Tab(
                  icon: Image.asset(
                    selectTab == 0
                        ? "assets/img/home_tab_select.png"
                        : "assets/img/home_tab.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    selectTab == 1
                        ? "assets/img/search_tab_select.png"
                        : "assets/img/search_tab.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    selectTab == 2
                        ? "assets/img/cart_tab_select.png"
                        : "assets/img/cart_tab.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    selectTab == 3
                        ? "assets/img/favorite_tab_select.png"
                        : "assets/img/favorite_tab.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    selectTab == 4
                        ? "assets/img/profile_tab_select.png"
                        : "assets/img/profile_tab.png",
                    width: 25,
                    height: 25,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
