import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_app_firebase/models/product_model.dart';

class ContainerCard extends StatelessWidget {
  final List<ProductModel> products;

  ContainerCard({@required this.products});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: products.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "details", arguments: product);
            print(product.id);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).focusColor,
                  ),
                  child: (product.images != null)
                      ? Hero(
                          tag: "${product.id}",
                          child: FadeInImage(
                            placeholder:
                                AssetImage("assets/images/defaultSF.png"),
                            fit: BoxFit.contain,
                            image: NetworkImage("${product.images[0]}"),
                          ),
                        )
                      : Image.asset("assets/images/no_photo.png"),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text("${product.title}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline6),
              Text(
                "\$${product.price}",
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 1,
              ),
            ],
          ),
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, 3.4),
      mainAxisSpacing: 32.0,
      crossAxisSpacing: 20.0,
    );
  }
}
