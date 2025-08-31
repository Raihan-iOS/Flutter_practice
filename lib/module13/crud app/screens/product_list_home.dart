import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:widget_app_structure/module13/crud%20app/Utils/Urls.dart';
import 'package:widget_app_structure/module13/crud%20app/screens/add_new_product.dart';
import 'package:widget_app_structure/module13/crud%20app/widgets/Product_list.dart';
import 'package:widget_app_structure/module13/crud%20app/widgets/snacksBarMessage.dart';
import 'package:widget_app_structure/module13/models/product_model.dart';

class ProductListHome extends StatefulWidget {
  const ProductListHome({super.key});

  @override
  State<ProductListHome> createState() => _ProductListHomeState();
}

class _ProductListHomeState extends State<ProductListHome> {
  final List<ProductModel> _productsList = [];
  bool _getProductInProgress = false;
  bool _deleteInProgress = false;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    setState(() {
      _productsList.clear();
      _getProductInProgress = true;
    });
    Uri uri = Uri.parse(Urls.getAllProducts);

    Response response = await get(uri);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodedJson = jsonDecode(response.body);
      for (Map<String, dynamic> productJson in decodedJson['data']) {
        ProductModel product = ProductModel.fromJson(productJson);

        _productsList.add(product);

        setState(() {
          _getProductInProgress = false;
        });
      }
    } else {
      snacksBarMessage('Error', context);
    }
  }

  Future<void> _deleteProduct(String id) async {
    setState(() {
      _deleteInProgress = true;
    });
    Uri uri = Uri.parse(Urls.deleteProduct(id));
    debugPrint(uri.toString());

    Response response = await get(uri);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodedJson = jsonDecode(response.body);
      snacksBarMessage(decodedJson['status'], context);

      setState(() {
        _deleteInProgress = false;
        _fetchProducts();
      });
    } else {
      snacksBarMessage('Error', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    productoptions selectedOption = productoptions.update;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Market'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              _fetchProducts();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Visibility(
        visible: _getProductInProgress == false,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Product_list(
          products: _productsList,
          productDelete: _deleteProduct,
          deleteInProgress: _deleteInProgress,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewProduct()),
          );
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
