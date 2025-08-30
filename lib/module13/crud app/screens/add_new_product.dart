import 'package:flutter/material.dart';
import 'package:widget_app_structure/module13/crud%20app/widgets/product_add_form.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
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
            formType: 'Add',
          ),
        ),
      ),
    );
  }

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
