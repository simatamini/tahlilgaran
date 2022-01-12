import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Product/mainProduct.dart';
import 'Product/product_details.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,

      getPages: [
      GetPage(name: '/product', page: ()=>ProductDetails()),
        GetPage(name: '/mainproduct', page: ()=>mainProduct()),
   ],
    initialRoute: '/product',
  ));
}
