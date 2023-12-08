import 'package:cp_shopping/common_widget/item_cell.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/home_section_row.dart';

class SearchDetailView extends StatefulWidget {
  const SearchDetailView({super.key});

  @override
  State<SearchDetailView> createState() => _SearchDetailViewState();
}

class _SearchDetailViewState extends State<SearchDetailView> {
  List gArr = [
    {
      "name": "Face + Body",
      "image": "assets/img/face_coverings.png",
    },
    {
      "name": "Back in Stock",
      "image": "assets/img/5.png",
    },
    {
      "name": "Trending Now",
      "image": "assets/img/handbag.png",
    },
  ];
  List menArr = [
    {"name": "SUMMER CHILL", "image": "assets/img/summer_sea.png"},
    {
      "name": "NEW PRODUCTS",
      "image": "assets/img/srippes.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "New in",
          style: TextStyle(
              letterSpacing: 1,
              color: TColor.title,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.4),
                itemCount: gArr.length,
                itemBuilder: (context, index) {
                  var pObj = gArr[index] as Map? ?? {};

                  return ItemCell(
                    pObj: pObj,
                    onPressed: () {},
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "New Edits",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 18,
                ),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
          ],
        ),
      ),
    );
  }
}
