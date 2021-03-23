import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app_firebase/models/product_model.dart';
import 'package:shopping_app_firebase/widgets/custom_swiper.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = true; // DB user

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final ProductModel product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appBar(context, product),
              Container(
                padding: EdgeInsets.all(25.0),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("${product.title}",
                                maxLines: 1,
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          Text("\$${product.price}",
                              style: Theme.of(context).textTheme.headline5)
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0, bottom: 25.0),
                        child: Text(
                          "${product.description}",
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              height: size.height * 0.1,
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_bag_outlined,
                                      color: Colors.white),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      "Add to cart",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, ProductModel product) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Theme.of(context).focusColor,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.35,
            child: (product.images != null)
                ? CustomSwiper(product: product)
                : Image.asset("assets/images/no_photo.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    setState(
                      () => isFavorite = !isFavorite,
                    );
                  },
                  icon: isFavorite
                      ? FaIcon(FontAwesomeIcons.heart)
                      : FaIcon(FontAwesomeIcons.solidHeart),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getSizes(ProductModel product) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: product.sizes.length,
      itemBuilder: (BuildContext context, index) {
        final _size = product.sizes[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChoiceChip(
            selected: false,
            backgroundColor: Colors.transparent,
            label: Text("$_size", style: Theme.of(context).textTheme.subtitle2),
          ),
        );
      },
    );
  }
}
