import 'package:cp_shopping/view/cart/cart_view.dart';
import 'package:cp_shopping/view/detail/product_detail_view.dart';
import 'package:cp_shopping/view/home/filter_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/icon_text_button.dart';
import '../../../common_widget/product_cell.dart';
import '../../../common_widget/sort_row.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  int sortType = 0;

  List listArr = [
    {
      "name": "Handbag LV",
      "price": "\$225",
      "image": "assets/img/handbag.png",
      "is_fav": true
    },
    {
      "name": "Dress",
      "price": "\$87",
      "image": "assets/img/summer_co_ords.png",
      "is_fav": false
    },
    {
      "name": "Shoes",
      "price": "\$201",
      "image": "assets/img/3.png",
      "is_fav": false
    },
    {
      "name": "T-shirt",
      "price": "\$86",
      "image": "assets/img/t-shirt.png",
      "is_fav": true
    },
    {
      "name": "Handbag",
      "price": "\$102",
      "image": "assets/img/4.png",
      "is_fav": false
    },
    {
      "name": "Shot",
      "price": "\$98",
      "image": "assets/img/2.png",
      "is_fav": false
    },
    {
      "name": "Handbag LV",
      "price": "\$225",
      "image": "assets/img/handbag.png",
      "is_fav": true
    },
    {
      "name": "Dress",
      "price": "\$87",
      "image": "assets/img/summer_co_ords.png",
      "is_fav": false
    },
    {
      "name": "Shoes",
      "price": "\$201",
      "image": "assets/img/3.png",
      "is_fav": false
    },
    {
      "name": "T-shirt",
      "price": "\$86",
      "image": "assets/img/t-shirt.png",
      "is_fav": true
    },
    {
      "name": "Handbag",
      "price": "\$102",
      "image": "assets/img/4.png",
      "is_fav": false
    },
    {
      "name": "Shot",
      "price": "\$98",
      "image": "assets/img/2.png",
      "is_fav": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: TColor.white,
        elevation: 0.5,
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
        title: Text(
          "New Trends",
          style: TextStyle(
              color: TColor.title, fontSize: 19, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartView()));
              },
              icon: Image.asset(
                "assets/img/cart_tab.png",
                width: 22,
                height: 22,
                color: TColor.primaryText,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: IconTextButton(
                    title: "Sort",
                    icon: "assets/img/sort-tool.png",
                    onPressed: () {
                      openSort();
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: IconTextButton(
                    title: "Filter",
                    icon: "assets/img/filter.png",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FilterView()));
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1),
                itemCount: listArr.length,
                itemBuilder: (context, index) {
                  var pObj = listArr[index] as Map? ?? {};

                  return ProductCell(
                    pObj: pObj,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductDetailView()));
                    },
                    onFavPressed: () {},
                    onLikePressed: () {},
                  );
                }),
          )
        ],
      ),
    );
  }

  void openSort() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(3)),
                child: Column(
                  children: [
                    SortRow(
                      title: "Recommended",
                      isSelect: sortType == 0,
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          sortType = 0;
                        });
                      },
                    ),
                    SortRow(
                      title: "What's New",
                      isSelect: sortType == 1,
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          sortType = 1;
                        });
                      },
                    ),
                    SortRow(
                      title: "Price: High to low",
                      isSelect: sortType == 2,
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          sortType = 2;
                        });
                      },
                    ),
                    SortRow(
                      title: "Price: Low to high",
                      isSelect: sortType == 3,
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          sortType = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ]),
          );
        });
  }
}
