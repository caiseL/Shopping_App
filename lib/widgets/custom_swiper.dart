import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shopping_app_firebase/models/product_model.dart';

class CustomSwiper extends StatelessWidget {
  final ProductModel product;
  const CustomSwiper({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        //isFavorite;
      },
      child: Swiper(
        index: 0,
        itemCount: product.images.length,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
              color: Theme.of(context).backgroundColor,
              activeColor: Colors.black),
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            print(product.id);
            return Hero(
              tag: product.id,
              child: FadeInImage(
                placeholder: AssetImage("assets/images/no_photo.png"),
                image: NetworkImage("${product.images[index]}"),
              ),
            );
          }
          return FadeInImage(
            placeholder: AssetImage("assets/images/no_photo.png"),
            image: NetworkImage("${product.images[index]}"),
          );
        },
      ),
    );
  }
}
