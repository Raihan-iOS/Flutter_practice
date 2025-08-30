import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:widget_app_structure/module13/crud%20app/widgets/product_add_form.dart';
import 'package:widget_app_structure/module13/crud%20app/widgets/snacksBarMessage.dart';

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
  bool _productAddProgress = false;

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
          padding: const EdgeInsets.all(20.0),
          child: product_add_entry_form(
            productNameController: _productNameController,
            productCodeController: _productCodeController,
            productQuantityController: _productQuantityController,
            unitPriceController: _unitPriceController,
            imageUrlController: _imageUrlController,
            formType: 'Add',
            onAddProductSubmit: _addProduct,
            addProductInProgress: _productAddProgress,
          ),
        ),
      ),
    );
  }

  Future<void> _addProduct() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }

    setState(() {
      _productAddProgress = true;
    });
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/CreateProduct');
    print(uri);
    int totalPrice = int.parse(_unitPriceController.text.trim());
    int.parse(_productQuantityController.text.trim());

    Map<String, dynamic> reqBody = {
      "ProductName": _productNameController.text.trim(),
      "ProductCode": int.parse(_productCodeController.text.trim()),
      "Qty": int.parse(_productQuantityController.text.trim()),
      "UnitPrice": int.parse(_unitPriceController.text.trim()),
      "Img": _imageUrlController.text.trim(),
      "TotalPrice": totalPrice,
    };
    print(reqBody);
    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},

      body: json.encode(reqBody),
    );
    print(response.statusCode);
    print(response.body);

    setState(() {
      _productAddProgress = false;
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      var resBody = json.decode(response.body);
      print(resBody);
      _clearFields();
      FocusScope.of(context).unfocus();
      snacksBarMessage('Product added successfully', context);
    } else {
      FocusScope.of(context).unfocus();
      String errorMsg = reqBody['data'];
      snacksBarMessage(errorMsg, context);
    }
  }

  void _clearFields() {
    _productNameController.clear();
    _productCodeController.clear();
    _productQuantityController.clear();
    _unitPriceController.clear();
    _imageUrlController.clear();
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
