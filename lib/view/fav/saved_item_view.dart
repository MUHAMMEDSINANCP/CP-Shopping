import 'package:cp_shopping/view/detail/product_detail_view.dart';
 import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../../common_widget/save_item_row.dart';
import '../../../common_widget/tab_text_button.dart';

class SavedItemsView extends StatefulWidget {
  const SavedItemsView({super.key});

  @override
  State<SavedItemsView> createState() => _SavedItemsViewState();
}

class _SavedItemsViewState extends State<SavedItemsView> {
  List alllistArr = [
    {
      "name": "Handbag LV",
      "price": "\$225",
      "color": "#8F5F43",
      "size": "4L",
      "image": "assets/img/handbag.png",
    },
    {
      "name": "T-shirt",
      "price": "\$36",
      "color": "#9D9EA3",
      "size": "M",
      "image": "assets/img/1.png",
    },
    {
      "name": "T-shirt",
      "price": "\$86",
      "color": "#DF5C1F",
      "size": "XL",
      "image": "assets/img/t-shirt.png",
    },
  ];
  List brandsArr = [
    {
      "name": "T-shirt",
      "price": "\$36",
      "color": "#9D9EA3",
      "size": "M",
      "image": "assets/img/1.png",
    },
    {
      "name": "T-shirt",
      "price": "\$86",
      "color": "#DF5C1F",
      "size": "XL",
      "image": "assets/img/t-shirt.png",
    },
    {
      "name": "Handbag LV",
      "price": "\$225",
      "color": "#8F5F43",
      "size": "4L",
      "image": "assets/img/handbag.png",
    },
  ];

  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => const MainTabView()));
          //   },
          //   icon: const Icon(Icons.arrow_back_ios_new),
          //   color: TColor.title,
          // ),
          centerTitle: true,
          backgroundColor: TColor.white,
          elevation: 0.5,
          title: Text(
            "Saved Items",
            style: TextStyle(
                letterSpacing: 1,
                color: TColor.title,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TabTextButton(
                      title: "All Items",
                      isActive: selectTab == 0,
                      onPressed: () {
                        setState(() {
                          selectTab = 0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TabTextButton(
                      title: "Brands",
                      isActive: selectTab == 1,
                      onPressed: () {
                        setState(() {
                          selectTab = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (selectTab == 0)
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: alllistArr.length,
                    itemBuilder: (context, index) {
                      var pObj = alllistArr[index] as Map? ?? {};

                      return SaveItemRow(
                        pObj: pObj,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductDetailView()));
                        },
                      );
                    }),
              ),
            if (selectTab == 1)
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: brandsArr.length,
                    itemBuilder: (context, index) {
                      var pObj = brandsArr[index] as Map? ?? {};

                      return SaveItemRow(
                        pObj: pObj,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductDetailView()));
                        },
                      );
                    }),
              )
          ],
        ));
  }
}
