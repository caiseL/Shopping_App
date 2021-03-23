import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<List> infoWidgets = [
    [
      "Women",
      "https://lagrace.com.ng/wp-content/uploads/2020/07/women_clothes_1-300x300.png"
    ],
    [
      "Men",
      "https://ae01.alicdn.com/kf/Hd93120976d0943509204f4457456ea78S/BROWON-Brand-Male-Pullover-Sweater-Men-Knitted-Striped-Slim-Sweaters-O-neck-Mens-Knitwear-Clothes-Men.jpg_Q90.jpg_.webp"
    ],
    [
      "Kids",
      "https://cdn.shopify.com/s/files/1/1389/2207/products/swshapebest2.png?v=1600276027"
    ],
    ["New collection", "https://ichef.bbci.co.uk/images/ic/448xn/p08psnqn.png"],
    [
      "Other categories",
      "https://ichef.bbci.co.uk/images/ic/448xn/p08psnqn.png"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            floating: true,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text("Categories",
                style: Theme.of(context).textTheme.headline5),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                child: Container(
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context)
                        .focusColor, // hover color or focus color
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Center(
                        child: Text(infoWidgets[index][0],
                            style: Theme.of(context).textTheme.subtitle1),
                      )),
                      Expanded(
                          child: FadeInImage(
                        placeholder: AssetImage("assets/images/loading.gif"),
                        image: NetworkImage(infoWidgets[index][1]),
                      ))
                    ],
                  ),
                ),
              );
            }, childCount: infoWidgets.length),
          ),
        ],
      ),
    );
  }
}
