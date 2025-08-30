import 'package:flutter/material.dart';
import 'package:widget_app_structure/module13/crud%20app/screens/update-product.dart';

class product_items extends StatelessWidget {
  const product_items({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('${index + 1}'),
          ),
          title: Text('Product ${index + 1}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(' Product code ${index + 1 + 1000}'),
              Row(
                children: [
                  Text('Quantity: ${(index + 1) * 2}'),
                  SizedBox(width: 20),
                  Text('Price: \$${(index + 1) * 10}'),
                ],
              ),
            ],
          ),
          trailing: PopupMenuButton(
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
                    // onTap: () {
                    //   print(productoptions.values);
                    // },
                  ),
                ],
            onSelected: (productoptions selectedOptions) {
              print(selectedOptions.name);
              if (selectedOptions == productoptions.update) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateProduct()),
                );
              } else {
                print('delete');
              }
            },
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(indent: 70),
      itemCount: 10,
    );
  }
}

enum productoptions { update, delete }
