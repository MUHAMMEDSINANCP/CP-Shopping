import 'package:cp_shopping/common_widget/recently_view_cell.dart';
import 'package:cp_shopping/common_widget/review_row.dart';
import 'package:cp_shopping/common_widget/round_button.dart';
import 'package:cp_shopping/common_widget/section_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/color_extension.dart';
import '../../common_widget/home_styles_cell.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
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
    {
      "name": "Just add kicks",
      "price": "\$36",
      "image": "assets/img/3.png",
      "is_fav": true
    },
    {
      "name": "Just add kicks",
      "price": "\$98",
      "image": "assets/img/5.png",
      "is_fav": false
    },
  ];
  List listArr = [
    {
      "name": "Graphic shirts",
      "price": "\$23",
      "image": "assets/img/graphic_shirts.png",
      "is_fav": false
    },
    {
      "name": "Sandals",
      "price": "\$14",
      "image": "assets/img/sandal.png",
      "is_fav": true
    },
    {
      "name": "Summer co-ords",
      "price": "\$19",
      "image": "assets/img/summer_co_ords.png",
      "is_fav": true
    },
    {
      "name": "Face coverings",
      "price": "\$23",
      "image": "assets/img/face_coverings.png",
      "is_fav": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TColor.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 250,
                pinned: true,
                floating: true,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/img/back.png",
                      width: 27,
                      height: 27,
                      color: TColor.title,
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "assets/img/summer_sea.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.share,
                          color: TColor.title,
                          size: 27,
                        )),
                  ),
                ],
              )
            ];
          },
          body: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Women's Hoodie",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              IgnorePointer(
                                ignoring: true,
                                child: RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    onRatingUpdate: (rating) {
                                      // ignore: avoid_print
                                      print(rating);
                                    }),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "4.9",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "\$27.00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Description",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Introducing our latest collection of stylish and comfortable clothing! Whether you're a tech enthusiast or simply looking to upgrade your wardrobe, our clothing line is designed to cater to your fashion needs. From trendy t-shirts with cutting-edge designs to cozy hoodies that keep you warm during those late-night coding sessions, we've got you covered. Our goal is to provide you with the perfect blend of fashion and comfort, just like your journey to becoming a pro in building Flutter mobile applications. Explore our range of apparel today and dress for success in style!",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(
                            color: Colors.black12,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Free delivery & returns",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Introducing our latest collection of stylish and comfortable clothing! Whether you're a tech enthusiast or simply looking to upgrade your wardrobe, our clothing line is designed to cater to your fashion needs. From trendy t-shirts with cutting-edge designs to cozy hoodies that keep you warm during those late-night coding sessions, we've got you covered. Our goal is to provide you with the perfect blend of fashion and comfort, just like your journey to becoming a pro in building Flutter mobile applications. Explore our range of apparel today and dress for success in style!",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(
                            color: Colors.black12,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Size guide",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            """Men's Sizes:
    
    Small (S): Chest 36-38 inches, Waist 30-32 inches
    Medium (M): Chest 38-40 inches, Waist 32-34 inches
    Large (L): Chest 40-42 inches, Waist 34-36 inches
    X-Large (XL): Chest 42-44 inches, Waist 36-38 inches
    XX-Large (XXL): Chest 44-46 inches, Waist 38-40 inches
    Women's Sizes:
    
    Small (S): Bust 32-34 inches, Waist 25-27 inches, Hips 34-36 inches
    Medium (M): Bust 34-36 inches, Waist 27-29 inches, Hips 36-38 inches
    Large (L): Bust 36-38 inches, Waist 29-31 inches, Hips 38-40 inches
    X-Large (XL): Bust 38-40 inches, Waist 31-33 inches, Hips 40-42 inches
    XX-Large (XXL): Bust 40-42 inches, Waist 33-35 inches, Hips 42-44 inches""",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: SectionSeeAll(
                              title: "Review",
                              titleAll: "See All",
                              titleColor: TColor.primaryText,
                              onPressed: () {},
                            ),
                          ),
                          const Divider(
                            color: Colors.black12,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return const ReviewRow(
                                  rObj: {
                                    "image": "assets/img/u2.png",
                                    "name": "Andrew Tate",
                                    "rate": 4.2,
                                    "message":
                                        """Clothing is more than just a necessity; it's a way to express yourself and your style. Whether you're a technology enthusiast or working towards your goals, what you wear can reflect your unique personality and preferences. So, embrace your style and wear your passion!""",
                                    "date": "09:30 - 23/09/2023",
                                  },
                                );
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SectionSeeAll(
                        title: "You might also like",
                        titleAll: "See All",
                        titleColor: TColor.primaryText,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: stylesBaseArr.length,
                        itemBuilder: (context, index) {
                          var reObj = stylesBaseArr[index] as Map? ?? {};
                          return RecentlyViewCell(
                            rObj: reObj,
                            onPressed: () {},
                            onFavPressed: () {},
                            onLikePressed: () {},
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SectionSeeAll(
                        title: "Recently viewed items",
                        titleAll: "See All",
                        titleColor: TColor.primaryText,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: 0.87),
                        itemCount: listArr.length,
                        itemBuilder: (context, index) {
                          var pObj = listArr[index] as Map? ?? {};

                          return HomeStylesCell(
                            pObj: pObj,
                            onPressed: () {},
                            onFavPressed: () {},
                            onLikePressed: () {},
                          );
                        }),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: RoundButton(
                        title: "Add to Cart",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
