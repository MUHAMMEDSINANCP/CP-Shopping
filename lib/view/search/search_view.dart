import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/search_row.dart';
import '../../../common_widget/section_title_icon.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();

  List receArr = [
    {
      "name": "Nike Shoes Transparent",
      "icon": "assets/img/gym-shoes.png",
    },
    {
      "name": "Black Shoe Transparent",
      "icon": "assets/img/gym-shoes.png",
    },
  ];

  List searchArr = [
    {
      "name": "Nike Shoes Transparent",
      "icon": "assets/img/gym-shoes.png",
    },
    {
      "name": "Black Shoe Transparent",
      "icon": "assets/img/gym-shoes.png",
    },
    {
      "name": "Women Shoes",
      "icon": "assets/img/gym-shoes.png",
    },
    {
      "name": "Nike Shoes Transparent",
      "icon": "assets/img/gym-shoes.png",
    },
    {
      "name": "Nike Shoes Transparent",
      "icon": "assets/img/gym-shoes.png",
    },
    {
      "name": "Nike Shoes Transparent",
      "icon": "assets/img/gym-shoes.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        backgroundColor: TColor.white,
        elevation: 0,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Image.asset(
        //       "assets/img/back.png",
        //       width: 20,
        //       height: 20,
        //       color: TColor.secondaryText,
        //     )),
        title: Container(
          decoration: BoxDecoration(
            color: TColor.secondaryText.withOpacity(0.2),
            borderRadius: BorderRadius.circular(3),
          ),
          child: TextField(
            controller: txtSearch,
            onChanged: (newVal) {
              setState(() {});
            },
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "assets/img/search_tab.png",
                    width: 20,
                    height: 20,
                    color: TColor.primary,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    txtSearch.text = "";
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {});
                  },
                  icon: Image.asset(
                    "assets/img/close.png",
                    width: 15,
                    height: 15,
                    color: TColor.secondaryText,
                  ),
                ),
                hintText: "Search",
                hintStyle:
                    TextStyle(color: TColor.secondaryText, fontSize: 14)),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (receArr.isNotEmpty && txtSearch.text.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SectionTitleIcon(
                title: "Recent searches",
                icon: "assets/img/close.png",
                onPressed: () {
                  receArr.clear();

                  setState(() {});
                },
              ),
            ),
          if (receArr.isNotEmpty && txtSearch.text.isEmpty)
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: receArr.length,
                separatorBuilder: (context, index) => Divider(
                  color: TColor.secondaryText,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  var rObj = receArr[index] as Map? ?? {};
                  return SearchRow(
                    sObj: rObj,
                    onPressed: () {},
                  );
                },
              ),
            ),
          if (txtSearch.text.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount: searchArr.length,
                separatorBuilder: (context, index) => Divider(
                  color: TColor.secondaryText,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  var sObj = searchArr[index] as Map? ?? {};
                  return SearchRow(
                    sObj: sObj,
                    onPressed: () {},
                  );
                },
              ),
            ),
          if (receArr.isEmpty && txtSearch.text.isEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/img/search_black.png",
                    width: media.width * 0.6,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You have not recent\nsearches.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
