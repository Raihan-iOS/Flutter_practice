// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:widget_app_structure/module13/crud%20app/Utils/Urls.dart';

import 'package:widget_app_structure/module13/crud%20app/widgets/product_add_form.dart';
import 'package:widget_app_structure/module13/crud%20app/widgets/snacksBarMessage.dart';
import 'package:widget_app_structure/module13/models/product_model.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key, required this.product});
  final ProductModel product;

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
  @override
  void initState() {
    super.initState();
    _productNameController.text = widget.product.productName;
    _productCodeController.text = widget.product.productCode.toString();
    _productQuantityController.text = widget.product.qty.toString();
    _unitPriceController.text = widget.product.unitPrice.toString();
    _imageUrlController.text = widget.product.img;
  }

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
            onAddProductSubmit: () {},
            addProductInProgress: _updateProductInProgress,
            updateProductSubmit: _updateProduct,
          ),
        ),
      ),
    );
  }

  Future<void> _updateProduct() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }

    setState(() {
      _updateProductInProgress = true;
    });
    Uri uri = Uri.parse(Urls.updateProduct(widget.product.id));

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

    var resBody = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(resBody);
      _clearFields();
      FocusScope.of(context).unfocus();
      snacksBarMessage('Product added successfully', context);
      Navigator.pop(context);
    } else {
      FocusScope.of(context).unfocus();
      String errorMsg = resBody['data'];
      snacksBarMessage(errorMsg, context);
    }

    setState(() {
      _updateProductInProgress = false;
    });
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
