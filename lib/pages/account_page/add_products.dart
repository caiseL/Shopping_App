import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app_firebase/models/product_model.dart';
import 'package:shopping_app_firebase/providers/product_provider.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final formKey = GlobalKey<FormState>();
  ProductModel product;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ProductProvider provider = ProductProvider();
  bool _isLoading = false;
  List<File> _files;
  List<Widget> _images;
  final picker = ImagePicker();

  @override
  @override
  void initState() {
    super.initState();
    product = ProductModel();
    _files = [];
    _images = [];
    _images.add(Padding(
      padding: EdgeInsets.only(top: 25.0),
      child: IconButton(
        onPressed: getImage,
        icon: Icon(Icons.add),
      ),
    ));
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(labelText: "Product name: "),
                      onSaved: (value) => (product.title = value),
                      validator: (value) =>
                          (value.length > 3) ? null : "Nombre muy corto",
                    ),
                    TextFormField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: "Product price: "),
                      validator: (value) =>
                          (num.tryParse(value) == null) ? "Solo números" : null,
                      onSaved: (value) => (product.price = double.parse(value)),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Product description: "),
                      onSaved: (value) => (product.description = value),
                      validator: (value) =>
                          (value.length > 3) ? null : "Descripción muy corta",
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text("Add images (optional)",
                        style: Theme.of(context).textTheme.headline6),
                    Column(
                      children: _images,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).accentColor,
                          onPrimary: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.save),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Guardar"),
                          ],
                        ),
                        onPressed: (_isLoading) ? null : _submit),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future getImage() async {
    final size = MediaQuery.of(context).size;
    if (_images.length < 6) {
      File _image;
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          _files.add(_image);
          _images.insert(
            _images.length - 1,
            Image.file(
              _image,
              width: size.width * 0.5,
              scale: 0.25,
            ),
          );
        } else {
          print('No image selected.');
        }
      });
    } else if (_images.length == 6) {
      ScaffoldMessenger.of(context)
          .showSnackBar(mostrarSnackbar("You can only add 5 photos"));
    }
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      _isLoading = true;
    });
    List<String> images = [];
    if (_files != null) {
      for (int i = 0; i < _files.length; i++) {
        String resp = await provider.uploadImage(_files[i]);
        images.add(resp);
      }
    }
    product.images = images;
    provider.makeAProduct(product);

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(mostrarSnackbar("Product added"));
    Navigator.of(context).pushReplacementNamed("/");
  }

  Widget mostrarSnackbar(String text) {
    return SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 1500),
    );
  }
}
