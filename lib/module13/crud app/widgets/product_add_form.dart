import 'package:flutter/material.dart';

class product_add_entry_form extends StatelessWidget {
  const product_add_entry_form({
    super.key,
    required String formType,
    required TextEditingController productNameController,
    required TextEditingController productCodeController,
    required TextEditingController productQuantityController,
    required TextEditingController unitPriceController,
    required TextEditingController imageUrlController,
    required this.onAddProductSubmit,
    required this.updateProductSubmit,
    required this.addProductInProgress,
  }) : _productNameController = productNameController,
       _productCodeController = productCodeController,
       _productQuantityController = productQuantityController,
       _unitPriceController = unitPriceController,
       _imageUrlController = imageUrlController,
       _formType = formType;

  final TextEditingController _productNameController;
  final TextEditingController _productCodeController;
  final TextEditingController _productQuantityController;
  final TextEditingController _unitPriceController;
  final TextEditingController _imageUrlController;
  final String _formType;
  final VoidCallback onAddProductSubmit;
  final VoidCallback updateProductSubmit;
  final bool addProductInProgress;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: _productNameController,
            decoration: InputDecoration(
              labelText: 'Product Name',
              hintText: 'Enter product name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty == true) {
                return 'Please enter product name';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: _productCodeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Product Code',
              hintText: 'Enter product code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty == true) {
                return 'Please enter product code';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: _productQuantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Product quantity',
              hintText: 'Enter product quantity',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty == true) {
                return 'Please enter product quantity';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: _unitPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Unit Price',
              hintText: 'Enter Unit Price',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty == true) {
                return 'Please enter unit price';
              }
              return null;
            },
          ),

          SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: _imageUrlController,
            decoration: InputDecoration(
              labelText: 'Image URL',
              hintText: 'Enter product url',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty == true) {
                return 'Please enter image url';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Visibility(
            visible: addProductInProgress == false,
            replacement: Center(child: CircularProgressIndicator()),
            child: FilledButton(
              onPressed: () {
                if (_formType == 'Add') {
                  onAddProductSubmit();
                } else {
                  updateProductSubmit();
                }
              },
              child: Text('$_formType Product'),
            ),
          ),
        ],
      ),
    );
  }
}
