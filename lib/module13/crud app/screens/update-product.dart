import 'package:flutter/material.dart';
import 'package:widget_app_structure/module13/crud%20app/widgets/product_add_form.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  bool _updateProductInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: product_add_entry_form(
            productNameController: _productNameController,
            productCodeController: _productCodeController,
            productQuantityController: _productQuantityController,
            unitPriceController: _unitPriceController,
            imageUrlController: _imageUrlController,
            formType: 'Update',
            onAddProductSubmit: _updateProduct,
            addProductInProgress: _updateProductInProgress,
          ),
        ),
      ),
    );
  }

  void _updateProduct() {}

  @override
  void dispose() {
    // TODO: implement dispose
    _productNameController.dispose();
    _productCodeController.dispose();
    _productQuantityController.dispose();
    _unitPriceController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
}
