import 'package:cp_shopping/common_widget/home_section_row.dart';
import 'package:cp_shopping/common_widget/tab_text_button.dart';
import 'package:cp_shopping/view/search/search_detail_view.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';

class SearchNewView extends StatefulWidget {
  const SearchNewView({super.key});

  @override
  State<SearchNewView> createState() => _SearchNewViewState();
}

class _SearchNewViewState extends State<SearchNewView> {
  TextEditingController txtSearch = TextEditingController();
  int selectTab = 0;

  List womenArr = [
    {"name": "Summer co-ords", "image": "assets/img/summer_co_ords.png"},
    {"name": "Face coverings", "image": "assets/img/face_coverings.png"},
    {"name": "Handbag LV", "price": "\$225", "image": "assets/img/handbag.png"},
  ];

  List menArr = [
    {"name": "T-shirt", "image": "assets/img/t-shirt.png"},
    {
      "name": "Graphic shirts",
      "image": "assets/img/graphic_shirts.png",
    },
    {
      "name": "Sandals",
      "image": "assets/img/sandal.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        backgroundColor: TColor.white,
        elevation: 0,
        automaticallyImplyLeading: false,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: TabTextButton(
                        title: "Women",
                        isActive: selectTab == 0,
                        onPressed: () {
                          setState(() {
                            selectTab = 0;
                          });
                        })),
                Expanded(
                    child: TabTextButton(
                        title: "Men",
                        isActive: selectTab == 1,
                        onPressed: () {
                          setState(() {
                            selectTab = 1;
                          });
                        }))
              ],
            ),
          ),
          if (selectTab == 0)
            Expanded(
                child: ListView.builder(
                    itemCount: womenArr.length,
                    itemBuilder: (context, index) {
                      var wObj = womenArr[index] as Map? ?? {};
                      return HomeSectionRow(
                          title: wObj["name"],
                          img: wObj["image"],
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchDetailView()));
                          });
                    })),
          if (selectTab == 1)
            Expanded(
              child: ListView.builder(
                  itemCount: menArr.length,
                  itemBuilder: (context, index) {
                    var wObj = menArr[index] as Map? ?? {};
                    return HomeSectionRow(
                        title: wObj["name"],
                        img: wObj["image"],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchDetailView()));
                        });
                  }),
            ),
        ],
      ),
    );
  }
}
