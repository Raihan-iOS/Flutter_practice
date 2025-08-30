import 'package:flutter/material.dart';
import 'package:widget_app_structure/module13/crud%20app/screens/add_new_product.dart';
import 'package:widget_app_structure/module13/crud%20app/widgets/product_options.dart';

class ProductListHome extends StatefulWidget {
  const ProductListHome({super.key});

  @override
  State<ProductListHome> createState() => _ProductListHomeState();
}

class _ProductListHomeState extends State<ProductListHome> {
  @override
  Widget build(BuildContext context) {
    productoptions selectedOption = productoptions.update;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Market'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: product_items(),
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
