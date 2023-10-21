import 'package:cp_shopping/view/fav/saved_item_view.dart';
import 'package:cp_shopping/view/home/product_list_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/home_cell.dart';
import '../../../common_widget/home_save_row.dart';
import '../../../common_widget/home_section_row.dart';
import '../../../common_widget/home_styles_cell.dart';
import '../../../common_widget/recently_cell.dart';
import '../../../common_widget/section_see_all.dart';
import '../../../common_widget/section_title_icon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List listArr = [
    {
      "name": "Graphic shirts",
      "detail": "The fine print",
      "image": "assets/img/graphic_shirts.png",
    },
    {
      "name": "Summer co-ords",
      "detail": "Just add kicks",
      "image": "assets/img/summer_co_ords.png"
    },
    {
      "name": "Sandals",
      "detail": "Stay cool",
      "image": "assets/img/sandal.png",
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
        elevation: 1,
        backgroundColor: TColor.white,
        centerTitle: true,
        title: Text(
          "🛒CP SHOPPING",
          style: TextStyle(
              letterSpacing: 1.5,
              color: TColor.title,
              fontSize: 19,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSectionRow(
              title: "NEW TREND",
              img: "assets/img/new_trend.png",
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
                    onPressed: () {},
                  );
                }),
            HomeSectionRow(
              title: "SRIPPES",
              subtitle: "The line kings",
              img: "assets/img/srippes.png",
              onPressed: () {},
            ),
            HomeSectionRow(
              title: "SUMMER SEA",
              img: "assets/img/summer_sea.png",
              onPressed: () {},
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
}
