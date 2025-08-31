import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:widget_app_structure/module13/crud%20app/screens/update-product.dart';
import 'package:widget_app_structure/module13/models/product_model.dart';

class Product_list extends StatelessWidget {
  Product_list({
    super.key,
    required this.products,
    required this.productDelete,
    required this.deleteInProgress,
  });

  final void Function(String id) productDelete;
  bool deleteInProgress = false;

  List<ProductModel> products = [];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: Image.network(
            width: 30,
            height: 30,
            product.img,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 30),
          ),
          title: Text(product.productName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(' Product code ${product.productCode}'),
              Row(
                children: [
                  Text('Quantity: ${(product.qty)}'),
                  SizedBox(width: 20),
                  Text('Price: \$${(product.unitPrice)}'),
                ],
              ),
            ],
          ),
          trailing: Visibility(
            visible: deleteInProgress == false,
            replacement: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            child: PopupMenuButton(
              itemBuilder:
                  (context) => [
                    PopupMenuItem(
                      value: productoptions.update,
                      child: Text('Update'),
                      // onTap: () {
                      //   print(productoptions.values);
                      // },
                    ),
                    PopupMenuItem(
                      value: productoptions.delete,
                      child: Text('Delete'),
                      onTap: () => productDelete(product.id),
                    ),
                  ],
              onSelected: (productoptions selectedOptions) {
                print(selectedOptions.name);
                if (selectedOptions == productoptions.update) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProduct(product: product),
                    ),
                  );
                } else {
                  print('delete');
                }
              },
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(indent: 70),
      itemCount: products.length,
    );
  }
}

enum productoptions { update, delete }
