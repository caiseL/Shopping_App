import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/providers/product_provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  final provider = new ProductProvider();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    return Container();
    /*
    return FutureBuilder(
        future: provider.searchProducts(query),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data;
            return ListView(
                // Or a ListView.builder, it doesn't really matter that much. I think...
                children: products
                    .map((product) => ListTile(
                        leading: FadeInImage(
                          placeholder: AssetImage("assets/images/loading.gif"),
                          image: NetworkImage(product.images[0]),
                          width: 50.0,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          close(context, null);
                          Navigator.of(context)
                              .pushNamed("details", arguments: product);
                        },
                        title: Text(product.title),
                        subtitle: Text(product.price.toString())))
                    .toList());
          }
          return Container();
        });*/
  }
}
